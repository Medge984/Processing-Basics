float x = 500;
float y = 400;

int xSpeed = 15;
int ySpeed = 15;


void setup() {
  size(1000,800);
  background(0);
}


void draw() {
  
  fill(random(255),255,0);
  ellipse(x,y,50,50);
  
  x += xSpeed;
  y += ySpeed;
  
  if( x > width || x < 0) {
    xSpeed *= -1;
  }
  
  if( y > height || y < 0) {
    ySpeed *= -1;
  }
  
  
  
}
