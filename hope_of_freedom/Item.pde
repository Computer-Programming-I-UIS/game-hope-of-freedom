class Item extends Objinter {
  
  
  Item(int xp, int yp, int wp, int hp){
  super(xp,yp,wp,hp);
  }
  
  void interactuarC(){
  if((key == 'w' || key == 'W')&& pj.x +60 > x && pj.x +40 < x + w)
  cuad1.display();
  }  
  
  void interactuarB(){
  if((key == 'w' || key == 'W') && pj.x +60 > x && pj.x +40 < x + w){
  if(estadocajon == 1){ 
  bat1.display();
  text("Has conseguido una bateria.",300,100);
  estadobateria = 2;}
  if(estadocajon == 2)
  bat2.display();
  }
  }  

  void interactuarL(){
  
  if((key == 'w' || key == 'W') && pj.x +60 > x && pj.x +40 < x + w){  
  if(estadobateria == 1){
   lamp1.display();

  }
  if(estadobateria == 2){
   lamp2.display();
   estadocajon = 2;
  }
  
}

}

}
