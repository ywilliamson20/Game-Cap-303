//This class will intialize the fruit objects and be in charge of displaying them
//Fruit image: https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjQ0YnoltbhAhUMh-AKHXKjC6YQjRx6BAgBEAU&url=http%3A%2F%2Fwww.clker.com%2Fclipart-red-glossy-apple.html&psig=AOvVaw2doxlAA23z7xU72pZxuuV5&ust=1555557871222885
class Fruit{
  //variables
  float r;
  float x,y;
  boolean clicked;
  PImage a1, a2, a3;
  
  Fruit(float xx, float yy){
    //Constructor
    r=100;
    x=xx;
    y=yy;
    a1 = loadImage ("apple1.png");
    a2 = loadImage ("apple2.png");
    a3 = loadImage("apple3.png");
    
  }

//this function will display the fruit as a whole fruit or sliced into two pieces based on whether its been sliced or not
  void display()
  {
    if(!clicked){
    image(a1, x, y);
    //ellipse(x, y, r, r);
    }
    else{ 
      image(a2, x, y);
      image(a3, x+70, y);
       //ellipse(x+70, y, r/2, r);
       //ellipse(x, y, r/2, r);  
    } 
  }
}
