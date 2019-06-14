void setup() {
  size(800, 600);
  background(0);
}

void draw() {
  background(130,255,255);
  fill(0,183,0);
  ellipse(530,520,1400,600);
  fill(0,219,0);
  ellipse(0,500,1400,600);
  fill(255,255,144);
  rect(-10,400,810,600);
  fill(36,36,255);
  ellipse(400,610,750,300);
  
 
  int i = 0;
  while (i < 6) {
    turtle(90 + i * 125, 400);
    i += 1;
  }
}

void turtle(int x, int y) {
  fill(10, 200, 0);
  rect(x-40, y, 10, 30);
  rect(x+30, y, 10, 30);
  fill(147, 74, 0);
  ellipse(x, y, 100, 40);
  fill(10, 200, 0);
  ellipse(x, y+5, 35, 35);
}
