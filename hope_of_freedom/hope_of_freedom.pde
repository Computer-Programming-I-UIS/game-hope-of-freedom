/********************************************************+++++++++++++++++++++++++++++++++++++++++++++++++

---------------------------------------------Hope of Freedom---------------------------------------------

Autor: Daniel Ricardo Guerrero Cruz - 2200535

Descripción: Este videojuego fue realizado como Proyecto final en el curso Programación de computadores I.
El videojuego es sobre un joven atrapado en una habitación misteriosa, debe buscar la manera de escapar
explorando el entorno, interactuando con los objetos y resolviendo puzzles.
Más información disponible en el Readme de github.

Requiere instalar la librería Minim.

**************************************************+++++++++++++++++++++++++++++++++++++++++++++++++******/

PFont fuente;
PImage menu;
PImage controles;
PImage player1;  //spritesheet del pj
PImage signo;
PImage textboxi;
PImage bateria;
PImage bateriaused;
PImage chispa;
PImage chispaused;
PImage salaoff;
PImage salaon;
PImage jardin1;


//variables globales
int escenario = 0;  //el juego empieza en el menu
int savestate = 0;  //guarda el valor del último e
int estadobateria = 1;
int estadocajon = 0;
int estadocuadro = 1;
boolean luzlamp = false;
boolean checksound = false;

//----------------------------- Declaración de objetos
Boton jugar;
Boton instrucciones;
Boton volver;
Boton creditos;
Boton salir;
Boton returnmenu;
Boton password;
Player pj;
Puerta puerta1;
Puerta puerta2;
Item lampara;
Item cajonbateria;
Item cuadro;
Item tablero;
Textbox bat0;
Textbox bat1;
Textbox bat2;
Textbox lamp1;
Textbox lamp2;
Textbox lamp3;
Textbox cuad1;
Textbox cuad2;
Textbox doorS;
Textbox tabler1;
Textbox p1;


float introduccion = 0;  //controla el tiempo de introduccion del juego.
String pausa = "PULSA CUALQUIER\nTECLA PARA CERRAR"; //mensaje en el menu de pausa

//Minim
import ddf.minim.*;
Minim minim;
AudioPlayer salasound;
AudioPlayer jardinsound;
AudioSample box;
AudioSample botons;
AudioSample correcto;
AudioSample incorrecto;

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
 chispa = loadImage("chip.png");
 chispaused = loadImage("chipused.png");
 salaoff = loadImage("sala1off.png");
 salaon = loadImage("sala1on.png");
 jardin1 = loadImage("jardin1.png");
 
 //-------------------------------- crear objetos 
 introduccion = millis();
 
 minim = new Minim(this);
 salasound = minim.loadFile("shadydave__snowfall-final.mp3");
 jardinsound = minim.loadFile("shadydave__my-love-piano-loop.mp3");
 botons = minim.loadSample("kickhat_open-button-2.mp3");
 box = minim.loadSample("cbj-student__pop-1.mp3");
 correcto = minim.loadSample("stavsounds__correct3.mp3");
 incorrecto = minim.loadSample("unadamlar__wrong-choice.mp3");

 pj = new Player(100,360);
 jugar = new Boton(250,250,350,80,"JUGAR");
 instrucciones = new Boton(250,350,350,80,"COMO JUGAR?");
 volver = new Boton(750,height-150,300,100,"VOLVER");
 creditos = new Boton(250,450,350,80,"CREDITOS");
 salir = new Boton(250,550,350,80,"SALIR");
 returnmenu = new Boton(823,560,400,100,"VOLVER AL MENU");
 password = new Boton(525,560,180,70,textcon);
 puerta1 = new Puerta(1050,360,80,130);
 puerta2 = new Puerta(100,360,80,130);
 cajonbateria = new Item(720,360,80,130);
 bat0 = new Textbox("Esta cerrado, creo que se abre\nintroduciendo una clave de 3 digitos",625,550,380,240);
 bat1 = new Textbox("Funciona!! ahora la cerradura esta abierta! Esto es...\nuna bateria? Supongo que servira de algo.",628,560,380,240);
 lampara = new Item(420,360,80,130);
 lamp1 = new Textbox("Es una lampara apagada, parece que le falta\n algo para encenderse...",625,550,380,240);
 lamp2 = new Textbox("La bateria que tengo encaja en la lampara!!\nAhora el lugar esta mejor iluminado!",625,550,380,240);
 lamp3 = new Textbox("La lampara ya esta encendida...el brillo le da\nun mejor ambiente a esta claustrofobica situacion...",625,550,380,240);
 tablero = new Item(890,360,80,130);
 tabler1 = new Textbox("El tablero dice: Uno, Dos y Tres son  hermanos muy cercanos,\nUno tiene media decada\nDos ha vivido el doble que el hermano de menor edad\nTres le hace honor a su nombre...que edad tienen los hermanos?",625,515,380,240);
 cuadro = new Item(220,360,80,130);
 cuad1 = new Textbox("Es una pintura de una galleta con chispas de chocolate,\nse parece mucho a la que tengo en la camisa...",635,560,380,240);
 cuad2 = new Textbox("Hay una parte del cuadro que no esta pintada...\nEsto es...Una chispa de chocolate redonda??",625,550,380,240);
 doorS = new Textbox("No tengo razones para volver a ese lugar.",625,580,380,240);
 p1 = new Textbox("Esta cerrada... y no parece que se pueda\nabrir con una llave normal...",625,550,380,240);;

}

String textcon = "";
boolean sabepassword = false;
boolean puedeescribir = false;

void draw() {
  
  textFont(fuente);
  switch(escenario){
  
   case 0:  //escenario intro y menu
   strokeWeight(20);
   stroke(222,191,65);
   fill(5,7,15);
   rect(0,0,width,height);
   
/*    if(millis() < introduccion + 15000){  //Se muestra el texto de la intro
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
*/     if(!salasound.isPlaying())
     salasound.loop();
     image(menu,0,0);
     jugar.displayDetect();
     jugar.updateJugar();
     instrucciones.displayDetect();
     instrucciones.updateInstrucciones();
     creditos.displayDetect();
     creditos.updateCreditos();
     salir.displayDetect();
     salir.updateSalir(); 
//     }
     break;
   
   case 1: //escenario instrucciones de juego
   image(controles,0,0);
   volver.displayDetect();
   volver.updateVolver();
   break;
   
   case 2: //escenario sala 1
   if(luzlamp == false)
   background(salaoff);
   else
   image(salaon,0,0);
   pj.displayYmover();
   pj.x = constrain(pj.x,60,1120);
   puerta1.Detect();
   puerta1.viajarJ();
   cuadro.Detect();
   cuadro.interactuarC();
   cajonbateria.Detect();
   cajonbateria.interactuarB();
   lampara.Detect();
   lampara.interactuarL();
   tablero.Detect();
   tablero.interactuarT();
   break;
   
   case 3: //escenario creditos
   background(17,16,50);
   volver.displayDetect();
   volver.updateVolver();
   textAlign(LEFT);
   text("Agradezo a:\n\nCrafton Gaming, por aportar su fuente de texto Minecraft\npara uso gratuito.\n\nShadyDave, por permitir el uso gratuito de su musica que fue\nutilizada en este juego.\n\nCBJ_Student, blouhound, unadamlar, StavSounds, y a Kickhat\npor permitir el uso gratuito de efectos de sonido\nutilizados en el juego.",50,70);
   break;
   
   case 4: //escenario jardin1
   if(!jardinsound.isPlaying())
   jardinsound.loop();
   background(jardin1);
   pj.displayYmover();
   pj.x = constrain(pj.x,10,1120);
   puerta2.Detect();
   puerta2.interactuarS();
   break;
   
  }
 
   if((key == 'e' || key == 'E') && escenario != 0 && escenario != 1 && escenario != 3){ //abrir inventario
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
   image(bateria,840,150);
   if(luzlamp == true)
   image(bateriaused,840,150);
   if(estadocuadro == 2)
   image(chispa,990,150);
   if(escenario == 4)
   image(chispaused,990,150);
   }
   
   if((key == 'w' || key == 'W') && pj.x +60 > cajonbateria.x && pj.x +40 < cajonbateria.x + cajonbateria.w && estadocajon == 1)
   password.displayDetect();  
  
   if(puedeescribir == true){
   image(textboxi,60,450);
   text("(presione RETROCESO para borrar el digito escrito,\nPresione ENTER para intentar abrir la cerradura\nPresione B para dejar de escribir.)",650,70);
   password.displayDetect();  
   text(textcon,613,610);
   fill(255,0,0);
   textSize(20);
   text("uno dos tres",613,540);
   fill(222,191,65);
   textSize(30);
   text("Tengo que escribir\nuna clave...",320,560);
   
   if(key == 'b' || key == 'B')
   puedeescribir = false;
   }
   
   if (sabepassword) {
    estadobateria = 2;
    puedeescribir = false;
    estadocajon = 3;
   }
   
   

}

void keyPressed(){ 
  if(key == ESC)//presionar ESC dentro del juego abre el menu de pausa en lugar de cerrar el programa
  key = 0;
  
//--------------------------Para la contraseña del cajon-------------------------------------------------------------------
  if((key == 'w' || key == 'W') && pj.x +60 > cajonbateria.x && pj.x +40 < cajonbateria.x + cajonbateria.w && estadocajon == 1){
  puedeescribir = true;
  }
  
  if(puedeescribir == true){
   if (key == BACKSPACE) { //presionar retroceso elimina el ultimo caracter escrito
      if (textcon.length()>0) {
        textcon=textcon.substring(0, textcon.length()-1);
      }
    } 
    else if (key == RETURN || key == ENTER) { //presionar Enter evalúa si la entrada del usuario es correcta o incorrecta
      println ("ENTER");
      if (textcon.equals("563")) {
        sabepassword=true;
        correcto.trigger();
        textcon="";
      }
      else {
        sabepassword=false;
        incorrecto.trigger();
        text("INCORRECTO",170,170);
      }
    }
    else {
      textcon+=key;
    }
  }
  
//-----------------------------------------------------------------------------------------------------------------------------  
  
  //control de sonidos
  if((key == 'e' || key == 'E') && escenario != 0 && escenario !=1 && escenario !=3)
  box.trigger();
  
  if((key == 'w' || key == 'W')&& pj.x +60 > cuadro.x && pj.x +40 < cuadro.x + cuadro.w)
  box.trigger();
  
  if((key == 'w' || key == 'W') && pj.x +60 > cajonbateria.x && pj.x +40 < cajonbateria.x + cajonbateria.w)
  box.trigger();
  
  if((key == 'w' || key == 'W') && pj.x +60 > lampara.x && pj.x +40 < lampara.x + lampara.w)
  box.trigger();
  
  if((key == 'w' || key == 'W') && pj.x +60 > tablero.x && pj.x +40 < tablero.x + tablero.w)
  box.trigger();
  
  if((key == 'w' || key == 'W') && pj.x +60 > puerta1.x && pj.x +40 < puerta1.x + puerta1.w)
  box.trigger();
  
  if((key == 'w' || key == 'W') && pj.x +60 > puerta2.x && pj.x +40 < puerta2.x + puerta2.w)
  box.trigger();
}
