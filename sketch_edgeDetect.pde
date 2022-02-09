//edge detection
PImage img;
String choose;
int [] GArray;
int threshold;

void setup() {
  size(800, 800);
  GArray = new int[width * height];
  img = loadImage("house2.jpg");
  img.resize(width, height);
  grayscale();
  image(img, 0, 0);
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
  if(name.equals("Vert")){
    image(img, 0, 0);
    Vertical();
  }
  if(name.equals("Hor")){
    image(img, 0, 0);
    Horizontal();
  }
  if(name.equals("Threshold")){
    threshold = int(brcValue("Threshold"));
  }
  
}

void grayscale() {
  img.loadPixels();
  for (int i = 0; i < width * height; i++) {
    GArray[i] = int((red(img.pixels[i]) 
      + green(img.pixels[i]) 
      + blue(img.pixels[i]))/3);
    img.pixels[i] = color(GArray[i]); //get rid of it, we want the house to stay
  }
  img.updatePixels();
  image(img, 0, 0);
}

//replace the 50 with the threshold value

void Vertical() {
  img.loadPixels();
  for (int row = 1; row < width - 1; ++row) {
    //println("test");
    for (int col = 2; col < height -1; ++col) {
      int finder = row * width + col;
      if ((abs(GArray[finder - 1] - GArray[finder + 1]) > threshold)) {
        img.pixels[finder] = color(255);
      } else {
        img.pixels[finder] = color(0);
      }
      img.updatePixels();
    }
  }
  image(img, 0, 0);
}

void Horizontal(){
  img.loadPixels();
  for(int col = 1; col < height -1; col++){
    for(int row = 2; row < width -1; row++){
      int finder = row * width + col;
      if( (abs(GArray[(row -1) * width + col] - GArray[(row +1) * width + col]) > threshold)){
        img.pixels[finder] = color(255);
      }
      else{
        img.pixels[finder] = color(0);
      }
      img.updatePixels();
    }
  }
  image(img, 0, 0);
}
