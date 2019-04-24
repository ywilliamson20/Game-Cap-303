//Smoothie Warrior
//By Lara Disuanco and Yvette Williamson

//Variables

//for trajectory of fruits and bombs
int [] prob;
int [] pro;
//Arraylists to hold fruit and bombs
ArrayList<Bomb> barr;
ArrayList<Fruit> arr;
Knife k;
Sound_effects s;
//for keeping track of random trajectories
int rf=0;
int rb=0;
//to keep track of amount of items in each arraylist
int j=0;
int m=0;
//location for objects
float x, y;
//for images
PImage im;
PImage bim;
//for UI
PFont fo;
boolean dissco;
//for dragging
float pmx=0;
float pmy=0;
//for power ups
int powpo;
Power_ups pow;
//for UI
boolean start;
int score;
int sc;
boolean cutt;
boolean level1;
//for timer
int savedTime;
int totalTime;

//This function will setup the main menu and intialize objects and locations
void setup()
{
  size(800, 800);

  //images loaded
  im=loadImage("woodbac.jpg");
  bim=loadImage("flo_nin.jpg");

  //booleans for UI
  dissco=false;
  start = false;
  level1 = true;
  //create power ups object
  pow= new Power_ups();
  //set background
  background(im);

  //set trajectory arrays
  pro=new int[10];
  prob=new int[10];
  for (int i =0; i<pro.length; i++)
  {
    prob[i]=(int)random(3, 6);
    pro[i]=(int)random(3, 10);
  }

  //set arraylist of objects
  barr = new ArrayList<Bomb>();
  arr = new ArrayList<Fruit>();

  //Kinfe and sound effect objects made
  k = new Knife();
  s = new Sound_effects(this);

  //starting location set
  x = 0;
  y = height;

  //score is set
  score = 0;

  //background music will begin to play
  s.bgm();

  //set timer
  savedTime = millis();
  totalTime = 60000; //one minute
}


//This function will display all objects and UI, and track mouse for correct "slicing" of fruit and bombs
//This function will also keep track of key presses for the power ups
void draw()
{ 

  //must decide between level 1 or 2 before pressing start
  if (level1)
  {
    rb=(int)random(100, 400);
    rf=(int)random(50, 300);
  } else
  {
    rb=(int)random(10, 100);
    rf=(int)random(10, 50);
  }

  //when start button is pressed, start game
  if (start) {

    //timer
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      //end game
      start = false;
      background(255);
      textSize(80);
      text("Game Over!", 300, 400);
      savedTime = millis();
    }

    if (passedTime/1000==0)
    {
      //reset game
      score=0;
      sc=0;
      pow.col=color(200);
      pow.keyboard="";
      pow.restart();  
      powpo=0;
    }

    //keys for powerups
    if (keyPressed) {
      if (key=='w'&& pow.ready1)
      {
        //more fruit
        powpo=1;
      } else if (key=='a'&& pow.ready2)
      {
        //less bombs
        powpo=2;
      } else if (key=='s'&& pow.ready3)
      {
        //slow down time
        powpo=3;
      }
    }

    //knife is displayed
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

    //display power ups, timer, and score
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
        dissco=true;
      }
    }

    //for 'w' power up, more fruit
    if (powpo==1)
    {
      rf=10;
    }

    //for 's' power up, slow down time
    if (powpo==3)
    {
      rf=400;
    }

    //for displaying fruit at random times
    if (frameCount%rf==0)
    {
      m++;

      //once amount is hit, reset arraylist
      if (m>9&&arr.get(7).y>height) {
        m=0;
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

    //for 'a' power up, less bombs
    if (powpo==2)
    {
      rb=700;
    }

    //for 's' power up, slow down time
    if (powpo==3)
    {
      rb=400;
    }

    //for displaying bombs at random times
    if (frameCount%rb==0)
    {
      j++;
      //once amount of bombs is reached, reset arraylist
      if (j>9&&barr.get(7).y>height) {
        j=0;

        barr.clear();
      } else if (j<9) {
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


    arr.clear();     //reset
    barr.clear();

    if (dissco) {    //score display
      textSize(80);
      fill(66, 244, 155);
      text("Score: " + score, width/2-150, height/2);
    }

    pow.restart();    //reset
    savedTime = millis();
    m=0;
    j=0;

    //Level button displayed
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


  if (!start) {
    if (mouseX > 10 && mouseX < 10+100 && mouseY > 170 && mouseY < 170+60) { //level button
      level1 = !level1;
    }
  }
  if (mouseX > 10 && mouseX < 10+100 && mouseY > 30 && mouseY < 30+60) { //start button
    start = true;
  }

  if (mouseX > 10 && mouseX < 10+100 && mouseY > 100 && mouseY < 100+60) { //quit button
    start = false;
  }
}

//if mouse dragged, draw line from old mouse x,y position to the new mouse x,y position
void mouseDragged()
{
  line(pmx, pmy, mouseX, mouseY);

  //for fruit
  for (int i=0; i<arr.size(); i++) {
    float d=dist(mouseX, mouseY, arr.get(i).x, arr.get(i).y);
    if (d<arr.get(i).r&&!arr.get(i).clicked)
    {
      arr.get(i).clicked=true; //if knife is in contact with fruit, cut fruit in half!
      cutt=true;
    }
    s.slice(); //works, but only makes sound the first time
  }

  //for bomb
  for (int i=0; i<barr.size(); i++) {
    float d=dist(mouseX, mouseY, barr.get(i).x, barr.get(i).y);
    if (d<barr.get(i).r&&!barr.get(i).clicked)
    {
      barr.get(i).clicked=true; //if bomb is in contact with fruit, gameover!
      cutt=true;
    }
    s.slice();
  }
}

//Keep track of score
int scoring()
{
  sc+=20;

  return sc;
}
