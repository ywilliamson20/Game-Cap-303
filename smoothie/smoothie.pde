//Smoothie Warrior
//By Lara Disuanco and Yvette Williamson
import controlP5.*;

//variables
ControlP5 controlP5;

int [] prob;
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
int powpo;
Power_ups pow;
boolean start;
int score;
int sc;
boolean cutt;
//boolean level1, level2;
boolean level1;

int savedTime;
int totalTime;

//This function will setup the main menu and intialize objects and locations
void setup()
{
  size(800, 800);

  controlP5 = new ControlP5(this);
  //controlP5.addButton("startButton").setValue(0).setPosition(10, 30).setSize(100, 60).setCaptionLabel("Start").getCaptionLabel().setSize(30);
  //controlP5.addButton("quitButton").setValue(0).setPosition(10, 100).setSize(100, 60).setCaptionLabel("Quit").getCaptionLabel().setSize(30);
  //  controlP5.addButton("lvl1Button").setValue(0).setPosition(10, 650).setSize(100, 60).setCaptionLabel("Level 1").getCaptionLabel().setSize(30);
  //  controlP5.addButton("lvl2Button").setValue(0).setPosition(10, 720).setSize(100, 60).setCaptionLabel("Level 2").getCaptionLabel().setSize(30);
  im=loadImage("woodbac.jpg");
  bim=loadImage("flo_nin.jpg");

  start = false;
  level1 = true;
  pow= new Power_ups();
  background(im);
  pro=new int[10];
  prob=new int[10];
  for (int i =0; i<pro.length; i++)
  {
    prob[i]=(int)random(3, 6);
    pro[i]=(int)random(3, 10);
  }
  barr = new ArrayList<Bomb>();

  arr = new ArrayList<Fruit>();

  k = new Knife();
  s = new Sound_effects(this);

  x = 0;
  y = height;

  score = 0;

  s.bgm();

  savedTime = millis();
  totalTime = 60000; //one minute
}


//This function will display all objects and track mouse for correct "slicing" of fruit
void draw()
{ 
  //must decide between level 1 or 2 before pressing start

  rb=(int)random(100, 400);
  rf=(int)random(50, 300);
  if (level1)
  {
    rb=(int)random(100, 400);
    rf=(int)random(50, 300);
    //println("twoos");
  } else
  {
    rb=(int)random(10, 100);
    rf=(int)random(10, 50);
    //println("oonee");
  }

  //when start button is pressed, start game
  if (start) {
    //timer
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      start = false;
      background(255);
      textSize(80);
      text("Game Over!", 300, 400);
      savedTime = millis();
    }
    println("Passed Time: " + passedTime);
    
    if (keyPressed) {
      if (key=='w'&& pow.ready1)
      {

        powpo=1;
      } else if (key=='a'&& pow.ready2)
      {
        powpo=2;
      } else if (key=='s'&& pow.ready3)
      {
        powpo=3;
      }
    }

    k. display();
    background(im);

    fill(0);     //create start button for while in game
    rect(10, 30, 100, 60);
    textSize(30);
    fill(249, 209, 4);
    text("Start", 22, 70);

    fill(0);  //create quit button for while in game
    rect(10, 100, 100, 60);
    textSize(30);
    fill(249, 209, 4);
    text("Quit", 25, 140);

    pow.display();
    fill(249, 209, 4);
    text("Score: " + score, width/2 - 200, 100);
    
    fill(249, 209, 4);
    text("Timer: " + passedTime/1000, width/2 - 200, 60);

    //for fruit
    for (int i=0; i<arr.size(); i++) {

      arr.get(i).update(pro[i]);
      arr.get(i).display();
      pow.ready(score);

      //for score
      if (cutt) {
        score=scoring();
        cutt=false;
      }
    }
    if (powpo==1)
    {
      rf=10;
      //println("got here");
    }
    if (powpo==3)
    {
      rf=400;
    }
    if (powpo==2)
    {
      rf=400;
      //println("got here");
    }
    if (powpo==3)
    {
      rf=400;
    }

    if (frameCount%rf==0)
    {
      m++;
      println(arr.size());
      if (m>9&&arr.get(7).y>height) {
        m=0;
        // println("gotz here");
        arr.clear();
      } else if (m<9) {
        Fruit fff=new Fruit(x, y);
        arr.add(fff);
      }
    }

    //for bombs
    for (int t=0; t<barr.size(); t++)
    {
      barr.get(t).update(prob[t]);
      barr.get(t).display();
    }
    if (frameCount%rb==0)
    {
      j++;
      if (j>9&&barr.get(7).y>height) {
        j=0;

        barr.clear();
        //println("got here");
      } else if (j<9) {
        //if(arr.size()<10){
        Bomb fff=new Bomb(x, y);
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

    fill(0);     //start button
    rect(10, 30, 100, 60);
    textSize(30);
    fill(249, 209, 4);
    text("Start", 22, 70);

    fill(0);  //quit button
    rect(10, 100, 100, 60);
    textSize(30);
    fill(249, 209, 4);
    text("Quit", 25, 140);

    //reset
    arr.clear();
    barr.clear();
    score=0;
    pow.restart();

    //for (int i=0; i<arr.size(); i++) {
    //  arr.get(i).clicked=false;
    //  arr.get(i).x=0+i*2;
    //  arr.get(i).y=height;
    //}

    if (level1) {
      fill(0);
      rect(10, 170, 100, 60);
      textSize(30);
      fill(249, 209, 4);
      text("Level 1", 15, 210);
    } else {
      fill(0);
      rect(10, 170, 100, 60);
      textSize(30);
      fill(249, 209, 4);
      text("Level 2", 15, 210);
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
  //rect(10, 170, 100, 60);
  if (!start) {
    if (mouseX > 10 && mouseX < 10+100 && mouseY > 170 && mouseY < 170+60) {
      level1 = !level1;
      println(level1);
    }
  }
  if (mouseX > 10 && mouseX < 10+100 && mouseY > 30 && mouseY < 30+60) { //start button
    start = true;
    println(start);
  }
  if (mouseX > 10 && mouseX < 10+100 && mouseY > 100 && mouseY < 100+60) { //start button
    start = false;
    println(start);
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

/*//start button
 void startButton() {
 start = true;
 }
 
 //for quit button 
 void quitButton() {
 start = false;
 }
 
 //for level 1 button 
 void lvl1Button() {
 level1 = true;
 level2 = false;
 //controlP5.getController("startButton").setPosition(10, 30);
 //controlP5.getController("quitButton").setPosition(10, 100);
 
 }
 
 //for level 2 button 
 void lvl2Button() {
 level1 = false;
 level2 = true;
 
 }*/

//Keep track of score
int scoring()
{
  sc+=20;

  return sc;
}
