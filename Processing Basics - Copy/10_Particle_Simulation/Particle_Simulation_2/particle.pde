

class Particle {
  float speed;
  float x;
  float y;
  float vx;
  float vy;
  int d;

  Particle() {


    x = width/2;
    y = height/2;
    d = 1;
    speed = 2;
    float angle = random(TWO_PI);
    float s = random(speed, speed);
    vx = cos(angle) * s;
    vy = sin(angle) * s;
  }

  void display() {
    noStroke();
    ellipse(x, y, d, d);
  }

  void motion() {
    x += vx;
    y += vy;

    if (x > width) {
      x = 0;
    }

    if (x < 0) {
      x = width;
    }

    if (y > height) {
      y = 0;
    }

    if (y < 0) {
      y = height;
    }
  }
}
