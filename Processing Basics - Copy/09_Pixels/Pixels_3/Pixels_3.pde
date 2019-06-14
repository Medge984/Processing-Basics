
void setup() {
  //fullScreen();
  //noCursor();
  size(800, 800);
  frameRate(60);
  background(20);

}


void draw() {
  /* The same gradient effect as pixels 2 except,
   * Mousemovement on x-axis applies red value */
  loadPixels();
  for (int x = 0; x < width; x ++) {
    for (int y = 0; y < height; y ++) {
      pixels[x + y*width] = color(mouseX/(width/255), x/(width/255), y/(height/255));
    }
  }
  updatePixels();
}
