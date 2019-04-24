//This class will display and keep track of when bombs will appear on screen
class Bomb {
  //variables here
  float r;
  float x, y;
  boolean clicked;

  Bomb(float xx, float yy) {
    //constructor
    r = 50;
    x=xx;
    y=yy;
  }

  //update location of bomb
  void update(int pr)
  {
    if (x<width/2) {
      x+=pr;
      y-=5;
    } else
    {
      x+=pr;
      y+=5;
    }
    
    //bomb is touched/sliced, game resets
    if (clicked) {
      start = false;
    }
  }

  //display the bomb on screen
  void display()
  {
    fill(0);
    ellipse(x, y, r, r);
  }
}
