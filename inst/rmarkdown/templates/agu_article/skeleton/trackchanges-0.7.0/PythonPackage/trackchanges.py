#
# This file is part of TrackChanges
# Copyright 2009 Novimir Antoniuk Pablant
#
# TrackChanges is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# TrackChanges is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with TrackChanges.  If not, see <http://www.gnu.org/licenses/>.
#
########################################################################
# trackchanges.py
########################################################################
# This program is a way to easly accept or regect changes made in
# latex using the trackchanges.sty package.
# 
# To find the latest versions of this software and of the latex style
# file go to http://trackchanges.sourceforge.net/
#
#
#
# Written: 2009-03-09 by Novimir Pablant
#
# Version Log:
# 0.1.0 - 2009-03-09 - novi
# 0.1.1 - 2009-03-14 - novi - Now properly handles nested brackets.
#                             Added some error handling.
#                             Editing in the main pane is now possible.
#                             Fixed a major bug with how the mutex
#                             was being handled.
# 0.1.2 - 2009-03-17 - novi - Better error handling. Now will close
#                             mutex on error.  Error dialogs.
#                             Saving does not stop editing.
#       - 2009-03-20 - novi - Will ask about save on  exit.
#                             Added about dialog.
#       - 2009-04-05 - novi - Added a help dialog.  Fix regexes.
#                             Added the refneeded command.
#       - 2009-04-22 - novi - Changed path to help files.
#                  
########################################################################
#
# Current bugs/limitations:
#
# - When the search/edit is paused because the main window is being
#   edited, the old, new & note planes need to be greyed out.
#   Also do I want edits made in those boxes to be retained?
#
# - Scroll location is generally set so that only the first line of 
#   edit can be seen without scrolling.
#
# - If the help browser is opened, then when TrackChanges is closed
#   A warning about a QWaitCondition is displayed.  This appears
#   to be a Qt/PyQt bug.
#
# ----------------------------------------------------------------------
# Stuff to do
#
# - Enable syntax highlighting.
#
# - Highlight the previous edit.
#
# - Add a recursive mode.  In this mode TrackChanges will search for
#   \include or \input, and then open those files for editing in turn.
#
# - Try to inteligently deal with white space, especially in the case
#   of the \remove command.  What I find often happens is that when
#   a \remove{is used before a period or comma}, an extra space can be
#   left after the text is removed.
#
# - The windows binary is really big.  I might be able to shrink this
#   by limiting what is imported. Or something.  10MB is ridiculus.
#
# - Well the Mac binary is even more riduclus 45MB.  Yuck.
########################################################################

import sys
import os
import re
import traceback
from PyQt4 import QtGui
from PyQt4 import QtCore


import datetime

# Initialize the Qt application
app = QtGui.QApplication(sys.argv)

__version__ = (0,1,2,'Beta')
__version_date__ = datetime.date(2009,4,22)


# ======================================================================
# ======================================================================
# Setup the main driving class.
#
# This class handles the folowing things:
# - Initializes program
# - Initializes gui
# - Loads/saves TeX files
# - Starts main search/editing thread.
# - Handles signals betten thread and gui.
# - Handles higlighting of main window
# - Keeps original and new TeX files in sync.

class TrackChanges(QtCore.QObject):
    def __init__(self, parent=None):
        global ui_base_window
        global trackchanges_main
        
        trackchanges_main = self

        QtCore.QObject.__init__(self,parent)

        ui_base_window = UiBaseWindow(None)
        ui_base_window.show()

        # Setup some defaults
        self.current_path = r"/"

        # Setup regex patters
        self.setupRegex()

        # Setup the wait conditions for the seach/edit thread
        self.button_wait = QtCore.QWaitCondition()
        self.text_wait = QtCore.QWaitCondition()
        self.current_action = ''

        self.old_text = ''
        self.new_text = ''
        self.search_edit_thread_active = False

        # This is used to keep track of the current search position
        self.search_position = 0

        # Use this to keep track of whether the current 
        # document has been modified
        self.doc_saved = True

        # Setup some error tracking. 
        # This is used to help with saving actions.
        self.hadError = False

        # Set up some options
        self.debug = 1


    def exit(self):

        # Put the loop here incase the save gets canceled.
        while True:
            if not self.doc_saved:
                result = self.messageBoxDocModifed()

                if result == QtGui.QMessageBox.Save:
                    self.saveTexFile()
                    continue
                elif result == QtGui.QMessageBox.Discard:
                    output = 'close'
                    break
                elif result == QtGui.QMessageBox.Cancel:
                    output = 'cancel'
                    break
            else:
                output = 'close'
                break

        return output


    def setupRegex(self):
        """
        Here the regular expression patterns needed for the search are setup.
        
        A pattern is set up for each of the six commands, then all of the 
        patterns are joined.

        These patterns will optionally match the editor name.  spaces are
        allowed between the command and any brackets.
        """

        self.command_names = ['note', 'add', 'remove', 'annote', 'change', 'refneeded']
        self.regex_strings = {}
        self.regex_strings['note'] = \
            r"(?P<full_note>(?P<type_note>\\note) *(?P<name_note>\[.*?\])?(?= *\{))"

        self.regex_strings['add'] = \
            r"(?P<full_add>(?P<type_add>\\add) *(?P<name_add>\[.*?\])?(?= *\{))"

        self.regex_strings['remove'] = \
            r"(?P<full_remove>(?P<type_remove>\\remove) *(?P<name_remove>\[.*?\])?(?= *\{))"

        self.regex_strings['refneeded'] = \
            r"(?P<full_refneeded>(?P<type_refneeded>\\refneeded) *(?P<name_refneeded>\[.*?\])?(?= *\{))"

        self.regex_strings['annote'] = \
            r"(?P<full_annote>(?P<type_annote>\\annote) *(?P<name_annote>\[.*?\])?(?= *\{))"

        self.regex_strings['change'] = \
            r"(?P<full_change>(?P<type_change>\\change) *(?P<name_change>\[.*?\])?(?= *\{))"

        self.regex_pattern = re.compile('|'.join(self.regex_strings.values()))

    def doItBaby(self):
        """
        Here the main seach/edit tread is initialized, connected and started.

        The thread uses the wait condition: self.button_wait.
        Once woken it checks the string: self.current_action.
        The value of that string determies the action that the thread will take.

        The thread emits a number of signal that are used to control the
        main program and gui.
        """

        self.decide_changes_thread = DecideChangesThread()

        self.connect(self.decide_changes_thread
                     ,QtCore.SIGNAL('setTextHighlight')
                     ,self.setTextHighlight)
        self.connect(self.decide_changes_thread
                     ,QtCore.SIGNAL('removeTextHighlight')
                     ,self.removeTextHighlight)

        self.connect(self.decide_changes_thread
                     ,QtCore.SIGNAL('setTextOld')
                     ,self.setTextOld)
        self.connect(self.decide_changes_thread
                     ,QtCore.SIGNAL('setTextNew')
                     ,self.setTextNew)
        self.connect(self.decide_changes_thread
                     ,QtCore.SIGNAL('setTextNote')
                     ,self.setTextNote)

        self.connect(self.decide_changes_thread
                     ,QtCore.SIGNAL('setTypeAnnote')
                     ,self.setTypeAnnote)
        self.connect(self.decide_changes_thread
                     ,QtCore.SIGNAL('setTypeNote')
                     ,self.setTypeNote)
        self.connect(self.decide_changes_thread
                     ,QtCore.SIGNAL('setTypeChange')
                     ,self.setTypeChange)

        self.connect(self.decide_changes_thread
                     ,QtCore.SIGNAL('done')
                     ,self.doneDeciding)
        self.connect(self.decide_changes_thread
                     ,QtCore.SIGNAL('cancel')
                     ,self.cancelDeciding)
        self.connect(self.decide_changes_thread
                     ,QtCore.SIGNAL('texSyntaxError')
                     ,self.handleTexSyntaxError)
        self.connect(self.decide_changes_thread
                     ,QtCore.SIGNAL('error')
                     ,self.handleError)

        self.connect(self.decide_changes_thread
                     ,QtCore.SIGNAL('removeText')
                     ,self.removeText)
        self.connect(self.decide_changes_thread
                     ,QtCore.SIGNAL('addText')
                     ,self.addText)
        self.connect(self.decide_changes_thread
                     ,QtCore.SIGNAL('replaceText')
                     ,self.replaceText)

        self.search_edit_thread_active = True

        self.decide_changes_thread.start()



    # ------------------------------------------------------------------
    # Begin file loading/saving routines
    # ------------------------------------------------------------------
    def loadTexFile(self):

        # Put the loop here incase the save gets canceled.
        while True:
            if not self.doc_saved:
                result = self.messageBoxDocModifed()

                if result == QtGui.QMessageBox.Save:
                    self.saveTexFile()
                    continue
                elif result == QtGui.QMessageBox.Discard:
                    break
                elif result == QtGui.QMessageBox.Cancel:
                    return
            else:
                break

        # If the thread is active then cancel the current edits.
        # This should be fine since we just checked if the document
        # was modified yet.
        if self.search_edit_thread_active:
            self.cancel()

        # Choose the file.
        self.tex_filename = self.chooseTexFileLoad(QtGui.QFileDialog.ExistingFile)

        if self.tex_filename:
            # Read the file.
            with open(self.tex_filename) as tex_file:
                self.tex_orig = tex_file.read()

            self.tex_new = self.tex_orig

            self.doc_saved = True

            # Reset the search position
            self.search_position = 0

            # Display the file in the main window.
            ui_central_widget.text_main.setPlainText(self.tex_new)

            # Start the main loop.
            self.doItBaby()

    def chooseTexFileLoad(self, filemode=None, directory=None):
        text = 'Choose the Tex file to edit.'

        if not filemode:
            filemode = QtGui.QFileDialog.AnyFile

        if not directory:
            directory = self.current_path

        file_dialog = QtGui.QFileDialog(ui_base_window, text, directory)

        file_dialog.setFileMode(filemode)
        file_dialog.setAcceptMode(QtGui.QFileDialog.AcceptOpen)

        if file_dialog.exec_():
            filenames = file_dialog.selectedFiles()
            filename = str(filenames[0])
            
            # Save the current path.
            if filename:
                self.current_path = os.path.dirname(filename)

            return filename
        else:
            return ''

    def saveTexFile(self):
        
        filename = self.chooseTexFileSave(directory=self.tex_filename)

        if filename:
            # Read the file.
            with open(filename, 'w') as tex_file:
                tex_file.write(self.tex_new)

            self.doc_saved = True


    def chooseTexFileSave(self, filemode=None, directory=None):
        text = 'Choose the Tex file to save to.'

        if not filemode:
            filemode = QtGui.QFileDialog.AnyFile

        if not directory:
            directory = self.current_path

        file_dialog = QtGui.QFileDialog(ui_base_window, text, directory)

        file_dialog.setFileMode(filemode)
        file_dialog.setAcceptMode(QtGui.QFileDialog.AcceptSave)
        file_dialog.setConfirmOverwrite(True)

        if file_dialog.exec_():
            filenames = file_dialog.selectedFiles()
            filename = str(filenames[0])
            
            # Save the current path.
            if filename:
                self.current_path = os.path.dirname(filename)

            return filename
        else:
            return ''

    def messageBoxDocModifed(self):
        """This dialog is used if a file load is attempted but
        the current document is not saved.
        """
        messageBox = QtGui.QMessageBox()

        messageBox.setText("The current document has been modified.")
        messageBox.setInformativeText("Do you want to save your changes.")
        messageBox.setStandardButtons(QtGui.QMessageBox.Save |
                                      QtGui.QMessageBox.Discard |
                                      QtGui.QMessageBox.Cancel)

        messageBox.setDefaultButton(QtGui.QMessageBox.Save)

        result = messageBox.exec_()

        return result


            

    # ------------------------------------------------------------------
    # Begin routines that control the search/edit thread.
    # ------------------------------------------------------------------
    #
    # These routines will be called eithen by the gui or the
    # main program to control the behavior of the thread.
    #
    # For all of the routine two actions must be taken.
    # 1. self.current_action must be set
    # 2. self.button_wait.wakeAll() must be called
    #
    # ------------------------------------------------------------------


    def keepOld(self):
        self.setStatusText('Keep old text.')

        self.current_action = 'keep_old'

        # Get the current text
        self.new_text = str(ui_central_widget.text_new.toPlainText())
        self.old_text = str(ui_central_widget.text_old.toPlainText())

        # Wake up the thread
        self.button_wait.wakeAll()

    def keepNew(self):
        self.setStatusText('Keep new text.')

       # Get the current text
        self.new_text = str(ui_central_widget.text_new.toPlainText())
        self.old_text = str(ui_central_widget.text_old.toPlainText())

        self.current_action = 'keep_new'

        # Wake up the thread
        self.button_wait.wakeAll()

    def removeNote(self):
        self.setStatusText('Remove Note.')

       # Get the current text
        self.new_text = str(ui_central_widget.text_new.toPlainText())
        self.old_text = str(ui_central_widget.text_old.toPlainText())

        self.current_action = 'remove_note'

        # Wake up the thread
        self.button_wait.wakeAll()

    def cancel(self):
        self.setStatusText('Canceling Now.')

        self.current_action = 'cancel'

        # Wake up the thread
        self.button_wait.wakeAll()
    
    def skip(self):
        self.setStatusText('Skip.')

        self.current_action = 'skip'

        # Wake up the thread
        self.button_wait.wakeAll()

    def skipAll(self):
        self.setStatusText('Skip all remaining.')

        self.current_action = 'skip all'

        # Wake up the thread
        self.button_wait.wakeAll()

    def resume(self):
        self.setStatusText('Resuming.')
           
        self.tex_new = ui_central_widget.text_main.toPlainText()
            
        self.current_action = 'resume'

        # Wake up the thread
        self.button_wait.wakeAll()

    def textChangeByUser(self, selection_start, selection_end, length_diff):
        # For the time being I am treating the TrackChangesTextEdit 
        # panel mostly as a black box.
        # When an edit is done it will return the section before
        # and after the edit as well and the change in document length.  
        #
        # From this I can figure out where the new search positon needs to be.
        
        self.doc_saved = False

        self.setTypeMainText()

        if self.search_position < selection_start[0]:
            # Current search positon is before the edit.
            pass
        elif self.search_position > selection_start[1]:
            # Current search positon is after the edit.
            self.search_position -= length_diff
        else:
            # Current search positon is in the middle of a selection,
            # or at the inital cursor positon.
            if selection_start[0] <= selection_end[0]:
                new_position = selection_start[0]
            else:
                new_position = selection_end[0]
            self.search_position = new_position
            

    # ------------------------------------------------------------------
    # Begin routines that are controled by the search/edit thread.
    # ------------------------------------------------------------------
    #
    # These are the routine that are controled (using signals) by
    # the main search/edit thread.
    #
    # These routines should only be called by the thread.
    #
    # ------------------------------------------------------------------

    def removeText(self, span):

        self.doc_saved = False

        if self.search_position <= span[0]:
            # Current search positon is before the remove.
            pass
        elif self.search_position > span[1]:
            # Current search positon is after the edit.
            self.search_position += span[0] - span[1]
        else:
            # Current search positon is in the middle of the removed text
            self.search_position = span[0]

        ui_central_widget.text_main.setUserEvent(False)

        cursor = ui_central_widget.text_main.textCursor()
        cursor.setPosition(span[0])
        cursor.setPosition(span[1], QtGui.QTextCursor.KeepAnchor)
        cursor.removeSelectedText()

        self.tex_new = ui_central_widget.text_main.toPlainText()
        self.text_wait.wakeAll()
        

    def addText(self, location, added_text):

        self.doc_saved = False

        if self.search_position <= location:
            # Current search positon is before the add.
            pass
        else:
            # Current search positon is after the add.
            self.search_position += len(added_text)

        ui_central_widget.text_main.setUserEvent(False)

        cursor = ui_central_widget.text_main.textCursor()
        cursor.setPosition(location)
        cursor.insertText(added_text)

        self.tex_new = ui_central_widget.text_main.toPlainText()
        self.text_wait.wakeAll()

    def replaceText(self, span, new_text):

        self.doc_saved = False

        if self.search_position <= span[0]:
            # Current search positon is before the remove.
            pass
        elif self.search_position > span[1]:
            # Current search positon is after the edit.
            self.search_position += (span[0] - span[1]) + len(new_text)
        else:
            # Current search positon is in the middle of the removed text
            self.search_position = span[0]

        ui_central_widget.text_main.setUserEvent(False)

        cursor = ui_central_widget.text_main.textCursor()
        cursor.setPosition(span[0])
        cursor.setPosition(span[1], QtGui.QTextCursor.KeepAnchor)
        cursor.removeSelectedText()
        cursor.insertText(new_text)

        self.tex_new = ui_central_widget.text_main.toPlainText()
        self.text_wait.wakeAll()   

    def doneDeciding(self):
        self.search_edit_thread_active = False

        if not self.doc_saved:
            self.saveTexFile()

        self.setTextOld()
        self.setTextNew()
        self.setTextNote()

        self.setTypeNone()

    def cancelDeciding(self):
        self.search_edit_thread_active = False

        self.setTextOld()
        self.setTextNew()
        self.setTextNote()

        self.setTypeNone()


    # ------------------------------------------------------------------
    # Begin error handling routines.
    # ------------------------------------------------------------------
    #
    #
    # ------------------------------------------------------------------

    def handleError(self): 
        # This should pop up a dialog letting the user know that a general error
        # was found and asking what action to take.

        self.setStatusText('Error.')

        print 'Encountered error.'

        result = self.messageBoxError()

        self.current_action = 'cancel'

        # Wake up the thread
        self.button_wait.wakeAll()

        raise Error

    def handleTexSyntaxError(self, span): 
        # This should pop up a dialog letting the user know that a syntax error
        # was found and asking what action to take.

        self.setStatusText('TeX Syntax Error.')

        print 'Parsing error encountered.' 

        self.setTextHighlight(span)

        if not self.doc_saved:
            result = self.messageBoxSyntaxErrorSave()

            if result == QtGui.QMessageBox.Save:
                self.saveTexFile()
        else:
            result = self.messageBoxSyntaxError()
                

        self.current_action = 'cancel'

        # Wake up the thread
        self.button_wait.wakeAll()

        raise TexSyntaxError

    def messageBoxError(self):
        """This dialog is used if an error is encountered.
        It will provide no options to save.
        """
        messageBox = QtGui.QMessageBox()

        messageBox.setText("An error was encountered.")
        messageBox.setInformativeText("Please restart TrackChanges.\nIt may be possible to save the current changes from file->save.")

        messageBox.setStandardButtons(QtGui.QMessageBox.Ok)

        messageBox.setDefaultButton(QtGui.QMessageBox.Ok)

        result = messageBox.exec_()

        return result  

    def messageBoxSyntaxErrorSave(self):
        """This dialog is used if an error is encountered.
        It will give the option to save the currect document.
        """
        messageBox = QtGui.QMessageBox()

        messageBox.setText("A parsing error was encountered.")
        messageBox.setInformativeText("Do you want to save your changes.")
        messageBox.setDetailedText("This error was most likely due to either mismatched bracket, or to a malformed edit command.\n\nThese syntax errors will need to be fixed before the file can be used with TrackChanges.")

        messageBox.setStandardButtons(QtGui.QMessageBox.Save |
                                      QtGui.QMessageBox.Discard)

        messageBox.setDefaultButton(QtGui.QMessageBox.Save)

        result = messageBox.exec_()

        return result

    def messageBoxSyntaxError(self):
        """This dialog is used if an error is encountered.
        It will give the option to save the currect document.
        """
        messageBox = QtGui.QMessageBox()

        messageBox.setText("A parsing error was encountered.")
        messageBox.setDetailedText("This error was most likely due to either mismatched bracket, or to a malformed edit command.\n\nThese syntax errors will need to be fixed before the file can be used with TrackChanges.")
        messageBox.setStandardButtons(QtGui.QMessageBox.Ok)

        messageBox.setDefaultButton(QtGui.QMessageBox.Ok)

        result = messageBox.exec_()

        return result


    # ------------------------------------------------------------------
    # Begin routines that controll the gui
    # ------------------------------------------------------------------
    #
    # These routines control the gui. 
    # They can be called either from the main program or from the
    # from the search/edit thread (using signals).
    #
    # ------------------------------------------------------------------

    def setStatusText(self, status_text):
        ui_base_window.statusBar().showMessage(status_text)

    def setTextOld(self, span=None):
        if span:
            text = self.tex_new[span[0]+1:span[1]-1]
        else:
            text = ''

        ui_central_widget.text_old.setPlainText(text)

    def setTextNew(self, span=None):
        if span:
            text = self.tex_new[span[0]+1:span[1]-1]
        else:
            text = ''

        ui_central_widget.text_new.setPlainText(text)

    def setTextNote(self, span=None):
        if span:
            text = self.tex_new[span[0]+1:span[1]-1]
        else:
            text = ''

        ui_central_widget.text_note.setPlainText(text)


    def setTypeAnnote(self):
        ui_central_widget.button_resume.setDisabled(True)
        ui_central_widget.button_old.setDisabled(True)
        ui_central_widget.button_new.setDisabled(True)
        ui_central_widget.button_note.setDisabled(False)
        ui_central_widget.button_skip.setDisabled(False)

        ui_central_widget.text_new.setReadOnly(True)
        ui_central_widget.text_old.setReadOnly(False)

    def setTypeNote(self):
        ui_central_widget.button_resume.setDisabled(True)
        ui_central_widget.button_old.setDisabled(True)
        ui_central_widget.button_new.setDisabled(True)
        ui_central_widget.button_note.setDisabled(False)
        ui_central_widget.button_skip.setDisabled(False)

        ui_central_widget.text_new.setReadOnly(True)
        ui_central_widget.text_old.setReadOnly(True)

    def setTypeChange(self):
        ui_central_widget.button_resume.setDisabled(True)
        ui_central_widget.button_old.setDisabled(False)
        ui_central_widget.button_new.setDisabled(False)
        ui_central_widget.button_note.setDisabled(True)
        ui_central_widget.button_skip.setDisabled(False)

        ui_central_widget.text_new.setReadOnly(False)
        ui_central_widget.text_old.setReadOnly(False)

    def setTypeMainText(self):
        ui_central_widget.button_resume.setDisabled(False)
        ui_central_widget.button_old.setDisabled(True)
        ui_central_widget.button_new.setDisabled(True)
        ui_central_widget.button_note.setDisabled(True)
        ui_central_widget.button_skip.setDisabled(True)

        ui_central_widget.text_new.setReadOnly(True)
        ui_central_widget.text_old.setReadOnly(True)

    def setTypeNone(self):
        ui_central_widget.button_resume.setDisabled(True)
        ui_central_widget.button_old.setDisabled(True)
        ui_central_widget.button_new.setDisabled(True)
        ui_central_widget.button_note.setDisabled(True)
        ui_central_widget.button_skip.setDisabled(True)

        ui_central_widget.text_new.setReadOnly(True)
        ui_central_widget.text_old.setReadOnly(True)

    def removeTextHighlight(self):
        """Removes all background colors from the text."""

        # Set this so that the text widget does
        # not try update the search position.
        ui_central_widget.text_main.setUserEvent(False)

        text_length = ui_central_widget.text_main.getTextLength()

        cursor = ui_central_widget.text_main.textCursor()
        cursor.setPosition(0)
        cursor.setPosition(text_length, QtGui.QTextCursor.KeepAnchor)

        format = QtGui.QTextCharFormat()
        format.setBackground(QtGui.QBrush(QtCore.Qt.NoBrush))
        cursor.mergeCharFormat(format)


    def setTextHighlight(self, span, color=(255,255,0)):
        """Adds a background to the text specifed by span.
        Default Color is yellow.
        """

        # Set this so that the text widget does
        # not try update the search position.
        ui_central_widget.text_main.setUserEvent(False)

        cursor = ui_central_widget.text_main.textCursor()
        cursor.setPosition(span[0])
        cursor.setPosition(span[1], QtGui.QTextCursor.KeepAnchor)

        format = QtGui.QTextCharFormat()
        format.setBackground(QtGui.QBrush(QtGui.QColor(color[0],color[1],color[2])))
        cursor.mergeCharFormat(format)

        cursor.setPosition(span[0])
        ui_central_widget.text_main.setTextCursor(cursor)

        

#=======================================================================
#=======================================================================
# This is the thread where the main work is done
#
# This needs a little clean up.  
# Right now this is one big long script.
# I should add some functions and stuff to make it easyer to read.
class DecideChangesThread(QtCore.QThread):
    """This is the main thread where searching, editing and 
    accepting/rejecting of comments is done.
    """
    def __init__(self, parent=None):
        global trackchanges_main
        QtCore.QThread.__init__(self, parent)

        self.mutex = QtCore.QMutex()

    def run(self):
        with QtCore.QMutexLocker(self.mutex) as locker:
            while True:
                try:
                    # Find the next command
                    match = trackchanges_main.regex_pattern.search(
                        trackchanges_main.tex_new
                        ,trackchanges_main.search_position)

                    if not match:
                        # No commands found
                        break

                    # Figure out which command was found
                    for self.command in trackchanges_main.command_names:
                        if match.group('type_'+self.command):
                            break

                    # Find the first set of brackets
                    try:
                        span_arg1 = findInnerSpan(
                            trackchanges_main.tex_new
                            ,('{','}')
                            ,match.end('full_'+self.command))

                        # Check that there is nothing but white space between the
                        # command head and the brackets.
                        if span_arg1[0] != match.end('full_'+self.command):
                            if not isWhiteSpace(trackchanges_main.tex_new[
                                    match.end('full_'+self.command):span_arg1[0]]):
                                raise TexSyntaxError

                        span_full = (match.start('full_'+self.command), span_arg1[1])
                    except (EndOfStringError, IndexError):
                        # Something went wrong with the search.
                        raise TexSyntaxError

                    # Find the second set of brackets
                    if self.command in ['annote','change']:
                        try:
                            span_arg2 = findInnerSpan(
                                trackchanges_main.tex_new
                                ,('{','}')
                                ,span_arg1[1])

                            # Check that there is nothing but white space between the
                            # first and second sets of brackets.
                            if span_arg2[0] != span_arg1[1]:
                                if not isWhiteSpace(trackchanges_main.tex_new[
                                        span_arg1[1]:span_arg2[0]]):
                                    raise TexSyntaxError

                            span_full = (match.start('full_'+self.command), span_arg2[1])
                        except (EndOfStringError, IndexError):
                            # Something went wrong with the search.
                            raise TexSyntaxError



                    # Highlight the matched text
                    self.emit(QtCore.SIGNAL('setTextHighlight')
                              ,span_full)

                    # Update the gui.
                    if self.command in ['note', 'refneeded']:
                        self.emit(QtCore.SIGNAL('setTypeNote'))
                        self.emit(QtCore.SIGNAL('setTextOld'))
                        self.emit(QtCore.SIGNAL('setTextNew'))
                        self.emit(QtCore.SIGNAL('setTextNote'), span_arg1)
                    elif self.command == 'add':
                        self.emit(QtCore.SIGNAL('setTypeChange'))
                        self.emit(QtCore.SIGNAL('setTextOld'))
                        self.emit(QtCore.SIGNAL('setTextNew'), span_arg1)
                        self.emit(QtCore.SIGNAL('setTextNote'))
                    elif self.command == 'remove':
                        self.emit(QtCore.SIGNAL('setTypeChange'))
                        self.emit(QtCore.SIGNAL('setTextOld'), span_arg1)
                        self.emit(QtCore.SIGNAL('setTextNew'))
                        self.emit(QtCore.SIGNAL('setTextNote'))
                    elif self.command == 'annote':
                        self.emit(QtCore.SIGNAL('setTypeAnnote'))
                        self.emit(QtCore.SIGNAL('setTextOld'), span_arg1)
                        self.emit(QtCore.SIGNAL('setTextNew'))
                        self.emit(QtCore.SIGNAL('setTextNote'), span_arg2)
                    elif self.command == 'change':
                        self.emit(QtCore.SIGNAL('setTypeChange'))
                        self.emit(QtCore.SIGNAL('setTextOld'), span_arg1)
                        self.emit(QtCore.SIGNAL('setTextNew'), span_arg2)
                        self.emit(QtCore.SIGNAL('setTextNote'))
                    else:
                        raise Error
                    

                    print '%03d-%03d:%s: %s'%(
                        span_full[0]
                        ,span_full[1]
                        ,match.group('type_'+self.command)
                        ,trackchanges_main.tex_new[span_full[0]:span_full[1]])

                # Start error handling on the search
                except TexSyntaxError:
                    if trackchanges_main.debug:
                        traceback.print_exc()
                    self.emit(QtCore.SIGNAL('texSyntaxError'), match.span('full_'+self.command))

                except:
                    if trackchanges_main.debug:
                        traceback.print_exc()
                    self.emit(QtCore.SIGNAL('error'))

                # Now wait until we get a command signal from the main program.
                trackchanges_main.button_wait.wait(locker.mutex())

                # We got a signal.
                # Take action based on trackchanges_main.current_action
                try:
                    # Remove the highlight from the matched text
                    self.emit(QtCore.SIGNAL('removeTextHighlight'))

                    if trackchanges_main.current_action == 'skip':
                        trackchanges_main.search_position = span_full[1]
                        continue
                    elif trackchanges_main.current_action == 'resume':
                        continue
                    elif trackchanges_main.current_action == 'skip all':
                        break
                    elif trackchanges_main.current_action == 'cancel':
                        self.emit(QtCore.SIGNAL('cancel'))
                        return              
                    elif self.command in trackchanges_main.command_names:
                        trackchanges_main.search_position = span_full[1]

                        if self.command in ['note', 'refneeded']:
                            if trackchanges_main.current_action == 'remove_note':
                                self.emit(QtCore.SIGNAL('removeText')
                                          ,span_full)

                        elif self.command == 'annote':
                            if trackchanges_main.current_action == 'remove_note':
                                self.emit(QtCore.SIGNAL('replaceText')
                                          ,span_full
                                          ,trackchanges_main.old_text)

                        elif self.command in ['change', 'add', 'remove']:
                            if trackchanges_main.current_action == 'keep_old':
                                self.emit(QtCore.SIGNAL('replaceText')
                                          ,span_full
                                          ,trackchanges_main.old_text)
                            elif trackchanges_main.current_action == 'keep_new':
                                self.emit(QtCore.SIGNAL('replaceText')
                                          ,span_full
                                          ,trackchanges_main.new_text)
                    else:
                        raise Error

                    # Now wait until the text from the main program has been updated.
                    trackchanges_main.text_wait.wait(locker.mutex())

                except:
                    if trackchanges_main.debug:
                        traceback.print_exc()
                    self.emit(QtCore.SIGNAL('error'))

            # Done searching.
            # Let the main program know that the thread is done.
            self.emit(QtCore.SIGNAL('done'))


#=======================================================================
#=======================================================================
# Here we define the central widget.
# This has all of the view and buttons.
class UiCentralWindow(QtGui.QWidget):
    def __init__(self, parent=None):
        global trackchanges_main

        QtGui.QWidget.__init__(self, parent)

        # First setup all the widgets
        self.text_main = TrackChangesTextEdit(self)

        self.label_old = QtGui.QLabel('Old Text:', self)
        self.text_old = QtGui.QTextEdit(self)

        self.label_new = QtGui.QLabel('New Text:', self)
        self.text_new = QtGui.QTextEdit(self)

        self.label_note = QtGui.QLabel('Note:', self)
        self.text_note = QtGui.QTextEdit(self)
        self.text_note.setReadOnly(True)

        self.button_resume = QtGui.QPushButton('Resume', self)
        self.button_resume.setDisabled(True)

        self.button_old = QtGui.QPushButton('Keep Old', self)
        self.button_new = QtGui.QPushButton('Keep New', self)
        self.button_note = QtGui.QPushButton('Remove Note', self)
        self.button_skip = QtGui.QPushButton('Skip', self)

        # Connect all the widgets
        self.connectThings()

        # Now set the style of everything
        self.text_main.setFrameShape(QtGui.QFrame.Box)
        self.text_old.setFrameShape(QtGui.QFrame.Box)
        self.text_new.setFrameShape(QtGui.QFrame.Box)
        self.text_note.setFrameShape(QtGui.QFrame.Box)

        # Set the layout
        left_layout = QtGui.QVBoxLayout()
        right_layout = QtGui.QVBoxLayout()

        right_button_layout = QtGui.QHBoxLayout()
        left_button_layout = QtGui.QHBoxLayout()

        right_button_layout.addStretch(1)
        right_button_layout.addWidget(self.button_old)
        right_button_layout.addWidget(self.button_new)
        right_button_layout.addWidget(self.button_note)
        right_button_layout.addWidget(self.button_skip)

        left_button_layout.addStretch(1)
        left_button_layout.addWidget(self.button_resume)


        right_layout.addWidget(self.label_old)
        right_layout.addWidget(self.text_old)
        right_layout.addWidget(self.label_new)
        right_layout.addWidget(self.text_new)
        right_layout.addWidget(self.label_note)
        right_layout.addWidget(self.text_note)
        right_layout.addStretch(1)
        right_layout.addLayout(right_button_layout)

        left_layout.addWidget(self.text_main)
        left_layout.addLayout(left_button_layout)

        main_layout = QtGui.QHBoxLayout()
        main_layout.addLayout(left_layout)
        main_layout.addLayout(right_layout)


        self.setLayout(main_layout)

        # Choose the inital window size
        self.resize(800,600)

    def connectThings(self):

        self.connect(self.text_main
                     ,QtCore.SIGNAL('textChangedByUser')
                     ,trackchanges_main.textChangeByUser)   

        self.connect(self.button_old
                     ,QtCore.SIGNAL('clicked()')
                     ,trackchanges_main.keepOld)
        self.connect(self.button_new
                     ,QtCore.SIGNAL('clicked()')
                     ,trackchanges_main.keepNew)
        self.connect(self.button_note
                     ,QtCore.SIGNAL('clicked()')
                     ,trackchanges_main.removeNote)
        self.connect(self.button_skip
                     ,QtCore.SIGNAL('clicked()')
                     ,trackchanges_main.skip)
        self.connect(self.button_resume
                     ,QtCore.SIGNAL('clicked()')
                     ,trackchanges_main.resume)

class TrackChangesTextEdit(QtGui.QTextEdit):
    """Here QtGui.QTextEdit is reimplemented so I can figure out what the last
    selection was before an edit wase done.
    
    This only works for edits that are done with a keyboard or mouse command, 
    not any commands given from the program.
    """
    def __init__(self, *args):
        QtGui.QTextEdit.__init__(self, *args)

        # For now disable Undo/Redo.  
        # To enable this is a lot of work.
        # There are two ways to go about it:
        #   1. Keep track of all undo/redo information myself.
        #   2. Re implement a bunch of stuff and try to use Qt's existing undo/redo stack.
        self.setUndoRedoEnabled(False)

        self.connectThings()

        self.last_length = 0
        self.last_selection = [0,0]
        self.user_event = False

    def connectThings(self):
        self.connect(self
                     ,QtCore.SIGNAL('textChanged()')
                     ,self.textChange)        

    def textChange(self):

        current_length = len(self.toPlainText())

        if self.user_event:
            # First get the selection before the event happend.
            self.last_selection.sort()

            # Now get the selection after the event happend.
            cursor = self.textCursor()
            current_selection = [cursor.anchor(), cursor.position()]
            current_selection.sort()

            # Find the length difference before and after the event
            length_diff = current_length - self.last_length

            # Emit a signal with the selections.
            self.emit(QtCore.SIGNAL('textChangedByUser')
                      ,self.last_selection
                      ,current_selection
                      ,length_diff)

        self.last_length = current_length

    def setPlainText(self, text):
        self.last_length = len(text)

        QtGui.QTextEdit.setPlainText(self, text)

    def mousePressEvent(self, event):
        self.user_event = True
        # Call the standard function.
        QtGui.QTextEdit.mousePressEvent(self, event)


    def mouseReleaseEvent(self, event):
        # Save the selection WHEN the mouse was released.
        cursor = self.textCursor()
        self.last_selection = [cursor.anchor(), cursor.position()]

        self.user_event = True
        # Call the standard function.
        QtGui.QTextEdit.mouseReleaseEvent(self, event)


    def keyPressEvent(self, event):
        # Save the selection BEFORE the key was pressed.
        cursor = self.textCursor()
        self.last_selection = [cursor.anchor(), cursor.position()]

        self.user_event = True
        # Call the standard function.
        QtGui.QTextEdit.keyPressEvent(self, event)


    def setUserEvent(self, user_event):
        self.user_event = user_event

    def getTextLength(self):
        return self.last_length



#=======================================================================
#=======================================================================
# Set up the base window.
# The menu and status bar are setup in here.
#
# Close event are caught here.
class UiBaseWindow(QtGui.QMainWindow):
    def __init__(self, parent):
        global trackchanges_main
        global ui_central_widget
        global ui_menubar
        global ui_menu_items

        QtGui.QWidget.__init__(self, parent)

        self.setWindowTitle('TrackChanges - ' + versionString())

        ui_central_widget = UiCentralWindow(self)
        
        # Set the central Widget
        self.setCentralWidget(ui_central_widget)

        # Now setup a status bar
        self.statusBar().showMessage('Track those changes baby.')

        # How about a menu bar
        self.createMenuBar()

        # Connect things
        self.connectThings()

    def closeEvent(self, event):
        result = trackchanges_main.exit()
        if result == 'close':
            self.closeAllWindows()
            event.accept()
        elif result == 'cancel':
            event.ignore()

    def createMenuBar(self):
        # How about a menu bar
        ui_menubar = self.menuBar()

        # Now add the menus
        ui_menubar_file = ui_menubar.addMenu('&File')
        ui_menubar_commands = ui_menubar.addMenu('&Commands')
        ui_menubar_help = ui_menubar.addMenu('&Help')

        # Setup some actions.
        self.createActions()
        
        # Add the actions to the menus
        # --------------------------------------------------------------
        
        # First the file menu.
        ui_menubar_file.addAction(self.ui_menu_items['load'])
        ui_menubar_file.addAction(self.ui_menu_items['save'])
        ui_menubar_file.addAction(self.ui_menu_items['exit'])


        # Now the commands menu.
        ui_menubar_commands.addAction(self.ui_menu_items['skip all'])
        ui_menubar_commands.addAction(self.ui_menu_items['cancel'])
        

        # Now the help menu
        ui_menubar_help.addAction(self.ui_menu_items['about'])
        ui_menubar_help.addAction(self.ui_menu_items['help'])

    def createActions(self):
        # Setup some actions.
        self.ui_menu_items = {}

        self.ui_menu_items['load'] = QtGui.QAction('Load', self)
        self.ui_menu_items['load'].setStatusTip("Load TeX file")

        self.ui_menu_items['save'] = QtGui.QAction('Save', self)
        self.ui_menu_items['save'].setStatusTip("Save changes")

        self.ui_menu_items['exit'] = QtGui.QAction('Exit', self)
        self.ui_menu_items['exit'].setStatusTip("Don't leave me baby.")

        self.ui_menu_items['skip all'] = QtGui.QAction('Skip All', self)
        self.ui_menu_items['skip all'].setStatusTip("Skip all remaining changes and save.")

        self.ui_menu_items['cancel'] = QtGui.QAction('Cancel', self)
        self.ui_menu_items['cancel'].setStatusTip("Cancel and do not save.")

        self.ui_menu_items['about'] = QtGui.QAction('About', self)
        self.ui_menu_items['about'].setStatusTip("About TrackChanges")

        self.ui_menu_items['help'] = QtGui.QAction('Help', self)
        self.ui_menu_items['help'].setStatusTip("Help!")

    def connectThings(self):
        self.connect(self.ui_menu_items['load']
                     ,QtCore.SIGNAL('triggered()')
                     ,trackchanges_main.loadTexFile)

        self.connect(self.ui_menu_items['save']
                     ,QtCore.SIGNAL('triggered()')
                     ,trackchanges_main.saveTexFile)

        self.connect(self.ui_menu_items['exit']
                     ,QtCore.SIGNAL('triggered()')
                     ,QtCore.SLOT('close()'))

        self.connect(self.ui_menu_items['skip all']
                     ,QtCore.SIGNAL('triggered()')
                     ,trackchanges_main.skipAll)

        self.connect(self.ui_menu_items['cancel']
                     ,QtCore.SIGNAL('triggered()')
                     ,trackchanges_main.cancel)

        self.connect(self.ui_menu_items['about']
                     ,QtCore.SIGNAL('triggered()')
                     ,self.showAboutDialog)

        self.connect(self.ui_menu_items['help']
                     ,QtCore.SIGNAL('triggered()')
                     ,self.showHelpDialog)

    def closeAllWindows(self):
        """
        Closes all application windows.
        For now this is just the help window.
        """
        try:
            status = self.help_window.close()
        except AttributeError:
            pass

    def showAboutDialog(self):
        version_string = versionString()
        version_date_string = versionDateString()

        file_about = r'../documentation/web/html_simple/about.html'
        with open(file_about) as file:
            about_text_format = file.read()

        about_text = about_text_format.format(version=version_string
                                              ,date=version_date_string)

        QtGui.QMessageBox.about(
            self
            ,'About TrackChanges'
            ,about_text
            )

    def showHelpDialog(self):

        #help = HelpWindow(self)
        self.help_window = HelpWindow(None)
        self.help_window.show()

class HelpWindow(QtGui.QMainWindow):
    def __init__(self, parent):
        QtGui.QMainWindow.__init__(self, parent)

        self.setWindowTitle('TrackChanges Help')

        self.help_browser = HelpWebBrowser(self)

        self.setCentralWidget(self.help_browser)

        self.resize(700,500)

class HelpWebBrowser(QtGui.QWidget):
    def __init__(self, parent=None):
        QtGui.QWidget.__init__(self, parent)

        # We load this on the fly to reduce memory footprint.
        from PyQt4 import QtWebKit
        
        self.browser_main = QtWebKit.QWebView(self)

      
        # Connect things
        self.connectThings()

        url_main = QtCore.QUrl(r'../documentation/web/html_css/help.html')
        self.browser_main.setUrl(url_main)
  

        # Set the layout
        main_layout = QtGui.QHBoxLayout()
        main_layout.addWidget(self.browser_main)

        self.setLayout(main_layout)

    def connectThings(self):
        pass


# =====================================================================
# =====================================================================
# This is meant to be a lightweight help browser for TrackChanges.
#
# Unfortunatly Qt's rich text handling is all messed up and this 
# does not work.  Qt puts the ends of tags in the wrong place.
class HelpBrowser(QtGui.QWidget):
    def __init__(self, parent=None):
        QtGui.QWidget.__init__(self, parent)
        
        self.browser_main = QtGui.QTextBrowser(self)
        self.browser_main.setSearchPaths(['../documentation/web/'])
        url_main = QtCore.QUrl(r'../documentation/web/html_simple/help.html')
        self.browser_main.setSource(url_main)

        self.browser_index = QtGui.QTextBrowser(self)
        url_index = QtCore.QUrl(r'../documentation/web/html_simple/help_index.html')
        self.browser_index.setSource(url_index)
        self.browser_index.setMaximumWidth(150)
        self.browser_index.setMinimumWidth(150)
        self.browser_index.setOpenLinks(False)
        
        # Connect things
        self.connectThings()

        # Set the layout
        left_layout = QtGui.QVBoxLayout()
        right_layout = QtGui.QVBoxLayout()

        right_layout.addWidget(self.browser_main)
        left_layout.addWidget(self.browser_index)

        main_layout = QtGui.QHBoxLayout()
        main_layout.addLayout(left_layout)
        main_layout.addLayout(right_layout)

        self.setLayout(main_layout)

    def connectThings(self):

        self.connect(self.browser_index
                     ,QtCore.SIGNAL("anchorClicked(QUrl)")
                     ,self.browser_main
                     ,QtCore.SLOT("setSource(QUrl)"))

#=======================================================================
#=======================================================================
# Some string parsing utilities.
# These should eventually go into a utilities module.
def findallInnerSpan(string, marker, start=None, end=None):
    """
    Returns a list of the spans of the first substring surrounded 
    by the markers as well as any nested matches.

    This is to be used in extracting the contents of 
    brackets.  This will deal with nested brackets properly.

    The returned spans include the brackets.

    If the end of the string is encounted before all marker pairs have
    been closed endOfStringError will be raised.
    """
    
    if not start:
        start = 0
    if not end:
        end = len(string)

    # if the markers are the same we need to deal with things differently
    if marker[0] == marker[1]:
        pattern = re.compile('%s.*?%s' %(re.escape(marker[0]),re.escape(marker[1])))
        match = pattern.search(string, start, end)
        if match:
            return [match.span(0)]
        else:
            return None
    else:
        # create the regular expression.
        pattern = re.compile('%s|%s' %(re.escape(marker[0]),re.escape(marker[1])))

        # Here we store the locations of the starting and ending markers.
        open_stack = []
        close_stack = []
        
        # Here we store the final {starting,ending) pairs.
        final_stack = []

        # Iterate over the pattern.
        # Note that we build the close_stack in reverse order.
        for match in pattern.finditer(string, start, end):
            if match.group(0) == marker[0]:
                open_stack.append(match.start(0))
                close_stack.insert(0,None)
            else:
                empty_index = close_stack.index(None)
                close_stack[empty_index] = match.end(0)

            if not None in close_stack:
                break

        # Check for an incomplete match
        if None in close_stack:
            raise EndOfStringError

        # The close stack was built in reverse order
        close_stack.reverse()

        # The same number of open and close markers have been found
        # so we have a match.
        for i in range(len(open_stack)):
            final_stack.append((open_stack[i],close_stack[i]))
        
        if final_stack:
            return final_stack
        else:
            return None


def findInnerSpan(string, marker, start=None, end=None):
    """
    Returns a the span of the first substring surrounded 
    by the markers. Properly handles nested brackets.

    The returned span includes the brackets.

    If the end of the string is encounted before all marker pairs have
    been closed endOfStringError will be raised.
    """
    # First get a list that includes the spans of 
    # all the nested brackets.
    final_stack = findallInnerSpan(string, marker, start, end)
    
    # Now just return the outermost span
    try: 
        return final_stack[0]
    except:
        return None
    
def isWhiteSpace(string):
    match = re.search(r"[^\s]", string)
    if match:
        return False
    else:
        return True

def versionString():
    string='.'.join(map(str,__version__[:3]))
    return string

def versionDateString():
    return __version_date__.strftime('%Y-%m-%d')


#=======================================================================
#=======================================================================
# Errors for string parsing.
# These should eventually go into a utilities module.
class Error(Exception):
    """Base class for exceptions in this module."""
    pass

class EndOfStringError(Error):
    """Execption raised when the end of the string is encountered
    before processing has finished.
    """
    pass

#=======================================================================
#=======================================================================
# Errors for TrackChanges.
class TexSyntaxError(Error):
    """Execption raised when a Tex syntax error is encountered."""
    pass
    




#=======================================================================
#=======================================================================
# Start the program.
if __name__ == '__main__':
    trackchanges_main = TrackChanges()

    sys.exit(app.exec_())
