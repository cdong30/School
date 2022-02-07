//edge detection
PImage img;
String choose = "house2.jpg";
int [] george;

void setup(){
  size(700, 600);
  george = new int[width * height];
  img = loadImage(choose);
  img.resize(width, height);
  image(img, 0, 0);
  grayscale();
  //img.loadPixels();
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
  }
}

void grayscale(){
  img.loadPixels();
  for(int i = 0; i < width * height; i++){
    george[i] = int(red(img.pixels[i]) 
                  + green(img.pixels[i]) 
                  + blue(img.pixels[i]) /3);
    img.pixels[i] = color(george[i]);
    img.updatePixels();
  }
}
