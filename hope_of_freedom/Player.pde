class Player {
  int x, y;
  float refresco;
  Sprite player;
  
  Player(int tempX, int tempY){
   x = tempX;
   y = tempY;
  }
  
  void displayYmover() {
   fill(5);
   rect(x,y,60,120);
   
   if(keyPressed){
    if(key == 'w')
    y-=5;
    else if(key == 's')
    y+=5;
    else if(key == 'a')
    x-=4;
    else if(key == 'd')
    x+=4;
   }
  }
  
  
}
