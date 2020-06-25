Punto p;

ArrayList<Punto> puntos = new ArrayList<Punto>();


void setup () {
  size(800, 800);
  p = new Punto(random(width), random(width), random(5));

  for (int i = 0; i < 8000; i++) {
    puntos.add(new Punto(random(width), random(width), random(3)));
  }
}


void draw() {
  //background(255,10);
  colorMode(RGB);
  fill(255, 2);
  noStroke();
  rect(0, 0, width, height);

  for (Punto p : puntos) {
    p.dibujar();
    p.mover();
  }
}

void mousePressed() {
saveFrame("####.png");

}
