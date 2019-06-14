
class Balloon {
 
  float x;
  float y;
  float diameter;
  
  PImage img;
  float mult;
  
  
  Balloon(PImage tempImg, float tempX, float tempY, float tempD) {
   x = tempX;
   y = tempY;
   diameter = tempD;
   img = tempImg;
   
   if( img == bloons[0]) {
    mult = 0.2;
    } else {
      mult = 1;
    }
  }
  
  void ascend() {
   y--;
   x = x + random(-2,2);
  }
  
 
  
  void display() {
    
    stroke(255);
    fill(127);
    //ellipse(x,y,diameter,diameter);
    imageMode(CENTER);
    image(img,x,y, mult * diameter * img.width, mult * diameter * img.height);
    
    
  }
  
  void top() {
    
   if(y < mult * diameter * img.height/2) {
     y = mult * diameter * img.height/2;
   }    
  }
}
