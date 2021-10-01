class Player {
  int x, y;               //posicion jugador
  int controlframe = 0;   //controla que frame se muestra al moverse
  int sentido = 0;        //controla si se muestra la primera fila de frames o la segunda cambiando el valor en y de copy.

  
  Player(int tempX, int tempY){
   x = tempX;
   y = tempY;
  }
  
  void displayYmover() {
   copy(player1,controlframe,sentido,70,120,x,y,100,150);
   
   if(keyPressed){
     
    if(key == 'a'){
    controlframe += 70;
    sentido = 0;
    x-=4;
    }
    else if(key == 'd'){
    controlframe += 70;
    sentido = 120;
    x+=4;
    }
   }
   
   if(controlframe == 280)
   controlframe=0;
   
  }
  
  
}
