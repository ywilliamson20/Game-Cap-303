ArrayList<Fruit> arr;
float x, y;
boolean click;

void setup()
{
  size(800,800);
  background(124, 94, 56);
  arr= new ArrayList<Fruit>();
  x=0;
  y=height;
  Fruit f= new Fruit(x,y);
  arr.add(f);
  fill(255,0,0);
  Fruit f1= new Fruit(width/2,height/2);
  arr.add(f1);
  fill(255,0,0);
}



void draw()
{
  background(124, 94, 56);
  arr.get(0).display();
  arr.get(1).display();
  
  if(arr.get(0).clicked)
  {
    //if(arr.get(0).x<width/2){
      arr.get(0).x-=5;
      arr.get(0).y+=5;
    //}else
    //{
    //  arr.get(0).x+=5;
    //  arr.get(0).y-=5;
      
    //}
    
  }else
  {
   if(arr.get(0).x<width/2){
    arr.get(0).x+=5;
    arr.get(0).y-=9;
   }
   else
   {
     arr.get(0).x+=2;
    arr.get(0).y+=3;
   
   }
  }
  
}

void mousePressed()
{
  for(int i=0;i<arr.size();i++){
  float d=dist(mouseX, mouseY, arr.get(i).x, arr.get(i).y);
  if(d<arr.get(i).r)
  //if(mouseX<arr.get(0).x+arr.get(0).r&&mouseY<arr.get(0).y+arr.get(0).r)
  {
    
   arr.get(i).clicked=true;
  }
  }
  
}
