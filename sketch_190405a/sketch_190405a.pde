import controlP5.*;
ControlP5 controlP5;

ArrayList<Fruit> arr;
float x, y;
boolean click;
float pmx=0;
float pmy=0;
boolean start;

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
  Fruit f1 = new Fruit(width/2, height/2);
  arr.add(f1);
  fill(255, 0, 0);
}



void draw()
{
  if (start) {
    background(124, 94, 56);
    arr.get(0).display();
    arr.get(1).display();

    if (arr.get(0).clicked)
    {
      //if(arr.get(0).x<width/2){
      arr.get(0).x-=5;
      arr.get(0).y+=5;
      //}else
      //{
      //  arr.get(0).x+=5;
      //  arr.get(0).y-=5;

      //}
    } else
    {
      if (arr.get(0).x<width/2) {
        arr.get(0).x+=5;
        arr.get(0).y-=9;
      } else
      {
        arr.get(0).x+=2;
        arr.get(0).y+=3;
      }
    }
  } else {
    background(255);
   textSize(70);
    text("Smoothie Warrior!", width/2 - 300, height/2);
  }
}

void mousePressed()
{
  for (int i=0; i<arr.size(); i++) {
    float d=dist(mouseX, mouseY, arr.get(i).x, arr.get(i).y);
    pmx= mouseX;
    pmy=mouseY;

  }
}

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

void startButton() {
  start = true;
  //println("startButton startButton.");
}

void quitButton() {
  start = false;
  //println("quitButton quitButton.");
}
