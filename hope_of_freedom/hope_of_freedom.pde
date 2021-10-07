PFont fuente;
PImage menu;
PImage controles;
PImage player1;  //spritesheet del pj
PImage signo;
PImage textboxi;
PImage bateria;
PImage bateriaused;
PImage salaoff;
PImage salaon;
PImage jardin1;

int escenario = 0;  //el juego empieza en el menu
int savestate = 0;  //guarda el valor del último e
int estadobateria = 1;
int estadocajon = 1;

//----------------------------- Declaración de objetos
Boton jugar;
Boton instrucciones;
Boton volver;
Boton salir;
Boton returnmenu;
Player pj;
Puerta puerta1;
Item lampara;
Item cajonbateria;
Item cuadro;
Textbox bat1;
Textbox bat2;
Textbox lamp1;
Textbox lamp2;
Textbox cuad1;
Textbox p1;


float introduccion = 0;  //controla el tiempo de introduccion del juego.
String pausa = "PULSA CUALQUIER\nTECLA PARA CERRAR"; //mensaje en el menu de pausa

void setup() {

 size(1284,720);
 frameRate(60);
 
 //-------------------------------- cargar archivos
 fuente = createFont("Minecraft.ttf",40);
 menu = loadImage("menu.png");
 controles = loadImage("instrucciones.png");
 player1 = loadImage("player.png");
 signo = loadImage("signointer.png");
 textboxi = loadImage("textbox.png");
 bateria = loadImage("bateria.png");
 bateriaused = loadImage("bateria2.png");
 salaoff = loadImage("sala1off.png");
 salaon = loadImage("sala1on.png");
 jardin1 = loadImage("jardin1.png");
 
 //-------------------------------- crear objetos 
 introduccion = millis();

 pj = new Player(100,360);
 jugar = new Boton(200,250,350,100,"JUGAR");
 instrucciones = new Boton(200,400,350,100,"COMO JUGAR?");
 volver = new Boton(492,height-150,300,100,"VOLVER");
 salir = new Boton(200,550,350,100,"SALIR");
 returnmenu = new Boton(823,560,400,100,"VOLVER AL MENU");
 puerta1 = new Puerta(1050,360,80,130);
 cajonbateria = new Item(720,360,80,130);
 bat1 = new Textbox("La cerradura esta rota, adentro hay...\nuna bateria?...Vale, servira de algo...",625,550,380,240);
 bat2 = new Textbox("Aqui adentro no hay nada mas que me pueda ser util...",625,580,380,240);
 lampara = new Item(420,360,80,130);
 lamp1 = new Textbox("Es una lampara apagada, parece que le falta\n algo para encenderse...",625,550,380,240);
 lamp2 = new Textbox("La bateria que tengo encaja en la lampara!!\nAhora el lugar esta mejor iluminado",625,550,380,240);
 cuadro = new Item(220,360,80,130);
 cuad1 = new Textbox("Es una pintura de una galleta con chips de chocolate...\nSe parece mucho a la que tengo en la camisa",635,560,380,240);
 p1 = new Textbox("Esta cerrada... y no parece que se pueda\nabrir con una llave normal",625,550,380,240);;

}

void draw() {
  
  textFont(fuente);
  
  switch(escenario){
  
   case 0:  //escenario intro y menu
   strokeWeight(20);
   stroke(222,191,65);
   fill(5,7,15);
 rect(0,0,width,height);
   
/*   if(millis() < introduccion + 15000){  //Se muestra el texto de la intro
     fill(222,191,65);
     text("Pero... Que es este lugar?!!",100,100);
   if(millis() > introduccion + 2500 && millis() < introduccion + 15000){
     text("Esta no parece ser mi habitacion...",100,200);
     }
   if(millis() > introduccion + 5000 && millis() < introduccion + 15000){
     text("Alguien debio haberme traido aqui mientras dormia...\nPero...Quien fue?",100,300);
     }
   if(millis() > introduccion + 7500 && millis() < introduccion + 15000){
     text("Como sea ... sera mejor que busque una forma\nde salir de aqui.",100,450);
     }
   } else if (millis() > introduccion + 15000){  
*/   image(menu,0,0);
     jugar.displayDetect();
     jugar.updateJugar();
     instrucciones.displayDetect();
     instrucciones.updateInstrucciones();
     salir.displayDetect();
     salir.updateSalir(); 
//   }
     break;
   
   case 1: //escenario instrucciones de juego
   image(controles,0,0);
   volver.displayDetect();
   volver.updateVolver();
   break;
   
   case 2: //escenario sala 1
   image(salaoff,0,0);
   pj.displayYmover();
   pj.x = constrain(pj.x,60,1120);
   puerta1.Detect();
   puerta1.viajar();
   cuadro.Detect();
   cuadro.interactuarC();
   cajonbateria.Detect();
   cajonbateria.interactuarB();
   lampara.Detect();
   lampara.interactuarL();
   break;
   
   case 3:
   background(255,0,0);
   rect(500,360,80,130);
   pj.displayYmover();

   break;
   
   case 4:
   image(jardin1,0,0);
   pj.displayYmover();
   break;
   
  }
  
  
  
   if(key == BACKSPACE && escenario != 0 && escenario != 1){ //abrir inventario
   stroke(216,196,116);
   fill(17,16,50);
   rect(774,10,500,700);
   fill(222,191,65);
   textSize(25);
   text(pausa,1025,60);
   textSize(35);
   returnmenu.displayDetect();
   returnmenu.updateReturnmenu();
   savestate = escenario;
   if(estadobateria == 2)
   image(bateria,850,150);
   else if(estadobateria == 3)
   image(bateriaused,850,150);
   }   

}

void keyPressed(){ 
  if(key == ESC)//presionar ESC dentro del juego abre el menu de pausa en lugar de cerrar el programa
  key = 0;       
}
