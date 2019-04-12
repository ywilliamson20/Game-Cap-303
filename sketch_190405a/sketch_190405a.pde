//Smoothie Warrior
//By Lara Disuanco and Yvette Williamson
import controlP5.*;

//variables
ControlP5 controlP5;
ArrayList<Fruit> arr;
float x, y;
boolean click;
float pmx=0;
float pmy=0;
boolean start;

//This function will setup the main menu and intialize objects and locations
void setup()
{
  controlP5 = new ControlP5(this);
  controlP5.addButton("startButton").setValue(0).setPosition(10, 30).setSize(100, 32).setCaptionLabel("Start").getCaptionLabel().setSize(10);
  controlP5.addButton("quitButton").setValue(0).setPosition(10, 70).setSize(100, 32).setCaptionLabel("Quit").getCaptionLabel().setSize(10);

  start = false;
  size(800, 800);
  background(124, 94, 56);
  arr = new ArrayList<Fruit>();
  x = 0;
  y =height;
  Fruit f = new Fruit(x, y);
  arr.add(f);
  fill(255, 0, 0);
  Fruit f1 = new Fruit(x+50, y);
  arr.add(f1);
  fill(255, 0, 0);
}


//This function will display all objects and track mouse for correct "slicing" of fruit
void draw()
{
  //when start button is pressed, start game
  if (start) {
    background(124, 94, 56);
    for (int i=0; i<arr.size(); i++) {
    arr.get(i).display();
    
    //if the fruit is sliced, the slices will drop rapidly and suddenly
    if (arr.get(i).clicked)
    {
      arr.get(i).x-=5;
      arr.get(i).y+=5;

    } else
    {
      //if fruit is not sliced, it will move upwards then downwards in an arc path
      if (arr.get(i).x<width/2) {
        arr.get(i).x+=5;
        arr.get(i).y-=9;
      } else
      {
        arr.get(i).x+=2;
        arr.get(i).y+=3;
      }
    }
    }
  } else {
    //if game not started, the main menu will be displayed
    background(255);
   textSize(70);
    text("Smoothie Warrior!", width/2 - 300, height/2);
    
    for (int i=0; i<arr.size(); i++) {
      arr.get(i).clicked=false;
      arr.get(i).x=0+i*2;
      arr.get(i).y=height;
    }
  }
}

//if mouse is pressed, save the mouse location
void mousePressed()
{
  for (int i=0; i<arr.size(); i++) {
    pmx= mouseX;
    pmy=mouseY;

  }
}

//if mouse dragged, draw line from old mouse x,y position to the new mouse x,y position
void mouseDragged()
{
  line(pmx,pmy,mouseX,mouseY);
  for (int i=0; i<arr.size(); i++) {
    float d=dist(mouseX, mouseY, arr.get(i).x, arr.get(i).y);
    if (d<arr.get(i).r)
    {
      arr.get(i).clicked=true; //if knife is in contact with fruit, cut fruit in half!
    }
  }
  
}

//start button
void startButton() {
  start = true;

}

//for quit button 
void quitButton() {
  start = false;

}
