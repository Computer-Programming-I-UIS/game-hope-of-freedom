PImage player1;
//-----Sprite
import sprites.*;
Player pj;

//el tamaño de cada sprite es 70,120

void setup() {
    frameRate(60);
 size(1284,720);
 pj = new Player(100,200);
 player1 = loadImage("player.png");
 
}

void draw() {
  background(178,0,0);
  pj.displayYmover();
  image(player1,500,200);
}
