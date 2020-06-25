
float x = 0;
float y = 0;
float spacing  = 15;
void setup() {
  size(1000, 1000);
  background(255);
}

void draw() {
  fill(0,0,255);
  float n = norm(y, 0, height);
  float s = map(y, 0, height, 8, 30);
  //spacing = spacing + s;
  //strokeWeight(s);
  textSize(s);


  if (Math.random() > n) {
    //strokeWeight(1);

    text("a", x, y);
    //line (x, y, x+spacing, y+spacing);// "\"
  } else {
    text("b", x, y);

    //strokeWeight(1);
    //line (x, y+spacing, x+spacing, y);// "/"
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
