//This class will intialize the fruit objects and be in charge of displaying them
class Fruit{
  //variables
  float r;
  float x,y;
  boolean clicked;
  
  Fruit(float xx, float yy){
    //Constructor
    r=100;
    x=xx;
    y=yy;
    
  }

//this function will display the fruit as a whole fruit or sliced into two pieces based on whether its been sliced or not
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
