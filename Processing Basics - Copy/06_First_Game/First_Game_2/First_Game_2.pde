// Setup
int Framerate = 60; 
int numberOfBalls = 10;
int border = 3;
int borderOffset = 80;
int hitBox = 4;

// Ball Control Board
int ballDiam = 20;
int ballSpeed = 3;
int trail = 10;
float sWeight = 0.4;

// Colour Control Board
int rf1 = 255;    
int gf1 = 0;    
int bf1 = 0;
int rf2 = 255;    
int gf2 = 0;    
int bf2 = 255;

int rs1 = 255;    
int gs1 = 0;    
int bs1 = 0;
int rs2 = 255;    
int gs2 = 0;    
int bs2 = 255;

float scoreR = random(rf1,rf2);
float scoreG = random(gf1,gf2);
float scoreB = random(bf1,bf2);

float gOverR = random(rs1,rs2);
float gOverG = random(gs1,gs2);
float gOverB = random(bs1,bs2);

// Unchangeable 

int H = hitBox;
int T = trail;

int nBalls = numberOfBalls;

float [] x;
float [] y;
float [] xDelta;
float [] yDelta;
float [] ballDiameter;

int nBallsRemaining = nBalls;
int points = 0;

//------------------------------------------------------------------------------------

void setup() {
  
  size(800, 1000); 
  frameRate(Framerate);
  background(0);

  x = new float[nBalls];
  y = new float[nBalls];
  xDelta = new float[nBalls];
  yDelta = new float[nBalls];
  ballDiameter = new float[nBalls];

  for (int i = 0; i < nBalls; i = i + 1) {
    ballDiameter[i] = random((ballDiam * 0.6), ballDiam);
    x[i] = width/2; 
    y[i] = height/2; 
    xDelta[i] = random(-ballSpeed, ballSpeed); 
    yDelta[i] = random(-ballSpeed, ballSpeed);
  }
}

//------------------------------------------------------------------------------------

void draw() {
  
  strokeWeight(5);
  stroke(random(rf1,rf2), random(gf1,gf2), random(bf1,bf2));
  fill(0,0,0,trail);
  rect((borderOffset + border + 1),(borderOffset + border + 1),width-(2*(borderOffset + border + 1)),height-(2*(borderOffset + border + 1)));
  strokeWeight(border);
  fill(0, 255, 30);
  line((borderOffset + border/2),(borderOffset + border/2),(borderOffset + border/2),height-(borderOffset + border/2)); 
  line(width-(borderOffset + border/2),height-(borderOffset + border/2),(borderOffset + border/2),height-(borderOffset + border/2)); 
  line((borderOffset + border/2),(borderOffset + border/2),width-(borderOffset + border/2),(borderOffset + border/2)); 
  line(width-(borderOffset + border/2),(borderOffset + border/2),width-(borderOffset + border/2),height-(borderOffset + border/2));

  for (int i = 0; i < nBalls; i = i + 1) {
    
    strokeWeight(ballDiameter[i] * sWeight);
    fill(random(rf1,rf2), random(gf1,gf2), random(bf1,bf2));
    stroke(random(rs1,rs2), random(gs1,gs2), random(bs1,bs2));
    ellipse(x[i], y[i], ballDiameter[i], ballDiameter[i]);
    x[i] = x[i] + xDelta[i];
    y[i] = y[i] + yDelta[i];

    if (x[i] > width - (borderOffset + border + H + (((ballDiameter[i]) + (ballDiameter[i] * sWeight))/2)) || x[i] < (borderOffset + border + H + (((ballDiameter[i]) + (ballDiameter[i] * sWeight))/2))) {
      xDelta[i] = -xDelta[i];
    }
    if (y[i] > height - (borderOffset + border + H + (((ballDiameter[i]) + (ballDiameter[i] * sWeight))/2)) || y[i] < (borderOffset + border + H + (((ballDiameter[i]) + (ballDiameter[i] * sWeight))/2))) {
      yDelta[i] = -yDelta[i];
    }
  }

  textSize(50);
  fill(scoreR, scoreG, scoreB);
  text("Score:  " + points, (borderOffset + border + 12),(borderOffset + border + 50));
  if (nBallsRemaining == 0) {
    fill(gOverR, gOverG, gOverB);
    textSize(80);
    text("Game Over", width/2 - 200, height/2);
  }
}

//------------------------------------------------------------------------------------

void mousePressed() {
  for (int i = 0; i < nBalls; i += 1) {
    float dist = sqrt((x[i] - mouseX) * (x[i] - mouseX) + (y[i] - mouseY) * (y[i] - mouseY));
    if (dist <= ballDiameter[i] + (ballDiameter[i]*0.2)) {
      x[i] = -100;
      y[i] = -100;

      int speedBonus = abs(int(xDelta[i] + xDelta[i]));
      int timeBonus = int(nBalls * 1000.0/millis() * 3);
      int sizeBonus = int(1/ballDiameter[i] * 10);
      points = points + speedBonus + timeBonus + sizeBonus;
      nBallsRemaining--;
      break;
    }
  }
}
