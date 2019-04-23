//Smoothie Warrior
//By Lara Disuanco and Yvette Williamson
import controlP5.*;

//variables
ControlP5 controlP5;

int [] pro;
ArrayList<Bomb> barr;
ArrayList<Fruit> arr;
Knife k;
Sound_effects s;
int rf=0;
int rb=0;
int j=0;
int m=0;

float x, y;

PImage im;
PImage bim;
PFont fo;

float pmx=0;
float pmy=0;

Power_ups pow;
boolean start;
int score;
int sc;
boolean cutt;

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

  score = 0;
  
  s.bgm();
}


//This function will display all objects and track mouse for correct "slicing" of fruit
void draw()
{
  rb=(int)random(100,400);
  rf=(int)random(50,300);
  //when start button is pressed, start game
  if (start) {
    
    k. display();
    background(im);
 
    pow.display();
     fill(255,255,0);
     text("Score: " + score, width/2 - 200, 100);
     
     //for fruit
   for (int i=0; i<arr.size(); i++) {

    arr.get(i).update(10);
    arr.get(i).display();
    pow.ready(score);
    
    //for score
    if (cutt) {
      score=scoring();
      cutt=false;
    }

   }
     if(frameCount%rf==0)
     {
         m++;
          println(arr.size());
       if(m>9&&arr.get(7).y>height){
         m=0;
         // println("gotz here");
         arr.clear();
         
     }
      else if (m<9){
        Fruit fff=new Fruit(x,y);
       arr.add(fff);
     
    }
     }
  
    //for bombs
    for (int t=0; t<barr.size(); t++)
    {
      barr.get(t).update(3);
      barr.get(t).display();
    }
     if(frameCount%rb==0)
     {
       j++;
       if(j>9&&barr.get(7).y>height){
       j=0;
       
     barr.clear();
      //println("got here");
     }
      else if (j<9){
        //if(arr.size()<10){
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
    
    //reset
    arr.clear();
    //for (int i=0; i<arr.size(); i++) {
    //  arr.get(i).clicked=false;
    //  arr.get(i).x=0+i*2;
    //  arr.get(i).y=height;
    //}
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
    if (d<arr.get(i).r&&!arr.get(i).clicked)
    {
      arr.get(i).clicked=true; //if knife is in contact with fruit, cut fruit in half!
      cutt=true;
      
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

//Keep track of score
int scoring()
{
  sc+=20;
  
  return sc;
}
