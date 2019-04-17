//This class is for the knife that will follow the location of the mouse
//Knife image: https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwi3kYaNldbhAhVRUt8KHYEjAd8QjRx6BAgBEAU&url=https%3A%2F%2Fopenclipart.org%2Fdetail%2F174868%2Fknife&psig=AOvVaw1cAFqnHWPGhQnKDgyKsb_P&ust=1555557416447881
class Knife {
  //variables here
  int x, y;
  PImage im;

  Knife() {
    //constructor
    im = loadImage("knife.png");
  }

  //this function will display the knife the player can use to slice fruit
  void display()
  {
    cursor(im, x, y);
  }
}
