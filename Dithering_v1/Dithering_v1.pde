// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain

// Floyd Steinberg Dithering
// Edited Video: https://youtu.be/0L2n8Tg2FwI

PImage kitten;
PImage newImg;
//float xoff = 1;

ArrayList<Particles> particles = new ArrayList<Particles>();

void setup() {
  frameRate(1);
  size(1024, 1024);
  kitten = loadImage("wardrone.jpg");
  kitten.filter(GRAY);
  //image(kitten, 0, 0);

  for (int i = 0; i < 10000; i ++) {
    particles.add(new Particles(int(random(width)), int(random(height))));
  }

  newImg = dithering(kitten, 1);
  newImg.resize(1024, 1024);
}

int index(int x, int y) {
  return x + y * kitten.width;
}

void draw() {
  background(0, 0, 255);

  //print(get(mouseX, mouseY));

  //imageMode(CENTER);
  newImg.resize(4000, 4000);


  newImg = dithering(kitten, 1);
  for (int y = 0; y < newImg.height-2; y++) {
    for (int x = 1; x < newImg.width-2; x++) {
      color nc = color(0, 0, 255);
      color c = newImg.get(x, y);
      if (c == -1) {
        set(x-800, y-800, nc);
      } else {
        set(x-800, y-800, 255);
      }
    }
  }



  //image(newImg, 0, 0);
  // newImg.resize(2048, 2048);
  //image(newImg, 0, 0);
  /*for (Particles part : particles) {
   part.mostrar(newImg);
   }*/
}

PImage dithering(PImage img, int f) {
  img.loadPixels();
  for (int y = 0; y < img.height-2; y++) {
    for (int x = 1; x < kitten.width-2; x++) {
      color pix = kitten.pixels[index(x, y)];
      float oldR = red(pix);
      float oldG = green(pix);
      float oldB = blue(pix);
      int factor = f;
      int newR = round(factor * oldR / 255) * (255/factor);
      int newG = round(factor * oldG / 255) * (255/factor);
      int newB = round(factor * oldB / 255) * (255/factor);
      img.pixels[index(x, y)] = color(newR, newG, newB);

      float errR = oldR - newR;
      float errG = oldG - newG;
      float errB = oldB - newB;


      int index = index(x+2, y  );
      color c = img.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      r = r + errR * 7/16.0;
      g = g + errG * 7/16.0;
      b = b + errB * 7/16.0;
      img.pixels[index] = color(r, g, b);

      index = index(x-2, y+2);
      c = img.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 3/16.0;
      g = g + errG * 3/16.0;
      b = b + errB * 3/16.0;
      img.pixels[index] = color(r, g, b);

      index = index(x, y+2);
      c = img.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 5/16.0;
      g = g + errG * 5/16.0;
      b = b + errB * 5/16.0;
      img.pixels[index] = color(r, g, b);


      index = index(x+2, y+2);
      c = img.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 1/16.0;
      g = g + errG * 1/16.0;
      b = b + errB * 1/16.0;
      img.pixels[index] = color(r, g, b);
    }
  }
  img.updatePixels();

  return img;
}

void mousePressed() {
  saveFrame("###.png");
}
