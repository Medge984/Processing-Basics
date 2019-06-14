// Setup
int Framerate = 60; 
int numberOfBalls = 150;
int border = 15;
int borderOffset = 20;
int hitBox = 4;
boolean fullBorder = true;
int Dis = 0; //Only applicable if fullBorder = false

// Ball Control Board
int ballDiam = 20;
int ballSpeed = 5;
int trail = 50;
float sWeight = 0.1;

// Colour Control Board
int fillBrightness = 75;
int strokeBrightness = 0;

boolean fillRainbow = false;
boolean strokeRainbow = false;
boolean borderRainbow = false;
Boolean textRainbow = false;

int z = 1;
int B = z;
int rRed = 255;
int rGreen = 0;
int rBlue = 0;

int rf1 = 0;    
int gf1 = 255;    
int bf1 = 0;
int rf2 = 0;    
int gf2 = 255;    
int bf2 = 255;

int rs1 = 0;    
int gs1 = 0;    
int bs1 = 255;
int rs2 = 0;    
int gs2 = 255;    
int bs2 = 255;

float scoreR = random(rf1, rf2);
float scoreG = random(gf1, gf2);
float scoreB = random(bf1, bf2);

float gOverR = random(rs1, rs2);
float gOverG = random(gs1, gs2);
float gOverB = random(bs1, bs2);

// Unchangeable 
int H = hitBox;
int T = trail;

int nBalls = numberOfBalls;

int sB = strokeBrightness;
int fB = fillBrightness;

int [] r;
int [] g;
int [] b;

float [] x;
float [] y;
float [] xDelta;
float [] yDelta;
float [] ballDiameter;

int nBallsRemaining = nBalls;
int points = 0;

//------------------------------------------------------------------------------------

void setup() {

  size(1600, 1000); 
  frameRate(Framerate);
  background(0);

  x = new float[nBalls];
  y = new float[nBalls];
  xDelta = new float[nBalls];
  yDelta = new float[nBalls];
  ballDiameter = new float[nBalls];

  r = new int[nBalls];
  g = new int[nBalls];
  b = new int[nBalls];

  for (int i = 0; i < nBalls; i = i + 1) {
    ballDiameter[i] = random((ballDiam * 0.6), ballDiam);
    x[i] = width/2; //random( (11 + (ballDiameter[i]/2)), width - (11 + (ballDiameter[i]/2)));
    y[i] = height/2; //random( (11 + (ballDiameter[i]/2)), height - (11 + (ballDiameter[i]/2)));
    xDelta[i] = random(-ballSpeed, ballSpeed); 
    yDelta[i] = random(-ballSpeed, ballSpeed);

    r[i] = rRed;
    g[i] = rGreen;
    b[i] = rBlue;
  }
}

//------------------------------------------------------------------------------------

void draw() {

  for (int i = 0; i < nBalls; i = i + 1) {

    if ((r[i] >= 255 - B && r[i] <= 255) && (g[i] >= 0 && g[i] <= 255) && (b[i] >= 0 && b[i] <= B)) {
      g[i] = g[i] + z;
    }  
    if ((r[i] >= 0 && r[i] <= 255) && (g[i] >= 255 - B && g[i] <= 255 + B) && (b[i] >= 0 && b[i] <= B)) { 
      r[i] = r[i] - z;
    } 
    if ((r[i] >= 0 - B && r[i] <= B) && (g[i] >= 255 - B && g[i] <= 255 + B) && (b[i] >= 0 && b[i] <= 255)) {
      b[i] = b[i] + z;
    } 
    if ((r[i] >= 0 - B && r[i] <= B) && (g[i] >= 0 && g[i] <= 255 + B) && (b[i] >= 255 - B && b[i] <= 255 + B)) {
      g[i] = g[i] - z;
    } 
    if ((r[i] >= 0 - B && r[i] <= 255) && (g[i] >= 0 - B && g[i] <= B) && (b[i] >= 255 - B && b[i] <= 255 + B)) {
      r[i] = r[i] + z;
    } 
    if ((r[i] >= 255 - B && r[i] <= 255 + B) && (g[i] >= 0 && g[i] <= B) && (b[i] >= 1 && b[i] <= 255 + B)) {
      b[i] = b[i] - z;
    }

    //------------------------------------------------------------------------------------

    fill(0);
    rect((borderOffset + border + Dis), (borderOffset + border + Dis), (borderOffset + border + Dis + 200), (borderOffset + border + Dis + 30));
    if(points > 10 && points < 100) { 
    rect((borderOffset + border + Dis), (borderOffset + border + Dis), (borderOffset + border + Dis + 233), (borderOffset + border + Dis + 30));
    }
    if(points > 100 && points < 1000) { 
    rect((borderOffset + border + Dis), (borderOffset + border + Dis), (borderOffset + border + Dis + 266), (borderOffset + border + Dis + 30));
    }
    if(points > 1000 && points < 10000) { 
    rect((borderOffset + border + Dis), (borderOffset + border + Dis), (borderOffset + border + Dis + 299), (borderOffset + border + Dis + 30));
    }
    if(points > 10000 && points < 100000) { 
    rect((borderOffset + border + Dis), (borderOffset + border + Dis), (borderOffset + border + Dis + 332), (borderOffset + border + Dis + 30));
    }
    if(points > 100000 && points < 1000000) { 
    rect((borderOffset + border + Dis), (borderOffset + border + Dis), (borderOffset + border + Dis + 365), (borderOffset + border + Dis + 30));
    }
    
    fill(0);
    if(nBallsRemaining == 0) {
    rect(width/2 - 210, height/2 - 75, 450, 90);
    }
    
    //------------------------------------------------------------------------------------

    if (borderRainbow) {
      stroke(r[i] - fB, g[i] - fB, b[i] - fB );
    } else {
      stroke(random(rf1, rf2), random(gf1, gf2), random(bf1, bf2));
    }

    textSize(50); 
    if (textRainbow) {
      fill(r[i] - fB, g[i] - fB, b[i] - fB );
    } else {
      fill(scoreR, scoreG, scoreB);
    }

    if (!fullBorder) {
      text("Score:  " + points, (borderOffset + border + 12 + Dis), (borderOffset + border + 50 + Dis));
    } else {
      text("Score:  " + points, (borderOffset + border + 12), (borderOffset + border + 50));
    }
    if (nBallsRemaining == 0) {
      if (textRainbow) {
        fill(r[i] - fB, g[i] - fB, b[i] - fB );
      } else {
        fill(gOverR, gOverG, gOverB);
      }

      textSize(80);
      text("Game Over", width/2 - 200, height/2);
    }

    //------------------------------------------------------------------------------------

    if (fillRainbow) {
      fill(r[i] - fB, g[i] - fB, b[i] - fB );
    } else {    
      fill(random(rf1, rf2), random(gf1, gf2), random(bf1, bf2));
    }

    if (strokeRainbow) {
      stroke(r[i] - sB, g[i] - sB, b[i] - sB);
    } else {
      stroke(random(rs1, rs2), random(gs1, gs2), random(bs1, bs2));
    }

    //------------------------------------------------------------------------------------

    strokeWeight(ballDiameter[i] * 0.2 );    
    ellipse(x[i], y[i], ballDiameter[i], ballDiameter[i]);
    x[i] = x[i] + xDelta[i];
    y[i] = y[i] + yDelta[i];

    //------------------------------------------------------------------------------------

    if (x[i] > width - (borderOffset + border + H + Dis + (((ballDiameter[i]) + (ballDiameter[i] * sWeight))/2)) || x[i] < (borderOffset + border + H + Dis + (((ballDiameter[i]) + (ballDiameter[i] * sWeight))/2))) {
      xDelta[i] = -xDelta[i];
    }
    if (y[i] > height - (borderOffset + border + H + Dis + (((ballDiameter[i]) + (ballDiameter[i] * sWeight))/2)) || y[i] < (borderOffset + border + H + Dis + (((ballDiameter[i]) + (ballDiameter[i] * sWeight))/2))) {
      yDelta[i] = -yDelta[i];
    }
  }


  strokeWeight(border);
  fill(0, 0, 0, trail);

  if (!fullBorder) {
    rect((borderOffset + border + Dis), (borderOffset + border + Dis), width-(2*(borderOffset + border + Dis)), height-(2*(borderOffset + border + Dis)));
  } else {
    rect((borderOffset + border + 1), (borderOffset + border + 1), width-(2*(borderOffset + border + 1)), height-(2*(borderOffset + border + 1)));
  }

  line((borderOffset + border/2), (borderOffset + border/2), (borderOffset + border/2), height-(borderOffset + border/2)); 
  line(width-(borderOffset + border/2), height-(borderOffset + border/2), (borderOffset + border/2), height-(borderOffset + border/2)); 
  line((borderOffset + border/2), (borderOffset + border/2), width-(borderOffset + border/2), (borderOffset + border/2)); 
  line(width-(borderOffset + border/2), (borderOffset + border/2), width-(borderOffset + border/2), height-(borderOffset + border/2));
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
