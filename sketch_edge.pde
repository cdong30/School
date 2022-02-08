//edge detection
PImage img;
String choose;
int [] GArray;

void setup(){
  size(800, 800);
  GArray = new int[width * height];
  img = loadImage("house2.jpg");
  img.resize(width, height);
  image(img, 0, 0);
  //loadPixels();
  grayscale();
  //updatePixels();
}

void draw(){
  brc();
  String name = brcChanged();
  //image(choose,0,0);
  if(name.equals("Load")){
    if(brcValue("Files").equals("H")) choose = "house2.jpg";
    if(brcValue("Files").equals("C")) choose = "car-square.jpg";
    if(brcValue("Files").equals("B")) choose = "butterfly-2-square.jpg";
    img = loadImage(choose);
    image(img, 0, 0, width, height);
    grayscale();
    }
}

void grayscale(){
  img.loadPixels();
  for(int i = 0; i < width * height; i++){
    GArray[i] = int(red(img.pixels[i]) 
                  + green(img.pixels[i]) 
                  + blue(img.pixels[i]))/3;
    img.pixels[i] = color(GArray[i]);
    img.updatePixels();
  }
}
