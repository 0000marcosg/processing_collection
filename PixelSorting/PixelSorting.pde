PImage img;
PImage sorted;
int index = 0;




void setup() {
  size(1600, 800);
  img = loadImage("foto2.JPG");
  img.resize(800, 800);
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

  //Selection
  //for (int n = 0; n<50; n++) {
  float record = -1;
  int selectedPixel = index;
  for ( int j = index; j <sorted.pixels.length; j++) {
    color pix = sorted.pixels[j];
    float g = red(pix);
    if (g > record) {
      selectedPixel = j;
      record = g;
      //}
      }
      color temp = sorted.pixels[index];
      sorted.pixels[index] = sorted.pixels[selectedPixel];
      sorted.pixels[selectedPixel] = temp;
    //}
  }
  if (index < sorted.pixels.length -1) {
    index++;
    //println(map(index, 0, sorted.pixels.length-1, 0, 100));
  } else {
    println(millis() / 1000 /60);
    guardar();
    noLoop();
  }
  //}
  sorted.updatePixels();
  //}
  image(img, 0, 0);
  image(sorted, 800, 0);
}

void guardar(){
  saveFrame("####.png");
}
