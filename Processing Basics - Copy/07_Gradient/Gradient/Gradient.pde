
void setup() {
  size(500, 500);
  background(50);
  frameRate(20);
}

void draw() {
  int spacing = 10;
  for (int x = 0; x < width; x += spacing) {
    for (int y = 0; y < height; y += spacing) {
      
      noStroke();
      fill(255 - 255 * ( ( abs( dist( x,y,width/2,height/2)))/ ( abs( dist( 0,0,width/2,height/2)))));
      rect(x, y, x + spacing, y + spacing);
    }
  }
}
