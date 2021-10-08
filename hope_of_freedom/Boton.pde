class Boton {
  int x, y, w, h;
  String text;
  
  Boton(int posX, int posY, int ancho, int alto, String texto) { //constructor
    x = posX;
    y = posY;
    w = ancho;
    h = alto;
    text = texto;
  }
  
  void displayDetect () { //muestra el boton y detecta si el mouse está encima de este 
     strokeWeight(10);
     strokeJoin(ROUND);
     stroke(216,196,116);
     fill(17,16,50);
     rect(x,y,w,h);
     fill(222,191,65);
     textAlign(CENTER);
     text(text,x+(w/2),y+(h/1.6));
     
   if(mouseX>this.x && mouseX<this.x+w && mouseY>this.y && mouseY<this.y+h){
     strokeWeight(14);
     strokeJoin(ROUND);
     stroke(255,255,0);
     fill(10,9,43);
     rect(x,y,w,h);
     fill(175,151,53);
     textAlign(CENTER);
     text(text,x+(w/2),y+(h/1.6));
     }
  }
  
  //métodos para los efectos de cada boton
  
  void updateJugar(){
     if(mousePressed && mouseX>jugar.x && mouseX<jugar.x+w && mouseY>jugar.y && mouseY<jugar.y+h){
     escenario = 2; //ir al primer escenario jugable
     botons.trigger();
     }
  }
    
  void updateInstrucciones(){
  if(mousePressed && mouseX>instrucciones.x && mouseX<instrucciones.x+w && mouseY>instrucciones.y && mouseY<instrucciones.y+h){
     escenario = 1; //ir a la pantalla de instrucciones/controles
     botons.trigger();
     }
  }
  
  void updateVolver(){ 
  if(mousePressed && mouseX>volver.x && mouseX<volver.x+w && mouseY>volver.y && mouseY<volver.y+h){
     escenario = 0; //de la pantalla de controles regresarse al menu principal
     botons.trigger();
     }
  }
  
  void updateSalir(){ 
  if(mousePressed && mouseX>salir.x && mouseX<salir.x+w && mouseY>salir.y && mouseY<salir.y+h)
     exit(); //salir del juego
  }
  
  void updateReturnmenu(){ 
  if(mousePressed && mouseX>returnmenu.x && mouseX<returnmenu.x+w && mouseY>returnmenu.y && mouseY<returnmenu.y+h){
     escenario = 0; //volver al menu principal desde el juego
     botons.trigger();
     }
  }  
  
}    
   
  
  
