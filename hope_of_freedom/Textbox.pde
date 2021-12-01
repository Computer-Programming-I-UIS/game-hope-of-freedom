class Textbox { //para dibujar con mayor eficiencia los cuadros de texto al interactuar con un objeto.
int x, y, w, h; 
String m;
 
Textbox(String mens, int xt, int yt) {
 x = xt;
 y = yt;
 m = mens;
 }
 
 void display(){      
 image(textboxi,60,450);
 textAlign(LEFT);
 text(this.m.substring(0,indice),x,y);
 if (frameCount % 3 == 0)
 indice = min(indice+1, this.m.length());
}


}
