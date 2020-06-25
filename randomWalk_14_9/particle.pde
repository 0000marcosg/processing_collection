class Punto {

  float x, y;
  float rx, ry;
  float vel;
  color c;


  Punto (float _x, float _y, float _vel) {
    x = _x;
    y = _y;
    vel = _vel;
    colorMode(HSB, 255, 100, 100);
    c = color(random(255), 80, 100);
  }

  void mover() {
    rx = random(vel*-1, vel);
    ry = random(vel*-1, vel);

    x = x + rx;
    y = y + ry;
  }

  void dibujar() {
    fill(c,80);
    noStroke();
    ellipse(x, y, 2, 2);
  }
}
