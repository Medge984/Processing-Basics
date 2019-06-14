PImage logo;

void setup() {
  size(500, 500);
  logo = loadImage("PL.png");
}


void draw() {

  background(20);

  imageMode(CORNERS);
  tint(0, mouseX, mouseY);
  image(logo, 0, 0, mouseX, mouseY);

  tint(mouseX, 0, mouseY);
  image(logo, width, 0, width -mouseX, mouseY);

  tint(mouseX, mouseY,0);
  image(logo, 0, height, mouseX, height -mouseY);

  tint(mouseY,0.5*mouseX,0);
  image(logo,width,height,width -mouseX,height -mouseY);
}
