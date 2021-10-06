class Item extends Objinter {
  
  Item(int xp, int yp, int wp, int hp){
  super(xp,yp,wp,hp);
  }

  void interactuar(){
  if(key == 'w' && pj.x +60 > x && pj.x +40 < x + w)  
   lamp1.display(); 
  }
  
}
