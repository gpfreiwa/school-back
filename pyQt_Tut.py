# Imports the required dependencies
import sys
from PyQt5.QtWidgets import Qapplication, QWidget
from PyQt5.QtGui import QIcon

# create the Example class, which will create the window object
class Examplt(QWidget): 	#name declaration, will inherit stuff from the QWidget class
	def __init__(self):		#constructor for the inherited class, so will construct the QWidget class
		super().__init__()	#super() is to call the class above it, so line is constructing the QWidget class
		self.initUI()		#this line constructs the actual window, and is the function call for the next definition
		
	def initUI(self):							#this function of the Example class will create the actual window
		self.setGeometry(300,300,300,220)		#setGeometry will resize and move the created window
		self.setWindowTitle('Icon')				#will set the title of the window
		self.setWindowIcon(QIcon('web.png'))	#will locate an image and set it as the window icon
		self.show()								#actually creates the window


if __name__ == '__main__':
	app = Qapplication(sys.argv)	#required starting of the application
	
	ex = Example()					#creating the Example and assigning the name ex
	sys.exit(app.exec_())			#will exit the application when triggered