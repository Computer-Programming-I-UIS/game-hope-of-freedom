class Player {
  int x, y;               //posicion jugador
  int controlframe = 0;   //controla que frame se muestra al moverse
  int sentido = 0;        //controla si se muestra la primera fila de frames o la segunda cambiando el valor en y de copy.

  
  Player(int tempX, int tempY){  //constructor
   x = tempX;
   y = tempY;
  }
  
  void displayYmover() {  //muestra al jugador en pantalla y controla sus movimientos y animaciones
   copy(player1,controlframe,sentido,70,120,x,y,100,150);
   
   if(keyPressed){
     
    if(key == 'a' || key == 'A'){       //pj se mueve a la izquierda
    controlframe += 70;   
    sentido = 0;
    x-=8;
    }
    else if(key == 'd' || key == 'D'){  //pj se mueve a la derecha
    controlframe += 70;
    sentido = 120;
    x+=8;
    }
   }
   
   if(controlframe == 280) //iteración de frames, cuando llega al ultimo vuelve al primero
   controlframe=0;
   
   if(keyPressed == false)  //si el pj no se mueve el sprite cambia al que esta quieto de pie, evitando que se quede quieto en un frame de movimiento
     controlframe = 0;
   
   
   
  }
  
  
}