

PImage kitten;
PImage newImg;
//float xoff = 1;
PFont font;

ArrayList<Particles> particles = new ArrayList<Particles>();

void setup() {
  frameRate(1);
  size(1024, 1024);
  kitten = loadImage("pika.jpg");
  kitten.filter(GRAY);
  //image(kitten, 0, 0);

  //for (int i = 0; i < 10000; i ++) {
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      particles.add(new Particles(x, y));
    }
  }

  newImg = dithering(kitten, 1);
  //newImg.resize(1024, 1024);
  
  font = createFont("Consolas",20);
  textFont(font);
  //println(PFont.list());
}

int index(int x, int y) {
  return x + y * kitten.width;
}

void draw() {
  background(#5B05FF);
  noStroke();

  //print(get(mouseX, mouseY));

  imageMode(CENTER);
  newImg.resize(500, 500);


  newImg = dithering(kitten, 1);
  for (int y = 0; y < newImg.height-2; y++) {
    for (int x = 1; x < newImg.width-2; x++) {
      color nc = color(#CCDE6B);
      color c = newImg.get(x, y);
      if (c == -1) {
        fill(nc);
        //ellipse(x+width/2-newImg.width/2, y+height/2-newImg.height/2, 30, 30);
        //set(x*width/2, y*height/2, nc);
      } else {



        fill(nc);
        ellipse(x+width/2-newImg.width/2, y+height/2-newImg.height/2, 2, 2  );

        fill(0);
        ellipse(x+width/2-newImg.width/2+2, y+height/2-newImg.height/2, 2, 2  );

        //set(x+width/2-newImg.width/2, y+height/2-newImg.height/2, 255);
      }
    }
  }
  stroke(#CCDE6B);fill(#CCDE6B);
  strokeWeight(3);
  line(width/2-newImg.width/2, height/2+newImg.height/2+30, width/2+newImg.width/2, height/2+newImg.height/2+30);
  //textSize(18);
  text("dithering_v2_7/1/20.pde",width/2-newImg.width/2, height/2+newImg.height/2+60);



  //image(newImg, width/2, height/2);
  // newImg.resize(2048, 2048);
  //image(newImg, 0, 0);
  //for (Particles part : particles) {
  //part.mostrar(newImg);
  //}
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
