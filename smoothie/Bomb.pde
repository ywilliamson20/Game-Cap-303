//This class will display and keep track of when bombs will appear on screen
class Bomb{
  //variables here
  float r;
  float x, y;
  boolean clicked;
  
  Bomb(){
  //constructor
  r = 50;
  }
  
  //update location of bomb
  void update()
  {
    
    
  }
  
  //display the bomb on screen
  void display()
  {
    if(!clicked){
    ellipse(x, y, r, r);
    }
    else{ 
    rect(x, y, r, r);  
    } 
  }
  
}
