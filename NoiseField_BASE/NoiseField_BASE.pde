float inc =  0.1;
float scl = 10;
int cols, rows;

float zoff = 0;
void setup() {
  size (400, 400);
  cols = floor(width/scl);
  rows = floor (height/scl);
}

void draw() {
  background(255);
  float yoff = 0;
  for (int y = 1; y < rows; y++) {
    float xoff = 0;
    for (int x = 1; x < cols+1; x++) {
      int index = (x+y*width) * 4;
      float angle = noise (xoff, yoff, zoff) * TWO_PI;
      PVector v = PVector.fromAngle(angle);
      xoff += inc;
      stroke(0);
      pushMatrix();
      translate(x*scl, y*scl);
      rotate(v.heading());
      line(0,0, scl, 0);
      popMatrix();
    }
    yoff += inc;
    zoff += 0.00005; 
  }
}
