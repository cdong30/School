//edge detection
PImage img;
String choose;
int [] GArray;

void setup() {
  size(800, 800);
  GArray = new int[width * height];
  img = loadImage("house2.jpg");
  img.resize(width, height);
  grayscale();
  image(img, 0, 0);
  Vertical();
}

void draw() {
  brc();
  String name = brcChanged();
  if (name.equals("Load")) {
    if (brcValue("Files").equals("H")) choose = "house2.jpg";
    if (brcValue("Files").equals("C")) choose = "car-square.jpg";
    if (brcValue("Files").equals("B")) choose = "butterfly-2-square.jpg";
    img = loadImage(choose);
    img.resize(width, height);
    grayscale();
  }
}

void grayscale() {
  img.loadPixels();
  for (int i = 0; i < width * height; i++) {
    GArray[i] = int((red(img.pixels[i]) 
      + green(img.pixels[i]) 
      + blue(img.pixels[i]))/3);
    img.pixels[i] = color(GArray[i]);
  }
  img.updatePixels();
  image(img, 0, 0);
}

void Vertical() {
  img.loadPixels();
  for (int row = 1; row < width - 1; row++) {
    //println("test");
    for (int col = 1; col < height -1; col++) {
      int finder = row * width + col;
      if ((abs(img.pixels[finder] - img.pixels[finder + 1])) > 200) {
        img.pixels[finder] = color(255);
      } else {
        img.pixels[finder] = color(0);
      }
      img.updatePixels();
    }
  }
  image(img, 0, 0);
}
