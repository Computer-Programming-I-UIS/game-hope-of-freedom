PImage menu;
PImage player1;  //spritesheet del pj


int escenario = 0;

Player pj;

void setup() {

 size(1284,720);
 frameRate(30);
 menu = loadImage("menu.png");
 player1 = loadImage("player.png");
 pj = new Player(100,360);

}

void draw() {
  
  switch(escenario){
  
   case 0: image(menu,0,0);
   strokeWeight(4);
   strokeJoin(ROUND);
   stroke(234,218,33);
   rect(200,250,300,100);
   rect(200,400,300,100);
   rect(200,550,300,100);
   if(key == ENTER)
   escenario = 1;
   break;
   
   case 1:
   background(255);
   pj.displayYmover();
  
  }
}
