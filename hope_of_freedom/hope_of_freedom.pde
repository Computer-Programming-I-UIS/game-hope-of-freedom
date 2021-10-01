PImage menu;
PFont fuente;
PImage player1;  //spritesheet del pj


int escenario = 0;

Boton jugar;
Boton instrucciones;
Boton salir;
Player pj;


void setup() {

 size(1284,720);
 frameRate(30);
 
 //-------------------------------- cargar archivos
 menu = loadImage("menu.png");
 fuente = createFont("Minecraft.ttf",40);
 player1 = loadImage("player.png");
 
 //-------------------------------- crear objetos 
 pj = new Player(100,360);
 jugar = new Boton(200,250,300,100,"JUGAR");
 salir = new Boton(200,550,300,100,"SALIR");

}

void draw() {
  
  textFont(fuente);
  
  switch(escenario){
  
   case 0: image(menu,0,0);
   jugar.displayDetect();
   jugar.update();
   salir.displayDetect();
   salir.update();
   break;
   
   case 1:
   background(255);
   pj.displayYmover();
  
  }
}
