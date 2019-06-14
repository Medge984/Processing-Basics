PImage event;

void setup() {
  //fullScreen();
  size(1920, 1080);
  noCursor();
  frameRate(120);
  background(20);

  event = loadImage("Event Horizon.png");
}


void draw() {
  //image(event,0,0);
  for (int i = 0; i < 2000; i++) {
    float x = random(width);
    float y = random(height);

    color col = event.get(int(x), int(y));
    fill(col); //,70);
    noStroke();
    ellipse(x, y, 10, 10);
  }
}
