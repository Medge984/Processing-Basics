
void setup() {
  //fullScreen();
  //noCursor();
  size(800, 800);
  frameRate(60);
  background(20);

  /* Gradient effect that merges Green and blue */
    loadPixels();
    for (int x = 0; x < width; x ++) {
      for (int y = 0; y < height; y ++) {
        pixels[x + y*width] = color(0, x/(width/255), y/(height/255));
      }
    }
    updatePixels();
}


void draw() {

}
