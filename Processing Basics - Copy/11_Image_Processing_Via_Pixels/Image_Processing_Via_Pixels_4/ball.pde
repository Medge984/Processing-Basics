class Ball {

  float speed;
  float x;
  float y;
  float vx;
  float vy;
  int d;


  Ball() {
    x = width/2;
    y = height/2;
    d = 3;
    speed = 8;
    float angle = random(TWO_PI);
    float s = random(speed*0.5, speed);
    vx = cos(angle) * s;
    vy = sin(angle) * s;
  }


  void display() {
    color col = event.get(int(x), int(y));
    fill(col,255);
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
