"""
Provides class ConsoleControlledOutput is intended for console-based user interaction.
	It is intended that other classes are used for GUI-controlled user interaction etc.
"""

# ConsoleControlledOutput.py, Copyright (C) 2006 Felix Salfner (salfner@informatik.hu-berlin.de)
#
# This program is free software; you can redistribute it and/or modify it under the terms 
# of the GNU General Public License as published by the Free Software Foundation; either 
# version 2 of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
# See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with this program; 
# if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, 
# MA 02111-1307 USA
#
# For further info / comments please contact: Felix Salfner (salfner@informatik.hu-berlin.de)
#

# version 0.2, 2006-05-31

# import standard Python 2.4 modules
import sys

# import local modules
from linesegment import LineSegment

class ConsoleControlledOutput:
	def __init__(self, outfile, options):
		"""parameters:
		   - outfile: an output Stream object such as a file object or sys.stdout ...
			- options: an object containing the following flags:
			    - options.interactive: are user interactions required
				 - options.notes: should \\annote commands be processed
				 - options.changes: should \\change commands be processed"""
		self.outfile = outfile
		self.interactive = options.interactive
		self.processNotes = options.notes
		self.processChanges = options.changes
		self.document = []
	
	def addSegment(self, line, fromIndex, toIndex, type):
		"""adds a LineSegment to self.document"""
		self.document.append( LineSegment(line,fromIndex, toIndex, type) )
		
	def printBuffer(self,segments):
		"""prints the given list of line segments to stderr ..."""
		for s in segments:
			s.output(sys.stderr)
		sys.stderr.write("\n")	
	
	def eraseNote(self, noteSegments):
		"""erase segments that belong to the note:
		   - if it is a \note command -> erase all
			- if it is an \annote command -> erase all but the annoted text"""
		if noteSegments[0].type == "noteCommand":
			for s in noteSegments:
				s.hide()
		elif noteSegments[0].type == "annoteCommand":
			for s in noteSegments:
				if s.type != "annotedText":
					s.hide()
	
	def keepAddedText(self, addSegments):
		"""keeps the added text of an \add command:
		   hide all elements except for newText"""
		for s in addSegments:
			if s.type in ("addCommand", "initials", "startBrace", "endBrace"):
				s.hide()
	
	def removeAddedText(self, addSegments):
		"""removes the added text of an \add command: hide all elements"""
		for s in addSegments:
			s.hide()
	
	def removeRemovedText(self, removeSegments):
		"""removes the text -> remove all segments ..."""
		for s in removeSegments:
			s.hide()
	
	def keepRemovedText(self, removeSegments):
		"""removes the command but leaves the element removedText ..."""
		for s in removeSegments:
			if s.type in ("removeCommand", "initials", "startBrace", "endBrace"):
				s.hide()
	
	def keepNewText(self, changeSegments):
		"""keeps only the new text of a change command: removes all but the newText segment"""
		for s in changeSegments:
			if s.type in ("changeCommand", "initials", "originalText", "startBrace", "endBrace"):
				s.hide()
	
	def keepOriginalText(self, changeSegments):
		"""keeps only the original text of a change command: removes all but the originalText segment"""
		for s in changeSegments:
			if s.type in ("changeCommand", "initials", "newText", "startBrace", "endBrace"):
				s.hide()
	
	def noteInteraction(self, noteSegments):
		"""asks the user, if the note should be erased or not and hides the corresponding
		LineSegments if requested ..."""
		self.printBuffer(noteSegments)
		sys.stderr.write("\nErase? [Y|n] ")
		inputStr = raw_input("")
		if inputStr.lower() != "n":
			self.eraseNote(noteSegments)
		sys.stderr.write("\n")
	
	def addInteraction(self, addSegments):
		"""provides three options to the user:
		  - Accept: erase the \\add command and keep the added text 
		  - Reject: erase the \\add command together with the added text
		  - Ignore: ignore and leave the \\change command in the text"""
		self.printBuffer(addSegments)
		sys.stderr.write("Accept added text, Reject added text or Ignore? [A|r|i] ")
		inputStr = raw_input("")
		inputStr = inputStr.lower()
		if inputStr == "i":
			pass
		elif inputStr == "r": 
			self.removeAddedText(addSegments)
		else:
			self.keepAddedText(addSegments)
		sys.stderr.write("\n")
	
	def removeInteraction(self, removeSegments):
		"""provides three options to the user:
		  - Accept: erase the \\remove command together with the removed text
		  - Reject: erase the \\remove command but leave the removed text
		  - Ignore: ignore and leave the \\remove command in the text"""
		self.printBuffer(removeSegments)
		sys.stderr.write("Accept to remove text, Reject deletion or Ignore? [A|r|i] ")
		inputStr = raw_input("")
		inputStr = inputStr.lower()
		if inputStr == "i":
			pass
		elif inputStr == "r": 
			self.keepRemovedText(removeSegments)
		else:
			self.removeRemovedText(removeSegments)
		sys.stderr.write("\n")
	
	def changeInteraction(self, changeSegments):
		"""provides three options to the user:
		  - erase the \\change command and keep the new text (the replaced text)
		  - erase the \\change command and keep the original text
		  - ignore and leave the \\change command in the text"""
		self.printBuffer(changeSegments)
		sys.stderr.write("Accept change, Reject change or Ignore? [A|r|i] ")
		inputStr = raw_input("")
		inputStr = inputStr.lower()
		if inputStr == "i":
			pass
		elif inputStr == "r": 
			self.keepOriginalText(changeSegments)
		else:
			self.keepNewText(changeSegments)
		sys.stderr.write("\n")
	
		
	def processSegments(self):
		"""loops through the entire document and processes all segments.
		the goal is to hide segments that should not appear in the output.
		If interactive mode is enabled, after each \\annote or \\change command a user
		interaction is requested to decide how the correpsonding command should be handled."""
		
		env = ""          # stores the state the process is in 
		envBuffer = []    # stores all segments that belong to one command
		for segment in self.document:
			if segment.type in ("annoteCommand", "noteCommand", "addCommand", "removeCommand", "changeCommand"):
				# this is the first segment of an \add, \remove, \change, \note or \annote command ...
				env = segment.type
				envBuffer.append(segment)
				continue
			if (env == "changeCommand") and (segment.type == "endBrace"):
				# since \change commands have 2 arguments, we have to wait for a second endBrace ...
				env = "changeSecondArg"
				envBuffer.append(segment)
				continue
			if (env == "annoteCommand") and (segment.type == "endBrace"):
				# since \annote commands have 2 arguments, we have to wait for a second endBrace ...
				env = "annoteSecondArg"
				envBuffer.append(segment)
				continue
			if env in ( "annoteCommand", "noteCommand", "addCommand", "removeCommand", "changeCommand", "changeSecondArg", "annoteSecondArg"):
				# if we are currently processing segments belonging to a command
				# we have to add all segments to envBuffer
				envBuffer.append(segment)
				if segment.type == "endBrace":
					# we came to the end of an environment ...
					if self.processNotes and (env in ("noteCommand", "annoteSecondArg")):
						if self.interactive:
							self.noteInteraction(envBuffer)
						else:
							self.eraseNote(envBuffer)
					elif self.processChanges and (env == "addCommand"):
						if self.interactive:
							self.addInteraction(envBuffer)
						else:
							self.keepAddedText(envBuffer)
					elif self.processChanges and (env == "removeCommand"):
						if self.interactive:
							self.removeInteraction(envBuffer)
						else:
							self.removeRemovedText(envBuffer)
					elif self.processChanges and (env == "changeSecondArg"):
						if self.interactive:
							self.changeInteraction(envBuffer)
						else:
							self.keepNewText(envBuffer)

					envBuffer = []
					env = ""

	def write(self):
		"""writes the entire self.document to self.outfile"""
		for segment in self.document:
			segment.output(self.outfile)




