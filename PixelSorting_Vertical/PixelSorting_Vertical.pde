PImage img;
PImage sorted;
int index = 0;

int selectedPixel;

void setup() {
  size(200, 100);
  img = loadImage("foto2.JPG");
  img.resize(width/2, height);
  sorted = createImage(img.width, img.height, RGB);

  sorted.loadPixels();
  img.loadPixels();
  //for (int i = 0; i < sorted.pixels.length; i++) {
  //  sorted.pixels[i] = img.pixels[i];
  //}
  sorted = img.get();
  sorted.loadPixels();


  //Seleccion
}

void draw() {

  //----------------------------------------------------------------
  float record = -1;
  for ( int x = 0; x <sorted.width; x++) {
    for (int y = 0; y <sorted.height; y++) {
      //int selectedPixel = ( y * img.width ) + x;
      color pix = sorted.pixels[( y * img.width ) + x];
      float g = red(pix);
      if (g > record) {
        selectedPixel = ( y * img.width ) + x;
        record = g;
        //}
      }
      color temp = sorted.pixels[( y * img.width ) + x];
      sorted.pixels[( y * img.width ) + x] = sorted.pixels[selectedPixel];
      sorted.pixels[selectedPixel] = temp;
     // }
    }
  }
  //}
  sorted.updatePixels();
  //}
  image(img, 0, 0);
  image(sorted, width/2, 0);
}

void guardar() {
  saveFrame("####.png");
}
