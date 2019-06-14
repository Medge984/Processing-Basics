
PImage event;

Ball[] ball;

void setup() {
  fullScreen();
  //size(1920, 1080);
  noCursor();
  frameRate(60);
  background(255);

  event = loadImage("Event Horizon.png");

  ball = new Ball[6000];
  for ( int i = 0; i < ball.length; i++ ) {
    ball[i] = new Ball();
  }
}


void draw() {
  //background(255);

  for ( int i = 0; i < ball.length; i++ ) {
    ball[i].display();
    ball[i].motion();
  }
}
