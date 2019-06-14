
PImage event;

void setup() {
  fullScreen();
  //size(1920, 1080);
  noCursor();
  frameRate(60);
  background(90);

  event = loadImage("flip.png");
  
  
  
}


void draw() {
  loadPixels();
  event.loadPixels();
  for (int x = 0; x < width; x ++) {
    for (int y = 0; y < height; y ++) {
       int loc = (x+y*width);
       int flip = (width - (x + 1)) + (y * width);;
       pixels[flip] = event.pixels[loc];
    }
  }
  updatePixels();
}
