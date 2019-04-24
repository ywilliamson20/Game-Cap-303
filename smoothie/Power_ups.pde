//This class will hold all the power ups that player can use in the game
class Power_ups {
  //variables here
    int x;
    int y;
    boolean ready1;
    boolean ready2;
    boolean ready3;
    int score;
    color col;
    String keyboard;
    
  Power_ups() {
    //constructor
    x=700;
    y=50;
    col=(200);
    ready1=false;
    ready2=false;
    ready3=false;
    keyboard="";
  }

  //indicators of the power ups will be displayed
  //once power up is ready the indicator will change color
  void display()
  {
    fill(col);
    rect(x,y,50,50);
    fill(255);
    textSize(50);
    text(keyboard, x+10, y+40);
    textSize(30);
  
    
  }

  //will keep track of when power ups have been "filled up" and are ready for the player to use
  void ready(int scor)
  {
    score=scor;
    if(score>100)
    {
      col=color(0, 0, 255);
      ready1=true;
      keyboard = "w";
      //dec=-100;
    }
    
    if(score>200)
    {
      col=color(255,0,0);
      ready2=true;
      keyboard = "a";
      //ready1=false;
      //dec=-200;
    }
    
    if(score>300)
    {
      
      col=color(0,255,0);
      ready3=true;
      keyboard  = "s";
       //dec=-300;
    }
    //return dec;
  }

  //the power ups will go away at the end of a level
  //the values of that will keep track of when the power ups is ready to use will be zero again
  void restart()
  {
   score=0;
    fill(200);
    ready1=false;
    ready2=false;
    ready3=false;
    
  }
  
}
