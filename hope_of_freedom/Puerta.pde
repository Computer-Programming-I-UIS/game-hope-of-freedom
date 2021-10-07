class Puerta extends Objinter { //Para cambiar de escenario si se cumplen las condiciones
  
  boolean abierta = false;
  
  Puerta(int xp, int yp, int wp, int hp){
  super(xp,yp,wp,hp);
  }
  
  void viajarJ() {
   if((key == 'w' || key == 'W') && pj.x +60 > x && pj.x +40 < x + w){
   if(abierta == true){
   pj.x = 150; 
   escenario = 4;
   estadocuadro = 3;
   } else p1.display();
   }
  
   }
   
   void viajarS() {
   if((key == 'w' || key == 'W') && pj.x +60 > x && pj.x +40 < x + w){
   pj.x = 950; 
   escenario = 2;
   }
   }
   
}
