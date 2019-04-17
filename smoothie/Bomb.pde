//This class will display and keep track of when bombs will appear on screen
class Bomb{
  //variables here
  float r;
  float x, y;
  boolean clicked;
  
  Bomb(){
  //constructor
  r = 50;
  x=400;
  y=400;
  }
  
  //update location of bomb
  void update()
  {
    //x+=5;
    //y+=5;
    
  }
  
  //display the bomb on screen
  void display()
  {
    //if(!clicked){
      fill(0);
    ellipse(x, y, r, r);
    //}
    //else{ 
    //rect(x, y, r, r);  
    //} 
  }
  
}
