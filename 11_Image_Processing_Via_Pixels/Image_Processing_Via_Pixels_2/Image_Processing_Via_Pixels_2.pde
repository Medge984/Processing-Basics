PImage event;

void setup() {
  //fullScreen();
  size(1920, 1080);
  noCursor();
  frameRate(60);
  background(20);

  event = loadImage("horizon.png");
}


void draw() {

  loadPixels();
  event.loadPixels();
  for (int x = 0; x < width-1; x ++) {
    for (int y = 0; y < height; y ++) {

      int loc = x+(y * width);
      int loc1 =  (x + 1) + (y * width);

      float b = brightness(event.pixels[loc]);
      float b1 = brightness(event.pixels[loc1]);
      float diff = abs(b-b1);

      if (diff>5) {
        pixels[loc] = color(255);
      } else {
        pixels[loc] = color(0);
      }
    }
  }
  updatePixels();
}
