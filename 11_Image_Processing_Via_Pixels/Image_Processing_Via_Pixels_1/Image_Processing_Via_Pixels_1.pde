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
  for (int x = 0; x < width; x ++) {
    for (int y = 0; y < height; y ++) {
      int loc = x+(y*width);
      
      float r = red(event.pixels[loc]);
      float g = green(event.pixels[loc]);
      float b = blue(event.pixels[loc]);
      float bn = brightness(event.pixels[loc]);
      float distcent = dist(width/2,height/2,x,y);
      float distmous = dist(mouseX,mouseY,x,y);
      float factor = map(distmous,0,255,0,2);
     
        
      pixels[loc] = color(g,r,b*2);
      
    }
  }
  updatePixels();
}
