input("Placeholder for prompt, hit enter to close the window")

#as with SQL, you can retrieve specific functions from a library with a from statement

from graphics import *
win = GraphWin("Would you like to play a game?", 600, 600)


#default graphics window (ie: GraphWin) is 200x200. Simplest object is the Point (x, y)
#upper left is (0,0), to lower right is (199, 199) Unless you change the GraphWin sz
#rows and columns like Excel. So for 600 pixels would be (0, 599) in ea direction

pt1 = Point(555, 222) #first number is X axis, second is y; column, row
pt1.draw(win) #to make it draw the point, tell it to draw, "give it" the graphics window
print("x location of pt1 is", pt1.getX())
print("y location of pt1 is", pt1.getY())
#can set colors with.setFill("green") and set.Outline
#look up to see what colors recognized by python

#make a circle, need a point and a radius (where to put it and how big)
crcl1 = Circle(pt1, 20)
crcl1.setFill("red")
crcl1.setOutline("black")
crcl1.setWidth(5)  #sets the width of the outline
crcl1.draw(win)

#playing with other shapes, a rectangle would need 2pts/opposing corners
rec1= Rectangle(Point(50, 120), Point(75, 110))
rec1.draw(win)

#make a line, need start and finish pt. See slides for triangles, need three pts
ln1= Line(pt1, Point(50, 0))
ln1.draw(win)

# to add text in window, centers on the point specified and string
#txt1= Text("Why isn't this wor", Point (300, 100))
#txt1.draw(win)

#can move/animate objects, tell it how far in ea direction it should change
input("Click mouse to move the circle.")
crcl1.move(-50, 200)
#can use .clone() to create replicas for objs like eyes and then move one or the other
crcl2 = crcl1.clone()
crcl2.draw(win) #don't forget to tell it to draw it

#to move the circle
win.getMouse()
crcl1.move(-20,100)
#to erase an object, such as text, it's .undraw
txt1.undraw()

#to change text
txt1.setText("Click mouse to exit program")
win.getmouse()


win.close() #this is a "nice" way to close the window? WHat does that mean?