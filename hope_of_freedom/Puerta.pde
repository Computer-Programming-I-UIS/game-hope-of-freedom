class Puerta extends Objinter { //Para cambiar de escenario si se cumplen las condiciones
  
  boolean abierta = false;
  
  Puerta(int xp, int yp, int wp, int hp){
  super(xp,yp,wp,hp);
  }
  
  void viajar2() {
   if((key == 'w' || key == 'W') && pj.x +60 > x && pj.x +40 < x + w){
   if(abierta == true){
   pj.x = 150; 
   escenario = 7;
   estadocuadro = 3;
   } else p1.display();
   }
  
   }
   
   void interactuarS() {
   if((key == 'w' || key == 'W') && pj.x +60 > x && pj.x +40 < x + w){
   doorS.display();
   }
   }
   
   void interactuarIntermedia(){
   if((key == 'w' || key == 'W') && pj.x +60 > x && pj.x +40 < x + w){
   doorIntermedia.display();
   }
   }
   
   void interactuarAlexterior(){
   if((key == 'w' || key == 'W') && pj.x +60 > x && pj.x +40 < x + w){
   if(abierta2 == false)
   alexterior1.display();  
   if(abierta2 == true){
   markgalleta = true;  
   pj.x = 150;  
   escenario = 4;
   salasound.pause();}
   } 
   }
   
}
