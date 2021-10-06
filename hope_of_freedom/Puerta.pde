class Puerta extends Objinter {
  
  Puerta(int xp, int yp, int wp, int hp){
  super(xp,yp,wp,hp);
  }
  
  void viajar() {
   if(key == 'w' && pj.x +60 > x && pj.x +40 < x + w){
   pj.x = 100; 
   escenario = 3;
  }
  
}
}
