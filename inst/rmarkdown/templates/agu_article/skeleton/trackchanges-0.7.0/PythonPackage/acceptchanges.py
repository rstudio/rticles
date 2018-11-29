#!/usr/bin/env python2.4
"""accept.py reads a LaTeX file in order to process \annote{} and \change{}{} commands
that are available through the LaTeX package trackchanges.sty.  See accept.py --help for
usage"""

# accept.py reads a LaTeX file in order to process \annote{} and \change{}{} commands
# that are available through the LaTeX package trackchanges.sty.  
# Copyright (C) 2006 Felix Salfner (salfner@informatik.hu-berlin.de)
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
from optparse import OptionParser 
from copy import deepcopy
import sys
import tempfile
import readline
import os
import re

# import local modules
from AcceptChanges.consoleoutput import ConsoleControlledOutput

DEBUG = 0


# =====================================================================
def addOptions(optParser):
	"""adds the options  to the option parser that is passed as an argument
	parameters:
		optParser - a option Parser instance (from optparse)
		
	returns a new option parser with added argument"""
	newOptParser = deepcopy(optParser)

	newOptParser.add_option("", "--warranty", action="store_true", dest="warranty",
            help="show warranty disclaimer")
	newOptParser.add_option("", "--conditions", action="store_true", dest="conditions",
            help="show copy conditions disclaimer")
	newOptParser.add_option("", "--infile", dest="inFileName", default="-",
			help="input filename", metavar="FILE")
	newOptParser.add_option("", "--outfile", dest="outFileName", default="-",
			help="output filename", metavar="FILE")
	newOptParser.add_option("-n", "--notes", action="store_true", dest="notes",
            help="process \\annote and \\note commands") 
	newOptParser.add_option("-c", "--changes", action="store_true", dest="changes",
            help="process \\add, \\remove, and \\change commands")
	newOptParser.add_option("-i", "--interactive", action="store_true", dest="interactive",
			help="interactive mode")
	return newOptParser   


# =====================================================================
def searchCommand(line, output, startpos):
	"""searchCommand(line, output, startpos): 
	starting from startpos in line, the next \\annote or \\change command is searched. 
	Text segments from startpos to the end of the command including initials is added to output:
	  1) text between startpos and the start of the command is labeled as normalText
	  2) the command string is either labeled as annoteCommand or changeCommand
	  3) it is checked whether an optional initials argument is provided. If so,
	     a line segment labeled 'initials' is added
	returns: 
	  - (endPos, commandType)
	     endPos: end position of command (including initials) in the line
		  commandType: type of command that has been found: 'annoteCommand' or 'changeCommand'
	  - (None, None) if no command has been found in the line starting from startpos"""
	  
	if DEBUG:
		print "looking for start of command at:", startpos, "in line:", line
	match = re.search('(\\\\annote.*?[\[{])|(\\\\note.*?[\[{])|(\\\\add.*?[\[{])|(\\\\remove.*?[\[{])|(\\\\change.*?[\[{])', line[startpos:])
	if match:
		if match.group(1):
			if DEBUG:
				print "found annote at position", startpos + match.start(1)
			command = {'start':startpos + match.start(1), 
			           'end':startpos + match.end(1)-1 , 
						  'type':"annoteCommand"}
		elif match.group(2):
			if DEBUG:
				print "found note at position", startpos + match.start(2)
			command = {'start':startpos + match.start(2), 
			           'end':startpos + match.end(2) - 1, 
						  'type':"noteCommand"}
		elif match.group(3):
			if DEBUG:
				print "found add at position", startpos + match.start(3)
			command = {'start':startpos + match.start(3), 
			           'end':startpos + match.end(3) - 1, 
						  'type':"addCommand"}
		elif match.group(4):
			if DEBUG:
				print "found remove at position", startpos + match.start(4)
			command = {'start':startpos + match.start(4), 
			           'end':startpos + match.end(4) - 1, 
						  'type':"removeCommand"}
		elif match.group(5):
			if DEBUG:
				print "found change at position", startpos + match.start(5)
			command = {'start':startpos + match.start(5), 
			           'end':startpos + match.end(5) - 1, 
						  'type':"changeCommand"}
	else:
		if DEBUG:
			print "no command found in rest of line"
			print "OUTPUT '", line[startpos:len(line)], "' -> normalText"
		output.addSegment( line, startpos, len(line),"normalText" )
		return (None,None)

	if DEBUG:
		print "OUTPUT '", line[startpos:command['start']], "' -> normalText"
		print "OUTPUT '", line[command['start']:command['end']], "' ->",command['type']
	output.addSegment( line, startpos, command['start'], "normalText" )
	output.addSegment( line, command['start'], command['end'], command['type'] )
	
	if DEBUG:
		print "searching for initials ..."
	if line[command['end']] == "[":
		if DEBUG:
			print "found initials ... searching end of environmenti ..."
		initialsMatch = re.search('(.*?\])',line[command['end']:])
		if initialsMatch != None:
			if DEBUG:
				print "OUTPUT '", line[command['end']:command['end'] + initialsMatch.end(0)], "' -> initials"
			output.addSegment(line, command['end'],command['end'] + initialsMatch.end(0),"initials")
			command['end'] += initialsMatch.end(0)
		else:
			sys.stderr.write("Warning!! Initials of change command in the following line ")
			sys.stderr.write("do not end in the same line! Please fix and rerun!\n")
			sys.stderr.write("Line: " + line)
			sys.exit(1)
	else:
		if DEBUG:
			print "... no initials found"
	
	return (command['type'], command['end'])
	

# =====================================================================
def searchEnvEnd(line,lineIterator,output,startpos,type):
	"""searchEnvEnd(line, lineIterator, output, startpos, type):
	searches for corresponding closing braces that indicate the end of the environment.
	The search starts at startpos in the given line. 
	searchEnvEnd keeps track of opening and closing braces until the corresponding closing
	brace has been found. 
	If the environment does not end in 'line' it continues reading following lines from
	lineIterator.
	the whole text after the opening curly braces up to the corresponding closing curly braces
	are labeled with the given 'type' in the given 'output' object
	returns: 
	  (newLine, endPos)
	  newLine: the last line of text that has been read by searchEnvEnd
	  endPos: the position where the environment ends in newLine"""
	argumentMatch = re.search('(.*?{)',line[startpos:])
	if argumentMatch != None:
		argumentBracePos = startpos + argumentMatch.end(0)
		if DEBUG:
			print "found start of argument at pos", argumentBracePos
			print "OUTPUT '", line[argumentBracePos-1:argumentBracePos], "startBrace"
		output.addSegment(line, startpos, argumentBracePos, "startBrace")
	else:
		sys.stderr.write("Warning!! argument does not start in the same line!")
		sys.stderr.write(" Please fix and rerun!\n Line: " + line)
		sys.exit(1)
	bracestack = 1
	startpos = argumentBracePos
	nextsearchpos = startpos
	while True:
		searchpos = nextsearchpos
		if DEBUG:
			print "looking for end of environment ... starting at", searchpos
		openbracepos = line.find("{", searchpos)
		closebracepos = line.find("}", searchpos)
		
		if (openbracepos == -1) and (closebracepos != -1):
			nextsearchpos = closebracepos + 1
			bracestack -= 1
			if DEBUG:
				print " -> only found closing brace ... stack:", bracestack
		elif (openbracepos != -1) and (closebracepos == -1):
			nextsearchpos = openbracepos + 1
			bracestack += 1
			if DEBUG:
				print " -> only found opening brace ... stack:", bracestack
		elif openbracepos < closebracepos:
			nextsearchpos = openbracepos + 1
			bracestack += 1
			if DEBUG:
				print " -> next brace is opening ... stack:", bracestack
		elif closebracepos < openbracepos:
			nextsearchpos = closebracepos + 1
			bracestack -= 1
			if DEBUG:
				print " -> next brace is closing ... stack:", bracestack
		else:
			if DEBUG:
				print " -> found no brace in line ... hangover"
				print "OUTPUT '", line[startpos:len(line)], "' ->", type
			output.addSegment( line, startpos, len(line), type )
			startpos = 0
			try:
				line = lineIterator.next()
				if DEBUG:
					print " ----> processing line:", line
			except StopIteration:
				sys.stderr.write("Warning file ended without closing all environments!!!\n")
				sys.exit(1)
			nextsearchpos = 0
			
		if bracestack == 0:
			if DEBUG:
				print " -> found end of environment at:", nextsearchpos
				print "OUTPUT '", line[startpos:nextsearchpos - 1], "' ->", type
				print "OUTPUT '", line[nextsearchpos - 1:nextsearchpos], "' ->endBrace"
			output.addSegment( line, startpos, nextsearchpos - 1, type )
			output.addSegment( line, nextsearchpos - 1, nextsearchpos, "endBrace" )
			break
			
	return (line,nextsearchpos)


# =====================================================================
def labelText(infile, output):
	"""labelText(infile, output):
	processes all lines from infile and adds labeled text segments to output"""
	bracestack = 0
	hangover = None
	
	while True:
		try:
			line = infile.next()
		except StopIteration:
			break
		if DEBUG:
			print "\n ----> processing line: ", line[:-1]
		
		startpos = 0
			
		while True:	
			(commandType,commandEndPos) = searchCommand(line, output, startpos)
			if not commandType:
				break
			else:
				if commandType == "annoteCommand":
					(line,envEndPos) = searchEnvEnd(line, infile, output, commandEndPos, "annotedText" )
					(line,envEndPos) = searchEnvEnd(line, infile, output, envEndPos, "noteText" )
					startpos = envEndPos
						
				elif commandType == "noteCommand":
					(line,envEndPos) = searchEnvEnd(line, infile, output, commandEndPos, "noteText" )
					startpos = envEndPos
						
				elif commandType == "addCommand":
					(line,envEndPos) = searchEnvEnd(line, infile, output, commandEndPos, "addedText" )
					startpos = envEndPos
						
				elif commandType == "removeCommand":
					(line,envEndPos) = searchEnvEnd(line, infile, output, commandEndPos, "removedText" )
					startpos = envEndPos
						
				elif commandType == "changeCommand":
					(line,envEndPos) = searchEnvEnd(line, infile, output, commandEndPos, "originalText" )
					(line,envEndPos) = searchEnvEnd(line, infile, output, envEndPos, "newText" )
					startpos = envEndPos
			


# =====================================================================
# ------------------------------ main ---------------------------------
# =====================================================================
if __name__ == "__main__":
	
	if len(sys.argv) == 1:
		sys.stderr.write("Error: try " + sys.argv[0] + " --help\n")
		sys.exit()
	
	optParser = OptionParser()  # parses command line options
	optParser = addOptions(optParser)
	(options, remainingargs) = optParser.parse_args()
	
	if remainingargs != []: # check for leftover arguments
		raise RuntimeError, "argument(s) \"%s\" not recognized" % (remainingargs[0])   

	if options.interactive:
		sys.stderr.write("accept.py, Copyright (C) 2006 Felix Salfner. \n\naccept.py comes with ABSOLUTELY NO WARRANTY; for details type `accept.py --waranty'. This is free software, and you are welcome to redistribute it under certain conditions; type `accept.py --conditions' for details.\n\n")
	
	if options.warranty:
		sys.stderr.write("This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.\n")
	
	if options.conditions:
		sys.stderr.write("This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.\n")
	
	if options.conditions or options.warranty:
		sys.exit(0)



	if options.inFileName != "-":
		infile = file(options.inFileName)
	else:
		if options.interactive:
			sys.stderr.write("WARNING! You cannot use interactive mode together with input from stdin!\n")
			sys.exit(1)
		else:
			infile = sys.stdin
	
	if options.outFileName != "-":
		if not os.access(options.outFileName, os.F_OK):
			outfile = file(options.outFileName, 'w')
		else:
			sys.stderr.write( "WARNING! outfile exists. overwrite? [Y|n] " )
			inputStr = raw_input("")
			if inputStr.lower() == "n":
				sys.exit(1)
			sys.stderr.write("\n")
			outfile = file(options.outFileName, 'w')
	else:
		outfile = sys.stdout
	
	output = ConsoleControlledOutput(outfile, options)
	labelText(infile,output)
	if DEBUG:
		print " ... outputting result to", options.outFileName
	output.processSegments()
	output.write()
		
		
		
