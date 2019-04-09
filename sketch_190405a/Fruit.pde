class Fruit{
  float r;
  float x,y;
  boolean clicked;
  
  Fruit(float xx, float yy){
    r=100;
    x=xx;
    y=yy;
    //clicked=click;
  }
  
  void display()
  {
    if(!clicked){
    ellipse(x, y, r, r);
    }
    else{ 
       ellipse(x+70, y, r/2, r);
       ellipse(x, y, r/2, r);  
    } 
  }
}
