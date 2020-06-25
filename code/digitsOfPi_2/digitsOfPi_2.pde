
String pi;
int[] digits;
int[] counts = new int[10];
int index = 0;
color line;
float a = 0;

float a1, a2, x1, y1, x2, y2, bx1, by1, bx2, by2, diff;

void setup() {
  size(840, 840);
  colorMode(HSB, 360, 100, 100);
  pi = loadStrings("pi-1million.txt")[0];

  //println(pi.length());
  String[] sdigits = pi.split("");

  //println(sdigits.length);
  digits = int(sdigits);

  //printArray(digits);
  background(360);
  //stroke(255);
  noFill();
  translate(width/2, height/2);
  //ellipse(0, 0, 800, 800);
  smooth();
  stroke(120, 80);
  strokeWeight(4);
  ellipse(0, 0, 800, 800);
  strokeWeight(2);

  ellipse(0, 0, 750, 750);
  strokeWeight(1);
}

void draw() {

  //background(0);
  /*translate(0, 0);
   fill(0,2);
   rect(0, 0, width, height);
   */
  translate(width/2, height/2);

  //for (int index = 0; index < 800; index ++) {

  int digit = digits[index];
  int nextDigit = digits[index+1];
  index++;

  diff = diff + 0.0005;

  a1 = map(digit, 0, 10, 0, TWO_PI) + noise( diff);
  a2 = map(nextDigit, 0, 10, 0, TWO_PI) + noise( diff);

  x1 = 400 * cos(a1);
  y1 = 400 * sin(a1);

  x2 = 400 * cos(a2);
  y2 = 400 * sin(a2);

  bx1 = 300 * cos(a1);
  by1 = 300 * sin(a1);

  bx2 = 300 * cos(a2);
  by2 = 300 * sin(a2);

  if (digit != 0) {
    line = color(36*digit, 100, 100, 50);
  } else {
    line = color(0, 100, 100, 60);
  }
  /*
  strokeWeight(4);
   stroke(255);
   point(bx1, by1);
   point(bx2, by2);
   
   strokeWeight(1);
   */
  stroke(line);
  //line(x1, y1, x2, y2);
  bezier(x1, y1, bx1, by1, bx2, by2, x2, y2);
  //}
}

void mousePressed() {
  stroke(120, 80);
  strokeWeight(4);
  ellipse(0, 0, 800, 800);
  strokeWeight(2);

  ellipse(0, 0, 750, 750);
  strokeWeight(1);
  saveFrame();
}
