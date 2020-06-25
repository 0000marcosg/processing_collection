//import processing.pdf.*;

float len;
float angle;
float xoff = 0.01;
float ang;
int n, value;

IntList sequence;

void setup() {
  //frameRate(25);
  size(1200, 1200);
  //fullScreen();
  // beginRecord(PDF, "collatz.pdf");
  background(#F3FFAA);
  for (int i = 1; i < 20000; i++) {
    sequence = new IntList();
    int n = i;
    do {
      sequence.append(n);
      n = collatz(n);
    } while (n != 1);
    sequence.append(1);
    sequence.reverse();

    len = 20;
    angle = 45 ;//random(50, 60);

    resetMatrix();
    translate(width/2, height/2);
    for (int j = 0; j < sequence.size(); j++) {
      int value = sequence.get(j);
      ///angle = value/360;
      if (value % 2 == 0) {
        rotate(-angle);
      } else {
        rotate(angle);
      }
      strokeWeight(2);
      stroke(0, 50);
      line(0, 0, len, 0);
      translate(len, 0);
    }
    // Visualize the list
  }
  saveFrame(random(1) + ".png");
  // endRecord();
}
int collatz(int n) {
  // even
  if (n % 2 == 0) {
    return n / 2;
    // odd
  } else {
    return (n * 3 + 1)/2;
  }
}

void draw() {
 /* background(0);
  for (int i = 1; i < 1000; i++) {
    sequence = new IntList();
    n = i;
    do {
      sequence.append(n);
      n = collatz(n);
    } while (n != 1);
    sequence.append(1);
    sequence.reverse();

    // angle = random(2, 90);
    ang = noise(xoff);
    angle = map(ang, 0, 1, 2, 90);
    //len = map(ang, 0, 1, 2, 50);

    resetMatrix();
    translate(width/2, height/2);
    for (int j = 0; j < sequence.size(); j++) {
      value = sequence.get(j);
      if (value % 2 == 0) {
        rotate(-angle);
      } else {
        rotate(angle);
      }
      strokeWeight(2);
      stroke(255, 20);
      line(0, 0, 0, -len);
      translate(0, -len);
    }
    // Visualize the list
  }

  xoff = xoff + 0.0001;
  saveFrame();
  // endRecord();*/
}
