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
PImage cursor;
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
PImage jardin1c;
PImage jardinf;
PImage pala;
PImage palainv;
PImage palainvused;
PImage jardin2;
PImage jardin2pala;
PImage cubeta;
PImage cubetallena;
PImage cubetaused;
PImage cuerda;
PImage cuerdaused;
PImage pjtriste;
PImage pjfeliz;
PImage salasegunda;
PImage galleta;
PImage galletaused;

//variables globales
int escenario = 0;  //el juego empieza en el menu
int savestate = 0;  //guarda el valor del último e
int estadobateria = 1;
int estadocajon = 0;
int estadocuadro = 1;

int indice = 0;

boolean nomBateria = false;
boolean nomChispa = false;
boolean nomGalleta = false;
boolean nomPala = false;
boolean nomCubeta = false;
boolean nomCuerda = false;

boolean luzlamp = false;
boolean getpala = false;
boolean knowstumba = false;
boolean changesuelo = false;
boolean cortacuerda = false;
boolean llenado = false;
boolean crecimiento = false;

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
Puerta intermedia;
Puerta alexterior;
Puerta puerta2;
Item lampara;
Item cajonbateria;
Item cuadro;
Item tablero;
Item cartel;
Item columpio;
Item flor;
Item pozo;
Item tumba;
Item hoja1;
Item hoja2;
Item hoja3;
Item cofre;
Item palaobjeto;
Textbox bat0;
Textbox bat1;
Textbox bat2;
Textbox lamp1;
Textbox lamp2;
Textbox lamp3;
Textbox cuad1;
Textbox cuad2;
Textbox doorS;
Textbox outside;
Textbox tabler1;
Textbox p1;
Textbox cart;
Textbox colump1;
Textbox colump2;
Textbox flor1;
Textbox flor2;
Textbox flor3;
Textbox pala0;
Textbox pala1;
Textbox pozo1;
Textbox pozo2;
Textbox pozo3;
Textbox tumba1;
Textbox tumba2;
Textbox doorIntermedia;
Textbox textohoja1;
Textbox textohoja2;
Textbox textohoja3;
Textbox cofre1;
Textbox cofre2;
Textbox alexterior1;


float introduccion = 0;  //controla el tiempo de introduccion del juego.
float resetevento = 0;
float eventofinal = 0;
String pausa = "PULSA CUALQUIER\nTECLA PARA CERRAR"; //mensaje en el menu de pausa
String intro1 = "Pero... Que es este lugar?!!";
String intro2 = "Esta no parece ser mi habitacion...";
String intro3 = "Alguien debio haberme traido aqui mientras dormia...\nNo entiendo nada!";
String intro4 = "Como sea ... sera mejor que busque una manera\nde salir de aqui.";

String textcon = "";
boolean sabepassword = false;
boolean puedeescribir = false;

String textcon2 = "";
boolean sabepassword2 = false;
boolean puedeescribir2 = false;
int estadocofre = 0;

boolean getgalleta = false;
boolean markgalleta = false;
boolean abierta = false;
boolean abierta2 = false;

//Libreria Minim
import ddf.minim.*;
Minim minim;
AudioPlayer salasound;
AudioPlayer jardinsound;
AudioPlayer finaljuego;
AudioSample box;
AudioSample botons;
AudioSample correcto;
AudioSample incorrecto;


void setup() {//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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
 jardin1c = loadImage("jardin1c.png");
 jardinf = loadImage("jardinf.png");
 pala = loadImage("pala.png");
 palainv = loadImage("palaobj.png");
 palainvused = loadImage("palaobjused.png");
 jardin2 = loadImage("jardin2.png");
 jardin2pala = loadImage("jardin2f.png");
 cubeta = loadImage("cubetavacia.png");
 cubetallena = loadImage("cubetallena.png");
 cubetaused = loadImage("cubetaused.png");
 cuerda = loadImage("cuerda.png");
 cuerdaused = loadImage("cuerdaused.png");
 pjtriste = loadImage("pjtriste.png");
 pjfeliz = loadImage("pjfeliz.png");
 salasegunda = loadImage("segundasala.png");
 galleta = loadImage("galleta.png");
 galletaused = loadImage("galletaused.png");
 cursor = loadImage("cursor.png");
 
 cursor(cursor,8,3);

 //-------------------------------- crear objetos 
 introduccion = millis();
 
 minim = new Minim(this);
 salasound = minim.loadFile("shadydave__snowfall-final.mp3");
 jardinsound = minim.loadFile("shadydave__my-love-piano-loop.mp3");
 finaljuego = minim.loadFile("bensound-tomorrow.mp3");
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
 intermedia = new Puerta(150,360,80,130);
 alexterior = new Puerta(930,360,100,130);
 puerta2 = new Puerta(100,360,80,130);
 cajonbateria = new Item(720,360,80,130);
 bat0 = new Textbox("Esta cerrado, creo que se abre introduciendo\nuna clave de 3 digitos...",200,550);
 bat1 = new Textbox("Funciona!! ahora la cerradura esta abierta!\nEsto es...una bateria? Supongo que servira de algo.",150,560);
 lampara = new Item(420,360,80,130);
 lamp1 = new Textbox("Es una lampara apagada, parece que le falta\n algo para encenderse...",190,550);
 lamp2 = new Textbox("La bateria que tengo encaja en la lampara!!\nAhora el lugar esta mejor iluminado!",205,550);
 lamp3 = new Textbox("La lampara ya esta encendida...el brillo le da\nun mejor ambiente a esta claustrofobica situacion...",205,550);
 tablero = new Item(890,360,80,130);
 tabler1 = new Textbox("El tablero dice: Uno, Dos y Tres son  hermanos muy cercanos,\nUno tiene media decada\nDos ha vivido el doble que el hermano de menor edad\nTres le hace honor a su nombre...que edad tienen los hermanos?",175,515);
 cuadro = new Item(220,360,80,130);
 cuad1 = new Textbox("Es una pintura de una galleta con chispas\nde chocolate, se parece mucho a\nla que tengo en la camisa...",205,530);
 cuad2 = new Textbox("Hay una parte del cuadro que no esta pintada...\nEsto es...Una chispa de chocolate redonda??",190,550);
 doorS = new Textbox("No tengo razones para volver a ese lugar.",205,580);
 outside = new Textbox("Bien!! Logre salir de ahi, pero aun no se donde estoy\n...voy a ver que encuentro por el lugar...",150,550);
 p1 = new Textbox("Esta cerrada... y no parece que se pueda\nabrir con una llave normal...",205,550);
 cartel = new Item(250,360,80,130);
 cart = new Textbox("El cartel dice: Que rapido crecen! te descuidas un\nmomento y ya se van de casa, buscando su propio camino...\npero, estas a la altura? No pareces ser lo suficientemente\ngrande para sobrepasar el muro de la vida.",180,520);
 columpio = new Item(570,360,50,130);
 colump1 = new Textbox("Es un columpio, me gustan pero este no es\nun buen momento para jugar.",200,550);
 colump2 = new Textbox("La cuerda que sostiene el columpio,\ncreo que la tomare ...podria servir para...",200,550);
 flor = new Item(890,360,50,130);
 flor1 = new Textbox("Una flor roja, contrasta mucho\ncon el resto del lugar...",200,550);
 flor2 = new Textbox("No quiero desenterrarla, se ve bien estando ahi...",170,580);
 flor3 = new Textbox("Seria una lastima que esta flor se seque,\nusare la cubeta para regarla...WOW PERO QUE?!!\nLa flor crecio de repente a la altura del muro...",180,530);
 palaobjeto = new Item(450,360,50,130);
 pala0 = new Textbox("Una pala, es interesante pero por ahora no\nveo ninguna razon para recogerla...",200,550);
 pala1 = new Textbox("Esta pala... La jardineria no es lo mio pero seguro\nque encuentro un buen uso para esta cosa...",170,555);
 pozo = new Item(290,360,100,130);
 pozo1 = new Textbox("El agua del pozo...casi no se ve\npero espero que este limpia...",200,550);
 pozo2 = new Textbox("El agua esta muy en el fondo...no puedo llenar\nesta cubeta de esta manera...es una lastima...\npero bueno, sera mejor que explore mas el lugar.",170,530);
 pozo3 = new Textbox("Si, puedo usar la cuerda para bajar la cubeta\n y llenarla de agua...bien!",200,560);
 tumba = new Item(800,360,70,130);
 tumba1 = new Textbox("Una lapida, tiene algo escrito: Aqui yace mi casco\nfavorito, sigue funcionando pero mama dice que\ndeje de usarlo y que no es un casco :(",170,530);
 tumba2 = new Textbox("Parece un buen lugar para usar la pala...veamos...\nSu madre tenia razon, esto no es un casco, es una cubeta,\nbueno, no hice esto para nada, me llevo la cubeta.",160,530);
 doorIntermedia = new Textbox("No quiero volver ahi, prefiero seguir avanzando...",160,570);
 hoja1 = new Item(350,360,50,130);
 textohoja1 = new Textbox("La pagina dice: \"Querido diario, hoy mama nos preparo galletas\na mi y a mis amigos, yo me comi 2, estaban muy ricas y yo\nqueria repetir pero cuando fui a ver la bandeja estaba\nvacia, no entendia porque, si mama preparo 15 para los 3.\"",170,520);
 hoja2 = new Item(450,360,50,130);
 textohoja2 = new Textbox("\"Pense que todos comeriamos 5 galletas pero al parecer\nellos se llevaron todas las demas. Resulta que Jose se\ncomio 6, y Miguel se comio...ehm, no lo recuerdo,\nbueno no importa.\"",170,520);
 hoja3 = new Item(600,360,50,130);
 textohoja3 = new Textbox("\"El caso es que hay buenas noticias, le dije a mama lo que\npaso y me preparo una mucho mas grande y y deliciosa\npara mi solito, la guardare para comerla mas tarde\nen la caja especial...\"",155,515);
 cofre = new Item(740,360,50,130);
 cofre1 = new Textbox("Esta cosa tambien necesita una clave\npara abrirse.",205,570);
 cofre2 = new Textbox("Es la galleta que se menciona en el diaro, no tengo\nhambre pero me la llevare para mas tarde\n es mejor que dejarla aqui sin que nadie la coma.",150,520);
 alexterior1 = new Textbox("Esta cerrada, tiene una ranura para\ndepositar algo, pero la chispa no funciona,\nentonces...como se abre esta puerta?",200,530);
 
}//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


void draw() {//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  textFont(fuente);
 println(indice);

  switch(escenario){
  
   case 0:  //--------------------------------------------------escenario intro y menu
   strokeWeight(20);
   stroke(222,191,65);
   fill(5,7,15);
   rect(0,0,width,height);
   
   if(millis() < introduccion + 15000){  //Se muestra el texto de la intro
     fill(222,191,65);
     text(intro1,100,100);
   if(millis() > introduccion + 2500 && millis() < introduccion + 15000){
     text(intro2,100,200);
     }
   if(millis() > introduccion + 5000 && millis() < introduccion + 15000){
     text(intro3,100,300);
     }
   if(millis() > introduccion + 7500 && millis() < introduccion + 15000){
     text(intro4,100,450);
     }
     } else if (millis() > introduccion + 15000){  
     if(!salasound.isPlaying())
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
     }
     break;
   
   case 1: //--------------------------------------------------escenario instrucciones de juego
   image(controles,0,0);
   volver.displayDetect();
   volver.updateVolver();
   break;
   
   case 2: //--------------------------------------------------escenario sala 1
   if(luzlamp == false)
   background(salaoff);
   else
   image(salaon,0,0);
   pj.displayYmover();
   pj.x = constrain(pj.x,60,1120);
   puerta1.Detect();
   puerta1.viajar2();
   cuadro.Detect();
   cuadro.interaccionesSala1();
   cajonbateria.Detect();
   cajonbateria.interaccionesSala1();
   lampara.Detect();
   lampara.interaccionesSala1();
   tablero.Detect();
   tablero.interaccionesSala1();
   break;
   
   case 3: //--------------------------------------------------escenario creditos
   background(17,16,50);
   volver.displayDetect();
   volver.updateVolver();
   textAlign(LEFT);
   text("Agradezo a:\n\nCrafton Gaming, por aportar su fuente de texto Minecraft\npara uso gratuito.\n\nShadyDave, y Bensound por permitir el uso gratuito de su\nmusica que fue utilizada en este juego.\n\nCBJ_Student, blouhound, unadamlar, StavSounds, y a Kickhat\npor permitir el uso gratuito de efectos de sonido\nutilizados en el juego.",50,70);
   break;
   
   case 4: //--------------------------------------------------escenario jardin1
   if(!jardinsound.isPlaying())
   jardinsound.loop();
   
   if(cortacuerda == false)
   background(jardin1);
   else if(cortacuerda == true)
   background(jardin1c);
   if(crecimiento == true)
   background(jardinf);
   
   if(getpala == false){
   image(pala,420,360);
   palaobjeto.Detect();
   }
   
   pj.displayYmover();
   
   palaobjeto.interaccionesJardin();
   
   if(millis() > resetevento+600 && millis() < resetevento+9000)
   outside.display();
   
   pj.x = constrain(pj.x,10,1300);
   puerta2.Detect();
   puerta2.interactuarS();
   cartel.Detect();
   cartel.interaccionesJardin();
   columpio.Detect();
   columpio.interaccionesJardin();
   flor.Detect();
   flor.interaccionesJardin();
   
   if(pj.x > 1290){
   escenario = 5;
   pj.x = 0;}
   
   if((key == 'r' || key == 'R') && crecimiento == true){ //se escala la planta y se reproduce el final del juego.
   jardinsound.pause();
   escenario = 6;}
   break;
   
   case 5: //--------------------------------------------------escenario jardin2
   if(changesuelo == false)
   image(jardin2,0,0);
   else if(changesuelo ==true)
   image(jardin2pala,0,0);
   
   pj.displayYmover();
   pj.x = constrain(pj.x,-80,880);
   
   pozo.Detect();
   pozo.interaccionesJardin2();
   tumba.Detect();
   tumba.interaccionesJardin2();
   
   if(pj.x < -60){
   escenario = 4;  
   pj.x = 1280;}
   break;
   
   case 6: //-----------------------------------------------------escenario final del juego
   if(!finaljuego.isPlaying())
   finaljuego.play();
   
   background(0);
   stroke(0,0,69);
   strokeWeight(25);
   noFill();
   rect(0,0,width,height);
   fill(222,191,65);
   textAlign(LEFT);
   
   if(millis() < eventofinal+25000){
    if(millis() > eventofinal+1500 && millis() < eventofinal+25000)
    text("Me pregunto que hay detras del muro...Eh, espera, que es esto??",30,100);
    if(millis() > eventofinal+8500 && millis() < eventofinal+25000)
    text("Ahh!! Pero... esta es mi habitacion, entonces, todo\nfue una pesadilla??",30,250);
    if(millis() > eventofinal+12500 && millis() < eventofinal+25000)
    text("Me duele el estomago... no debi haber comido tantas galletas.",30,450);
    if(millis() > eventofinal+19000 && millis() < eventofinal+25000)
    text("Bueno, al menos nada de eso fue real...",30,600); 
    }
   if(millis() > eventofinal+25000 && millis() < eventofinal+32000){
   fill(17,16,50);
   rect(0,0,width,height);
   image(pjtriste,360,208);}
   if(millis() > eventofinal+28500 && millis() < eventofinal+32000){
   fill(210,210,110);
   rect(0,0,width,height);
   image(pjfeliz,360,208);}
   if(millis() > eventofinal+32000 && millis() < eventofinal+36000)
   text("O si lo fue...?",520,360);
   if(millis() > eventofinal+36000 && millis() < eventofinal+44500){
   textSize(50);
   text("CONTINUARA",470,360);}
   else if(millis() > eventofinal+44500)
   exit();  //Termina el juego.
   break;
   
   case 7: //-----------------------------------------------------------escenario sala segunda.
   background(salasegunda);
   pj.displayYmover();
   pj.x = constrain(pj.x,15,995);
   
   intermedia.Detect();
   intermedia.interactuarIntermedia();
   hoja1.Detect();
   hoja2.Detect();
   hoja3.Detect();
   hoja1.interaccionesSala2();
   hoja2.interaccionesSala2();
   hoja3.interaccionesSala2();
   cofre.Detect();
   cofre.interaccionesSala2();
   alexterior.Detect();
   alexterior.interactuarAlexterior();
   break;
  }
  
//-------------------------------------------------TERMINA SWITCH DE ESCENARIOS

   if((key == 'e' || key == 'E') && escenario != 0 && escenario != 1 && escenario != 3 && escenario != 6 && puedeescribir == false && puedeescribir2 == false){ //abrir inventario
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
   
   if(nomBateria == true){
   textSize(20);
   text("BATERIA",880,300);
   textSize(35);
   if(estadobateria == 2)
   image(bateria,840,150);
   if(luzlamp == true)
   image(bateriaused,840,150);
   }
   
   if(nomChispa == true){
   textSize(20);
   text("CHISPA",1030,300);
   textSize(35);
   if(estadocuadro == 2)
   image(chispa,990,150);
   if(escenario == 4 || escenario == 5 || escenario == 7)
   image(chispaused,990,150);
   }
   
   if(nomGalleta == true){
   textSize(20);
   text("GALLETA",1170,300);
   textSize(35);
   if(getgalleta == true)
   image(galleta,1130,150);
   if(markgalleta == true)
   image(galletaused,1130,150);
   }
   
   if(nomPala == true){
   textSize(20);
   text("PALA",880,490);
   textSize(35);
   if(getpala == true)
   image(palainv,840,350);
   if(changesuelo == true)
   image(palainvused,840,350);
   }
   
   if(nomCubeta == true){
   textSize(20);
   text("CUBETA",1030,490);
   textSize(35);
   if(changesuelo == true)
   image(cubeta,990,350);
   if(llenado == true)
   image(cubetallena,990,350);
   if(crecimiento == true)
   image(cubetaused,990,350);
   }
   
   if(nomCuerda == true){
   textSize(20);
   text("CUERDA",1170,490);
   textSize(35);
   if(cortacuerda == true)
   image(cuerda,1130,345);
   if(llenado == true)
   image(cuerdaused,1130,345);
   }
   
   }
  
//--------------------------------------------------------------------------------------------------------------------------------Setup del Puzzle de la contraseña 1
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
   
   if (sabepassword == true) {
    estadobateria = 2;
    puedeescribir = false;
    estadocajon = 3;
    nomBateria = true;
   }
//---------------------------------------------------------------------------------------------------------------------------------Setup del Puzzle de la contraseña 2
   if(puedeescribir2 == true){
   image(textboxi,60,450);
   text("(presione RETROCESO para borrar el digito escrito,\nPresione ENTER para intentar abrir la cerradura\nPresione B para dejar de escribir.)",650,70);
   password.displayDetect();  
   text(textcon2,613,610);
   textSize(30);
   text("3 digitos de nuevo...\ncual podria ser\nla clave?",320,540);
   
   if(key == 'b' || key == 'B')
   puedeescribir2 = false;
   }
   
   if (sabepassword2 == true) {
    puedeescribir2 = false;
    estadocofre = 2;
   }



}//------------------------------------------------------------------------------------------------------------------------------------Termina Draw

void keyPressed(){ 
  if(key == ESC)//presionar ESC dentro del juego abre el menu de pausa en lugar de cerrar el programa
  key = 0;
  
//--------------------------Para la contraseña del cajon y el cofre-------------------------------------------------------------------
  if((key == 'w' || key == 'W') && pj.x +60 > cajonbateria.x && pj.x +40 < cajonbateria.x + cajonbateria.w && estadocajon == 1){
  puedeescribir = true;}
  
  if((key == 'w' || key == 'W') && pj.x +60 > cofre.x && pj.x +40 < cofre.x + cofre.w && estadocofre == 1){
  puedeescribir2 = true;}
//------------------------------------------------------------------------------------------------------------------------------------
  
  if(puedeescribir == true){
   if (key == BACKSPACE) { //presionar retroceso elimina el ultimo caracter escrito
      if (textcon.length()>0) {
        textcon = textcon.substring(0, textcon.length()-1);
      }
    } 
    else if (key == RETURN || key == ENTER) { //presionar Enter evalúa si la entrada del usuario es correcta o incorrecta
      println ("ENTER");
      if (textcon.equals("563")) {
        sabepassword = true;
        correcto.trigger();
        textcon="";
      }
      else {
        sabepassword = false;
        incorrecto.trigger();
        text("INCORRECTO",170,170);
      }
    }
    else {
      textcon += key;
    }
    if(textcon.length()>3)
    textcon = textcon.substring(0,3);
  }
  
//-----------------------------------------------------------------------------------------------------------------------------

if(puedeescribir2 == true){
   if (key == BACKSPACE) { //presionar retroceso elimina el ultimo caracter escrito
      if (textcon2.length()>0) {
        textcon2 = textcon2.substring(0, textcon2.length()-1);
      }
    } 
    else if (key == RETURN || key == ENTER) { //presionar Enter evalúa si la entrada del usuario es correcta o incorrecta
      println ("ENTER");
      if (textcon2.equals("267")) {
        sabepassword2 = true;
        correcto.trigger();
        textcon2="";
      }
      else {
        sabepassword2 = false;
        incorrecto.trigger();
        text("INCORRECTO",170,170);
      }
    }
    else {
      textcon2 += key;
    }
    if(textcon2.length()>3)
    textcon2 = textcon2.substring(0,3);
  }
  
//-----------------------------------------------------------------------------------------------------------------------------  
  
  //control de sonidos y algunos eventos
  if((key == 'e' || key == 'E') && escenario != 0 && escenario !=1 && escenario !=3 && puedeescribir == false && puedeescribir2 == false)
  box.trigger();
  
  if(key == 'w' || key == 'W'){
  if(pj.x +60 > cuadro.x && pj.x +40 < cuadro.x + cuadro.w && escenario == 2)
  box.trigger();
  else indice = 0;
  
  if(pj.x +60 > cajonbateria.x && pj.x +40 < cajonbateria.x + cajonbateria.w && escenario == 2)
  box.trigger();
  
  if(pj.x +60 > lampara.x && pj.x +40 < lampara.x + lampara.w && escenario == 2)
  box.trigger();
  
  if(pj.x +60 > tablero.x && pj.x +40 < tablero.x + tablero.w && escenario == 2)
  box.trigger();
  
  if(pj.x +60 > puerta1.x && pj.x +40 < puerta1.x + puerta1.w && escenario == 2)
  box.trigger();
  
  if(pj.x +60 > puerta2.x && pj.x +40 < puerta2.x + puerta2.w && escenario == 4)
  box.trigger();
  
  if(pj.x +60 > cartel.x && pj.x +40 < cartel.x + cartel.w && escenario == 4)
  box.trigger();
  
  if(pj.x +60 > columpio.x && pj.x +40 < columpio.x + columpio.w && escenario == 4)
  box.trigger();
  else indice = 0;
  
  if(pj.x +60 > flor.x && pj.x +40 < flor.x + flor.w && escenario == 4)
  box.trigger();
  
  if(pj.x +60 > palaobjeto.x && pj.x +40 < palaobjeto.x + palaobjeto.w && escenario == 4 && getpala == false)
  box.trigger();
  
  if(pj.x +60 > pozo.x && pj.x +40 < pozo.x + pozo.w && escenario == 5)
  box.trigger();
  
  if(pj.x +60 > tumba.x && pj.x +40 < tumba.x + tumba.w && escenario == 5)
  box.trigger();
  
  if(pj.x +60 > intermedia.x && pj.x +40 < intermedia.x + intermedia.w && escenario == 7)
  box.trigger();

  if(pj.x +60 > hoja1.x && pj.x +40 < hoja1.x + hoja1.w && escenario == 7)
  box.trigger();
  
  if(pj.x +60 > hoja2.x && pj.x +40 < hoja2.x + hoja2.w && escenario == 7)
  box.trigger();
  
  if(pj.x +60 > hoja3.x && pj.x +40 < hoja3.x + hoja3.w && escenario == 7)
  box.trigger();
  
  if(pj.x +60 > cofre.x && pj.x +40 < cofre.x + cofre.w && escenario == 7)
  box.trigger();
  
  if(pj.x +60 > alexterior.x && pj.x +40 < alexterior.x + alexterior.w && escenario == 7){
  box.trigger();
  resetevento=millis();}

  }
  
  if((key == 'r' || key == 'R') && crecimiento == true && (escenario == 4 || escenario == 6)) //controla tiempo de evento final del juego
  eventofinal = millis();
  
}
