PImage player;

void setup() {
 size(1200,720);
 player = loadImage("player.png");
}

void draw() {
  image(player,500,200);
}
