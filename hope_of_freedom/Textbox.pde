class Textbox { //para dibujar con mayor eficiencia los cuadros de texto al interactuar con un objeto.
int x, y, w, h; 
String m;
 
Textbox(String mens, int xt, int yt, int wt, int ht) {
 x = xt;
 y = yt;
 w = wt;
 h = ht;
 m = mens;
 }
 
 void display(){      
 image(textboxi,60,450);
 text(m,x,y);    
}


}
