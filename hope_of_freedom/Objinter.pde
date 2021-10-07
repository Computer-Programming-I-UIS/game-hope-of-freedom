class Objinter { //superclase de los objetos interactuables que comparten el metodo "Detect"
 int x, y, w, h;
 
 Objinter(int xp, int yp, int wp, int hp){
  x = xp; 
  y = yp;
  w = wp;
  h = hp;
 }
 
 void Detect(){
  if(pj.x +60 > this.x && pj.x +40 < this.x + this.w){
  image(signo, pj.x+30, pj.y-70);
  }
  
 }
  
  
  
  
}
