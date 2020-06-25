// Daniel Shiffman
// http://codingtra.in

// Visualizing the Digits of Pi
// https://youtu.be/WEd_UIKG-uc
// https://thecodingtrain.com/CodingChallenges/096-visualizing-pi.html

String pi;
int[] digits;
int[] counts = new int[10];
int index = 0;
color line;

void setup() {
  size(840, 840);
  colorMode(HSB, 360, 100, 100);
  pi = loadStrings("pi-1million.txt")[0];

  //println(pi.length());
  String[] sdigits = pi.split("");

  //println(sdigits.length);
  digits = int(sdigits);

  //printArray(digits);
  background(0);
  //stroke(255);
  noFill();
  translate(width/2, height/2);
  ellipse(0, 0, 800, 800);
}

void draw() {

  translate(width/2, height/2);

  int digit = digits[index];
  int nextDigit = digits[index+1];
  index++;

  float diff = TWO_PI/30;

  float a1 = map(digit, 0, 10, 0, TWO_PI) + random(-diff, diff);
  float a2 = map(nextDigit, 0, 10, 0, TWO_PI) + random(-diff, diff);

  float x1 = 400 * cos(a1);
  float y1 = 400 * sin(a1);

  float x2 = 400 * cos(a2);
  float y2 = 400 * sin(a2);

  if (digit != 0) {
    line = color(36*digit, 100, 100, 50);
  } else {
    line = color(0, 100, 100, 60);
  }



  stroke(line);
  line(x1, y1, x2, y2);
}

void mousePressed() {
  saveFrame();
}
