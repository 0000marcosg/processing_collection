//import processing.pdf.*;

void setup() {
  size(1200, 1200);
  //fullScreen();
  // beginRecord(PDF, "collatz.pdf");
  background(0);
  for (int i = 1; i < 10000; i++) {
    IntList sequence = new IntList();
    int n = i;
    do {
      sequence.append(n);
      n = collatz(n);
    } while (n != 1);
    sequence.append(1);
    sequence.reverse();
    
    float len = 10;
    float angle = random(2,90);
    
    resetMatrix();
    translate(width/2, height - height/3);
    for (int j = 0; j < sequence.size(); j++) {
      int value = sequence.get(j);
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
