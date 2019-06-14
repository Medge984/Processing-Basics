int V = 17;

PVector loc;
PVector vel;
PVector acc;

float r = 255;
float g = 0;
float b = 0;
float z = 15;
float B = z;
int timer;

int x = 1;

//------------------------------------------------------------------------------------

void setup() {
 size(750,750);
 background(255);
 frameRate(60);
 loc = new PVector(width/3,height/2);
 vel = new PVector(-V,V);
}

//------------------------------------------------------------------------------------

void draw() {
  
  noStroke();
  //fill(0);
  //rect(0,0,width,height);
  
  loc.add(vel);
  //vel.add(vel);
  
  if((loc.x > width) || (loc.x < 0 )) {
    vel.x = -vel.x;
  }
  
  if((loc.y > height) || (loc.y < 0 )) {
    vel.y = -vel.y;
  }
  
  stroke(0);
  
  if ((r >= 255 - B && r <= 255) && (g >= 0 && g <= 255) && (b >= 0 && b <= B)) {
      g = g + z;
    }  
    if ((r >= 0 && r <= 255) && (g >= 255 - B && g <= 255 + B) && (b >= 0 && b <= B)) { 
      r = r - z;
    } 
    if ((r >= 0 - B && r <= B) && (g >= 255 - B && g <= 255 + B) && (b >= 0 && b <= 255)) {
      b = b + z;
    } 
    if ((r >= 0 - B && r <= B) && (g >= 0 && g <= 255 + B) && (b >= 255 - B && b <= 255 + B)) {
      g = g - z;
    } 
    if ((r >= 0 - B && r <= 255) && (g >= 0 - B && g <= B) && (b >= 255 - B && b <= 255 + B)) {
      r = r + z;
    } 
    if ((r >= 255 - B && r <= 255 + B) && (g >= 0 && g <= B) && (b >= 1 && b <= 255 + B)) {
      b = b - z;
    }
    
    if (millis() - timer >= 250) {
    println("Speed: " + z + "  |  Red: " + r + "  Green: " + g + "  Blue: " + b);
    timer = millis();
  }
  
  fill(r, g, b );
  ellipse(loc.x,loc.y,25,25);  
}
