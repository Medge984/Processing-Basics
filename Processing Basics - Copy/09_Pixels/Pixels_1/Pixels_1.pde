
void setup() {
  //fullScreen();
  //noCursor();
  size(800, 800);
  frameRate(60);
  background(20);

  /* Every 7th pixel is assigned a random green value 
   * Creates interesting illusion if you stare at the center
   * The colour in the periphery seems to move */
  loadPixels();
  for (int i = 0; i < pixels.length; i += 7) {
    pixels[i] = color(0, random(255), 0);
  }
  updatePixels();
}


void draw() {
  /* Same as before, except in draw */
  //background(0);
  //loadPixels();
  //for (int i = 0; i < pixels.length; i += 7) {
  //  pixels[i] = color(0, random(255), 0);
  //}
  //updatePixels();
}
