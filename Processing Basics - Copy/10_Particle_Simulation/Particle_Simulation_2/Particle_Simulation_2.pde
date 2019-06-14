Particle[] particle;

void setup() {
  //fullScreen();
  size(1800, 100);
  noCursor();
  frameRate(60);
  background(20);

  particle = new Particle[6000];
  for( int i = 0; i < particle.length; i++ ) {
    particle[i] = new Particle();    
  }
}


void draw() {
  background(10);
  
   for( int i = 0; i < particle.length; i++ ) {
    particle[i].display();
    particle[i].motion();
  }
}
