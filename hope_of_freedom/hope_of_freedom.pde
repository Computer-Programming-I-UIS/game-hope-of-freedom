PImage player1;

Player pj;

//el tamaño de cada sprite es 70,120

void setup() {

 size(1284,720);
 frameRate(60);
 pj = new Player(100,360);
 player1 = loadImage("player.png");

 
}

void draw() {
  background(178,0,0);
  pj.displayYmover();
}
