//edge detection
PImage img;
String choose;
int [] GArray;
int threshold;
int state = 0;

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
    state = 0;
    if (brcValue("Files").equals("H")) choose = "house2.jpg";
    if (brcValue("Files").equals("C")) choose = "car-square.jpg";
    if (brcValue("Files").equals("B")) choose = "butterfly-2-square.jpg";
    img = loadImage(choose);
    img.resize(width, height);
    grayscale();
  }
  if(name.equals("Vert")){
    state = 1;
    //Vertical();
  }
  if(name.equals("Hor")){
    state = 2;
    //Horizontal();
  }
  if(name.equals("Omni")){
    state = 3;
    //Omni();
  }
  if(name.equals("Threshold")){
    threshold = int(brcValue("Threshold"));
  }
  if(state == 1) Vertical();
  if(state == 2) Horizontal();
  if(state == 3) Omni();
  
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

void Omni(){
  img.loadPixels();
  for(int row = 2; row < height -1; ++row){
    for(int col = 2; col < width - 1; ++col){
      int finder = row * width + col;
      if( (abs(GArray[finder -1] - GArray[finder + 1]) > threshold
        || abs(GArray[(row-1) * width + col] - GArray[(row+1) * width + col])  > threshold
        || abs(GArray[(row-1) * width + (col-1)] - GArray[(row+1) * width + (col + 1)]) > threshold
        || abs(GArray[(row+1) * width + (col-1)] - GArray[(row-1) * width + (col + 1)]) > threshold
        //last two absolute statements are for the diagonals
        )){
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
