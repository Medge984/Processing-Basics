float [] x;
float [] y;
float [] xDelta;
float [] yDelta;
int nBalls = 15;
int nBallsRemaining = nBalls;
int points = 0;


void setup() {
  size(800, 600); 
  frameRate(60);

  x = new float[nBalls];
  y = new float[nBalls];
  xDelta = new float[nBalls];
  yDelta = new float[nBalls];

  for (int i = 0; i < nBalls; i = i + 1) {
    x[i] = width/2; 
    y[i] = height/2; 
    xDelta[i] = random(-3, 3); 
    yDelta[i] = random(-3, 3);
  }
}


void draw() {
  background(0);
  strokeWeight(5);

  for (int i = 0; i < nBalls; i = i + 1) {

    fill(random(0), random(150, 255), random(0, 255));
    stroke(random(0), random(0, 255), random(150, 255));
    ellipse(x[i], y[i], 30, 30);
    x[i] = x[i] + xDelta[i];
    y[i] = y[i] + yDelta[i];

    if (x[i] > width - 15 || x[i] < 15) {
      xDelta[i] = -xDelta[i];
    }
    if (y[i] > height - 15 || y[i] < 15) {
      yDelta[i] = -yDelta[i];
    }
  }

  textSize(50);
  fill(0, 255, 0);
  text("Score:  " + points, 10, 50);
  if (nBallsRemaining == 0) {
    fill(0, 255, 150);
    textSize(80);
    text("Game Over", 180, height/2);
  }
}


void mousePressed() {
  for (int i = 0; i < nBalls; i += 1) {
    float dist = sqrt((x[i] - mouseX) * (x[i] - mouseX) + (y[i] - mouseY) * (y[i] - mouseY));
    if (dist <= 15) {
      x[i] = -100;
      y[i] = -100;

      int speedBonus = abs(int(xDelta[i] + xDelta[i]));
      int timeBonus = int(20000.0/millis() * 3);
      points = points + speedBonus + timeBonus;
      nBallsRemaining--;
      break;
    }
  }
}
