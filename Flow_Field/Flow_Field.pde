float inc = 0.15;
int scl = 20;
float zoff = 0;

int cols;
int rows;

int noOfPoints = 15000;

Particle[] particles = new Particle[noOfPoints];
PVector[] flowField;

void setup() {
  colorMode(HSB, 255, 255, 255);
  size(1000, 1000, P3D);

  background(255);

  cols = floor(width/scl);
  rows = floor(height/scl);

  flowField = new PVector[(cols*rows)];

  for (int i = 0; i < noOfPoints; i++) {
    particles[i] = new Particle();
  }
}

void draw() {
  //fill(255,20);
  //rect(0, 0, width, height);
  //background(255);
  //noFill();

  float yoff = 0;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      int index = (x + y * cols);

      float angle = noise(xoff, yoff, zoff) * TWO_PI;
      PVector v = PVector.fromAngle(angle);
      v.setMag(.01);

      flowField[index] = v;
/*
      stroke(0);
      strokeWeight(1);
      pushMatrix();

      translate(x*scl, y*scl);
      rotate(v.heading());
      line(0, 0, scl, 0);

      popMatrix();
*/
      xoff = xoff + inc;
    }
    yoff = yoff + inc;
  }
  zoff = zoff + (inc / 50);

  for (int i = 0; i < particles.length; i++) {
    particles[i].follow(flowField);
    particles[i].update();
    particles[i].edges();
    particles[i].show();
  }
}

void mousePressed() {
  saveFrame("####.png");
}
