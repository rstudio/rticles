"""
LineSegment stores one labeled segment of text.
a reference to the entire line and indices for slicing are stored.
Each LineSegment object has a flag 'hideFlag' that stores whether
the segment should appear in the output or not.
According to Python, the segment spans the text [fromPos,toPos) of line
"""

# LineSegment.py, Copyright (C) 2006 Felix Salfner (salfner@informatik.hu-berlin.de)
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

class LineSegment:
	def __init__(self,line, fromPos, toPos, type):
		"""parameters:
		     - line: a reference to the (entire) line string
			  - fromPos: start index of the segment
			  - toPos: end index of the segment (not included in output)
			  - type: a string specifying the type of the segment"""
		self.line = line
		self.fromPos = fromPos
		self.toPos = toPos
		self.type = type
		self.hideFlag = False
	
	def hide(self):
		"""hides the segment such that it will not be included in the output"""
		self.hideFlag = True

	def output(self,outputStream):
		"""writes the segment to 'outputStream'"""
		if not self.hideFlag:
			outputStream.write(self.line[self.fromPos:self.toPos])
	
	def toString(self):
		"""returns a string that contains only the specified slice of line"""
		return self.line[self.fromPos:self.toPos]


