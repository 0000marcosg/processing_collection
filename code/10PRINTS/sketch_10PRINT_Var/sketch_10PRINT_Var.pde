// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain

// 10PRINT
// https://www.youtube.com/watch?v=bEyTZ5ZZxZs
int x = 0;
int y = 0;
int spacing  = 15;
void setup() {
  size(1000, 1000);
  background(255);
}

void draw() {
  stroke(0);
  float n = norm(y, 0, height);
  float s = map(y, 0, height, 1, 4);
  strokeWeight(s);

  if (Math.random() > n) {
    //strokeWeight(1);

    line (x, y, x+spacing, y+spacing);// "\"
  } else {
    //strokeWeight(1);
    line (x, y+spacing, x+spacing, y);// "/"
  }
  x = x+spacing;
  if (x > width) {
    x = 0;
    y = y+spacing;
  }
}

void mousePressed() {
  saveFrame("###.png");
}
