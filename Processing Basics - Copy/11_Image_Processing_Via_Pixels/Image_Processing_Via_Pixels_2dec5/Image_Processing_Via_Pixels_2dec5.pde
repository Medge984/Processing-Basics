PImage event;

void setup() {
  fullScreen();
  //size(1920, 1080);
  noCursor();
  frameRate(60);
  background(20);

  event = loadImage("horizon.png");
}


void draw() {

  loadPixels();
  event.loadPixels();
  for (int x = 0; x < width - 1; x ++) {
    for (int y = 0; y < height - 1; y ++) {

      int loc  =   x      + (y * width);
      int hloc =  (x + 1) + (y * width);
      int vloc =   x + ((y + 1) * width);

      float b = brightness(event.pixels[loc]);
      float hb = brightness(event.pixels[hloc]);
      float vb = brightness(event.pixels[vloc]);
      float hdiff = abs(b-hb);     
      float vdiff = abs(b-vb);

      if (hdiff>5 || vdiff>5) {
        pixels[loc] = color(255);
      } else {
        pixels[loc] = color(0);
      }
    }
  }
  updatePixels();
}
