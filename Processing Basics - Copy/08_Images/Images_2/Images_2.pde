PImage[] bloons = new PImage[4];

Balloon[] balloon = new Balloon[15];

void setup() {
  size(800, 800);
  frameRate(60);
  background(20);

  for (int i = 0; i < bloons.length; i++) {
    bloons[i] = loadImage("bloon"+i+".png");
  }
  for (int i = 0; i < balloon.length; i++) {
    int index = int(random(0, bloons.length));
    balloon[i] = new Balloon(bloons[index], (width/balloon.length)*(i+0.5), 700, random(.05,.2));
  }
}


void draw() {  

  background(10);

  //image(balloon, 0, 0, balloon.width, balloon.height);

  for (int i = 0; i < balloon.length; i++) {
    balloon[i].ascend();
    balloon[i].display();
    balloon[i].top();
  }
}
