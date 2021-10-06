class Item extends Objinter {
  
  Item(int xp, int yp, int wp, int hp){
  super(xp,yp,wp,hp);
  }
  
  void interactuarB(){
  if(key == 'w' && pj.x +60 > x && pj.x +40 < x + w)
  bat1.display();
  }

  void interactuarL(){
  if(key == 'w' && pj.x +60 > x && pj.x +40 < x + w)  
   lamp1.display(); 
  }
  
}
