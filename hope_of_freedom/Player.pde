class Player {
  int x, y;               //posicion jugador
  int controlframe = 0;   //controla que frame se muestra al moverse
  int sentido = 0;        //controla si se muestra la primera fila de frames o la segunda cambiando el valor en y de copy.
  int tiempof = 0;        //controla el tiempo que tarda en cambiar de frame
  
  Player(int tempX, int tempY){  //constructor
   x = tempX;
   y = tempY;
  }
  
  void displayYmover() {  //muestra al jugador en pantalla y controla sus movimientos y animaciones
   copy(player1,controlframe,sentido,70,120,this.x,y,100,150);
   
   if(keyPressed){
     
    if(key == 'a' || key == 'A'){      //pj se mueve a la izquierda
    this.x-=6;
    if(tiempof == 2){              
    controlframe += 70;   
    sentido = 0;}
    
    }
    else if(key == 'd' || key == 'D'){  //pj se mueve a la derecha
    this.x+=6;
    if(tiempof == 2){
    controlframe += 70;
    sentido = 120;}

    }
   }
   
   if(tiempof > 2)   //iteración del tiempo que tarda en cambiar de frame
   tiempof = 0;
   else tiempof++;
   
   if(controlframe == 280)  //iteración de frames, cuando llega al ultimo vuelve al primero
   controlframe=0;
   
   if(keyPressed == false)  //si el pj no se mueve el sprite cambia al que esta quieto de pie, evitando que se quede quieto en un frame de movimiento
     controlframe = 0;
     
     
  }
  
  
  
}
