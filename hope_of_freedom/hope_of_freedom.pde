PFont fuente;
PImage menu;
PImage controles;
PImage player1;  //spritesheet del pj


int escenario = 0;  //el juego empieza en el menu

Boton jugar;
Boton instrucciones;
Boton volver;
Boton salir;
Boton returngame;
Boton returnmenu;
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
 returngame = new Boton(442,100,400,100,"VOLVER AL JUEGO");
 returnmenu = new Boton(442,250,400,100,"VOLVER AL MENU");

}

void draw() {
  println(escenario);
  textFont(fuente);
  
  switch(escenario){
  
   case 0: image(menu,0,0); //escenario menu
   jugar.displayDetect();
   jugar.updateJugar();
   instrucciones.displayDetect();
   instrucciones.updateInstrucciones();
   salir.displayDetect();
   salir.updateSalir();
   break;
   
   case 1: //escenario instrucciones de juego
   image(controles,0,0);
   volver.displayDetect();
   volver.updateVolver();
   break;
   
   case 2: //ventana de opciones
   stroke(216,196,116);
   fill(17,16,50);
   rect(392,50,500,350);
   returngame.displayDetect();
   returngame.updateReturngame();
   returnmenu.displayDetect();
   returnmenu.updateReturnmenu();
   
   break;
   
   case 3: //escenario sala 1
   background(255);
   pj.displayYmover();
   break;
  }

}

void keyPressed(){ //presionar ESC devuelve al menu en lugar de cerrar el programa
  if(key == ESC){
  key = 0;
  if(escenario != 0 && escenario != 1)
  escenario = 2;
  }
  
}
