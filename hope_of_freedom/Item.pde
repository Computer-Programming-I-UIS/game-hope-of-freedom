class Item extends Objinter { //para objetos interactuables que no son puertas
  
  
  Item(int xp, int yp, int wp, int hp){
  super(xp,yp,wp,hp);
  }
  
  void interactuarC(){  //interacciones con el cuadro de la galleta
  if((key == 'w' || key == 'W')&& pj.x +60 > x && pj.x +40 < x + w){ 
  if(luzlamp == false){
  cuad1.display();}
  else if (luzlamp == true){
  cuad2.display();
  text("Has conseguido una chispa de chocolate!",420,100);
  estadocuadro = 2;
  estadocajon = 2;
  puerta1.abierta = true;}
  
  }
  
  }  
  
  void interactuarB(){ //interacciones con el cajon donde esta la bateria
  if((key == 'w' || key == 'W') && pj.x +60 > x && pj.x +40 < x + w){
  if(estadocajon == 0)
  bat0.display();
  if(estadocajon == 3){
  bat1.display();
  text("Has conseguido una bateria!",320,100);
  }
  } 
  }  

  void interactuarL(){ //interacciones con la lampara  
  if((key == 'w' || key == 'W') && pj.x +60 > x && pj.x +40 < x + w){
  if(estadobateria == 1){
   lamp1.display();
  }
  if(estadobateria == 2){
   lamp2.display();
   luzlamp = true;
  }
  if(estadocajon == 2){
  lamp3.display();  
  }
} 
}

  void interactuarT(){ //interaccion con el tablero
   if((key == 'w' || key == 'W') && pj.x +60 > x && pj.x +40 < x + w){  
   textSize(30);  
   tabler1.display();
   estadocajon = 1;
   }

   } 
   
   
}   
