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
  text("Has conseguido una bateria!\n(Si presionas E se abre el inventario)",420,100);
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
   
   void interactuarCartel(){ //interaccion con el cartel del jardin
   if((key == 'w' || key == 'W') && pj.x +60 > x && pj.x +40 < x + w){
   textSize(33);  
   cart.display(); 
   }
   }
   
   void interactuarColump(){ //interaccion con columpio del jardin
   if((key == 'w' || key == 'W') && pj.x +60 > x && pj.x +40 < x + w){
   if(changesuelo == false)  
   colump1.display();
   else if(changesuelo == true){
   colump2.display();
   cortacuerda = true;
   text("Has conseguido una cuerda",320,100);}
   }
   }
   
   void interactuarFlor(){ //interaccion con flor del jardin
   if((key == 'w' || key == 'W') && pj.x +60 > x && pj.x +40 < x + w){
   if(getpala == false)  
   flor1.display(); 
   if(getpala == true)
   flor2.display();
   if(llenado == true){
   flor3.display();
   crecimiento = true;
   text("Presiona R para escalar la planta",350,100);}
   }
   }
   
   void interactuarPala(){
   if((key == 'w' || key == 'W') && pj.x +60 > x && pj.x +40 < x + w){
   if(knowstumba == false)
   pala0.display();
   else if(knowstumba == true && changesuelo == false){
   pala1.display();
   getpala = true;
   text("Has conseguido una pala!",320,100);}
   }
   }
   
   void interactuarPozo(){
   if((key == 'w' || key == 'W') && pj.x +60 > x && pj.x +40 < x + w){
   if(changesuelo == false)
   pozo1.display();
   if(changesuelo == true)
   pozo2.display();
   if(cortacuerda == true){
   pozo3.display();
   text("Llenaste la cubeta con agua",320,100);
   llenado = true;}
   }
   }
   
   void interactuarTumba(){
   if((key == 'w' || key == 'W') && pj.x +60 > x && pj.x +40 < x + w){
   if(getpala == false){  
   tumba1.display();
   knowstumba = true;}
   else if(getpala == true){
   changesuelo = true;
   textSize(35);
   tumba2.display();
   text("Has conseguido una cubeta!",320,100);}
   }
   }
   
   void interactuarHoja1(){
   if((key == 'w' || key == 'W') && pj.x +60 > x && pj.x +40 < x + w){
   textSize(30);  
   textohoja1.display();  
   }
   }
   
}   
