class Puerta extends Objinter {
  
  Puerta(int xp, int yp, int wp, int hp){
  super(xp,yp,wp,hp);
  }
  
  void viajar() {
   if(key == 'w' || key == 'W' && pj.x +60 > this.x && pj.x +40 < this.x + this.w){
   pj.x = 100; 
   escenario = 3;
  }
  
}
}
