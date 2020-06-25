class Particles {

  int xpos, ypos;
  float xoff = 0;
  PImage img;
  Particles (int x, int y) {

    xpos = x;
    ypos = y;
  }

  //Detecta si es blanco o negro el fondo
  boolean getColor(PImage image) {
    PImage img = image;
    boolean c = false;
    if (img.get(xpos, ypos) == -1) {
      c = false;
    } else {
      c = true;
    }
    return c;
  }

  void mostrar (PImage image) {
    img = image;
    if (getColor(img) == true) {
     /* xpos = xpos + int(random(-2, 2));
      ypos = ypos + int(random(-2, 2));
      xoff += 0.05;*/
      stroke(img.get(xpos, ypos));
    } else {
     /* xpos = xpos + int(random(-2, 2));
      ypos = ypos + int(random(-2, 2));
      xoff += 0.01;*/
      stroke(0,0, 255);
    }
    // noStroke();
    strokeWeight(2);
    ellipse(xpos*width/2, ypos*height/2, 2, 2);
  }
}
