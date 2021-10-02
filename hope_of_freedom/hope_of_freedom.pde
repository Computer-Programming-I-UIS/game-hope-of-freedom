PFont fuente;
PImage menu;
PImage controles;
PImage player1;  //spritesheet del pj


int escenario = 0;  //el juego empieza en el menu

Boton jugar;
Boton instrucciones;
Boton volver;
Boton salir;
Player pj;


void setup() {

 size(1284,720);
 frameRate(60);
 
 //-------------------------------- cargar archivos
 fuente = createFont("Minecraft.ttf",40);
 menu = loadImage("menu.png");
 controles = loadImage("instrucciones.png");
 player1 = loadImage("player.png");
 
 //-------------------------------- crear objetos 
 pj = new Player(100,360);
 jugar = new Boton(200,250,350,100,"JUGAR");
 instrucciones = new Boton(200,400,350,100,"COMO JUGAR?");
 volver = new Boton(492,height-150,300,100,"VOLVER");
 salir = new Boton(200,550,350,100,"SALIR");

}

void draw() {
  println(escenario);
  textFont(fuente);
  
  switch(escenario){
  
   case 0: image(menu,0,0); //escenario menu
   jugar.displayDetect();
   jugar.update();
   instrucciones.displayDetect();
   instrucciones.update();
   salir.displayDetect();
   salir.update();
   break;
   
   case 1: //escenario instrucciones de juego
   image(controles,0,0);
   volver.displayDetect();
   volver.update();
   break;
   
   case 2: //escenario sala1
   background(255);
   pj.displayYmover();
   break;
  }
}
