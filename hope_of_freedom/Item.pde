class Item extends Objinter { //para objetos interactuables que no son puertas
  
  
  Item(int xp, int yp, int wp, int hp){
  super(xp,yp,wp,hp);
  }

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------  
  void interaccionesSala1(){  //Estos medodos se dividen por escenarios porque no es necesario separarlos para cada objeto y asi es mas optimo, pero es recomendable separarlos para evitar inconvenientes.
  if((key == 'w' || key == 'W')&& pj.x +60 > cuadro.x && pj.x +40 < cuadro.x + cuadro.w){ //interacciones con el cuadro de la galleta
  if(luzlamp == false){
  cuad1.display();}
  else if (luzlamp == true){
  cuad2.display();
  text("Has conseguido una chispa de chocolate!",150,100);
  nomChispa = true;
  estadocuadro = 2;
  estadocajon = 2;
  abierta = true;}
  }
    
  if((key == 'w' || key == 'W') && pj.x +60 > cajonbateria.x && pj.x +40 < cajonbateria.x + cajonbateria.w){ //interacciones con el cajon donde esta la bateria
  if(estadocajon == 0)
  bat0.display();
  if(estadocajon == 3){
  bat1.display();
  text("Has conseguido una bateria!\n(Si presionas E se abre el inventario)",150,100);
  }
  }   

  if((key == 'w' || key == 'W') && pj.x +60 > lampara.x && pj.x +40 < lampara.x + lampara.w){ //interacciones con la lampara
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

   if((key == 'w' || key == 'W') && pj.x +60 > tablero.x && pj.x +40 < tablero.x + tablero.w){   //interaccion con el tablero
   textSize(30);  
   tabler1.display();
   estadocajon = 1;
   }
}

//------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
   
   void interaccionesJardin(){ 
   if((key == 'w' || key == 'W') && pj.x +60 > cartel.x && pj.x +40 < cartel.x + cartel.w){ //interaccion con el cartel del jardin
   textSize(30);  
   cart.display(); 
   }
  
   if((key == 'w' || key == 'W') && pj.x +60 > columpio.x && pj.x +40 < columpio.x + columpio.w){  //interaccion con columpio del jardin
   if(changesuelo == false)  
   colump1.display();
   else if(changesuelo == true){
   colump2.display();
   cortacuerda = true;
   text("Has conseguido una cuerda",150,100);
   nomCuerda = true;}
   }
    
   if((key == 'w' || key == 'W') && pj.x +60 > flor.x && pj.x +40 < flor.x + flor.w){ //interaccion con flor del jardin
   if(getpala == false)  
   flor1.display(); 
   else if(getpala == true && llenado == false)
   flor2.display();
   else if(getpala == true && llenado == true){
   flor3.display();
   crecimiento = true;
   text("Presiona R para escalar la planta",150,100);}
   }
   
   if((key == 'w' || key == 'W') && pj.x +60 > palaobjeto.x && pj.x +40 < palaobjeto.x + palaobjeto.w){ //interaccion con pala del jardin
   if(knowstumba == false)
   pala0.display();
   else if(knowstumba == true && changesuelo == false){
   pala1.display();
   getpala = true;
   text("Has conseguido una pala!",150,100);
   nomPala = true;}
   }
}
   
//------------------------------------------------------------------------------------------------------------------------------------------------------------------

   void interaccionesJardin2(){
   if((key == 'w' || key == 'W') && pj.x +60 > pozo.x && pj.x +40 < pozo.x + pozo.w){ //interacciones con el pozo del jardin 2
   if(changesuelo == false)
   pozo1.display();
   else if(changesuelo == true && cortacuerda == false)
   pozo2.display();
   else if(changesuelo == true && cortacuerda == true){
   text("Llenaste la cubeta con agua",150,100);
   llenado = true;
   pozo3.display();}
   }
   
   if((key == 'w' || key == 'W') && pj.x +60 > tumba.x && pj.x +40 < tumba.x + tumba.w){ //interacciones con la tumba del jardin 2
   if(getpala == false){  
   tumba1.display();
   knowstumba = true;}
   else if(getpala == true){
   changesuelo = true;
   textSize(35);
   tumba2.display();
   text("Has conseguido una cubeta!",150,100);
   nomCubeta = true;}
   }
}

//------------------------------------------------------------------------------------------------------------------------------------------------------------------

   void interaccionesSala2(){
   if((key == 'w' || key == 'W') && pj.x +60 > hoja1.x && pj.x +40 < hoja1.x + hoja1.w){ //interacciones con las 3 hojas
   textSize(30);  
   textohoja1.display();  
   }
   if((key == 'w' || key == 'W') && pj.x +60 > hoja2.x && pj.x +40 < hoja2.x + hoja2.w){
   textSize(30);  
   textohoja2.display();  
   }
   if((key == 'w' || key == 'W') && pj.x +60 > hoja3.x && pj.x +40 < hoja3.x + hoja3.w){
   textSize(30);
   textohoja3.display();
   estadocofre = 1;
   }
   
   
   if((key == 'w' || key == 'W') && pj.x +60 > cofre.x && pj.x +40 < cofre.x + cofre.w){ //interacciones con el cofre
   if(estadocofre == 0)
   cofre1.display();
   if(estadocofre == 2){
   cofre2.display();
   text("Has conseguido una galleta de chocolate",150,100);
   nomGalleta = true;
   getgalleta = true;
   abierta2 = true;}
   }
   
   
   
   }
   
}   
