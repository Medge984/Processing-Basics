float r = 255;
float g = 0;
float b = 0;
float z = 19;
float B = z;
int timer;

void setup() {
  size(800, 800);
  frameRate(6);
}

void draw() {
//fill(r = r + x, g = g + x, b = b + x);
//--------------------------------------------------------------------------------------------------------

//First attempt
//Only works if z is a factor of 255, excluding 255. (1,3,5,15,17,51,85)
//Problem is that the boundaries are too tight and need widening relative to z 
  //if ((r == 255) && (g >= 0) && (b == 0)) {
  //    g = g + z;
  //  }  
  //   if ((r <= 255) && (g == 255) && (b == 0)) { 
  //    r = r - z;
  //  } 
  //  if ((r == 0) && (g == 255) && (b >= 0)) {
  //    b = b + z;
  //  } 
  //  if ((r == 0) && (g <= 255) && (b == 255)) {
  //    g = g - z;
  //  } 
  //  if ((r >= 0) && (g == 0) && (b == 255)) {
  //    r = r + z;
  //  } 
  //  if ((r == 255) && (g == 0) && (b <= 255)) {
  //    b = b - z;
  //  }

//--------------------------------------------------------------------------------------------------------  

//Attempt 2 / final attempt
//Now allowing z to be any integer between 0 and 128, allows for some floats but sometimes run into semantics issues
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
  
  background(r,g,b);
}
