//Smoothie Warrior
//By Lara Disuanco and Yvette Williamson
import controlP5.*;
import processing.sound.*; //for sounds
//variables
ControlP5 controlP5;

int [] pro;
ArrayList<Bomb> barr;
ArrayList<Fruit> arr;
Knife k;
Sound_effects s;

float x, y;

PImage im;
PImage bim;
PFont fo;

float pmx=0;
float pmy=0;
Power_ups pow;
boolean start;
int score;

//This function will setup the main menu and intialize objects and locations
void setup()
{
  size(800, 800);

  controlP5 = new ControlP5(this);
  controlP5.addButton("startButton").setValue(0).setPosition(10, 30).setSize(100, 60).setCaptionLabel("Start").getCaptionLabel().setSize(30);
  controlP5.addButton("quitButton").setValue(0).setPosition(10, 100).setSize(100, 60).setCaptionLabel("Quit").getCaptionLabel().setSize(30);
  im=loadImage("woodbac.jpg");
  bim=loadImage("flo_nin.jpg");

  start = false;
  pow= new Power_ups();
  background(im);
  pro=new int[10];
  for (int i =0; i<pro.length; i++)
  {
    pro[i]=(int)random(5, 10);
  }
  barr = new ArrayList<Bomb>();

  arr = new ArrayList<Fruit>();

  k = new Knife();
  s = new Sound_effects(this);

  x = 0;
  y = height;
  Fruit f = new Fruit(x, y);
  arr.add(f);
  fill(255, 0, 0);

  Fruit f1 = new Fruit(x+50, y);
  arr.add(f1);
  fill(255, 0, 0);

  score = 0;
  
  s.bgm();
}


//This function will display all objects and track mouse for correct "slicing" of fruit
void draw()
{
  //when start button is pressed, start game
  if (start) {

    k. display();
    background(im);
 
    pow.display();

   for (int i=0; i<arr.size(); i++) {

    arr.get(i).update(pro[i]);
    arr.get(i).display();
    
     text("Score: " + score, width/2 - 200, 100);
    if (arr.get(i).clicked) {
      score += 10;
      pow.ready(score);
    }

   }
     if(frameCount%100==0)
     {
       if(arr.size()<10){
      Fruit fff=new Fruit(x,y);
     arr.add(fff);
     
    }
     }
  

    //if the fruit is sliced, the slices will drop rapidly and suddenly
    
    for (int t=0; t<barr.size(); t++)
    {
      barr.get(t).update(3);
      barr.get(t).display();
    }
     if(frameCount%200==0)
     {
       if(barr.size()<10){
      Bomb fff=new Bomb(x,y);
     barr.add(fff);
     
    }
     }
   
  } else {
    //if game not started, the main menu will be displayed
    background(bim);
    fill(249, 209, 4);
    fo=loadFont("HarlowSolid-48.vlw");
    textFont(fo);
    textSize(80);
    text("Smoothie Warrior!", width/2 - 300, height/2-100);

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
    pmx = mouseX;
    pmy = mouseY;
  }
}

//if mouse dragged, draw line from old mouse x,y position to the new mouse x,y position
void mouseDragged()
{
  line(pmx, pmy, mouseX, mouseY);
  for (int i=0; i<arr.size(); i++) {
    float d=dist(mouseX, mouseY, arr.get(i).x, arr.get(i).y);
    if (d<arr.get(i).r)
    {
      arr.get(i).clicked=true; //if knife is in contact with fruit, cut fruit in half!
    }
    s.slice(); //works, but only makes sound the first time
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
