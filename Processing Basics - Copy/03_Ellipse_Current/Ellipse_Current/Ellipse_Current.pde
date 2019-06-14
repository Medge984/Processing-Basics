float x;


float r;
float g;
float b;


// Setup only gets run once
void setup() {
  size(1000,1000);
  
  x = -50;

  r = 0;
  g = 0;
  b = 0;
  
  frameRate(5);
  background(0);
} 


// draw happens every frame
void draw()  {
  noStroke();
  
  x = x + 100;
    
  if( x > width-50 ) {
    x = -50;
    x = x + 100;
  }
  
  fill(0, random(255), random(255));
  
  //fill(r, g, b);
  
  //r = r + 15;
  
  //if( r > 254) { 
  //  r = r - 15;
  //  g = g + 15;
  //  b = 0;
 
  
  //if( g > 254) 
  //  g = g - 15;
  //  b = b + 15;
  //  r = 0;
  //}
  
  
  ellipse(x,50,100,100);
  ellipse(x,150,100,100);
  ellipse(x,250,100,100);
  ellipse(x,350,100,100);
  ellipse(x,450,100,100);
  
  ellipse(x,550,100,100);
  ellipse(x,650,100,100);
  ellipse(x,750,100,100);
  ellipse(x,850,100,100);
  ellipse(x,950,100,100);
}
