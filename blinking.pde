/*
blinking lights
 black spots grow. change to black white
 array of black circles
 some start small, some start big
 
 KEYS
 space = pause/resume
 R = different colors
 
 class arrays of circles
 */

import de.looksgood.ani.*;
circles[][] circlesArray;
int state = 0;
// test values
float x;
float y;
float smradius = 10;
float bigradius = 100;
int counter;
float choice_radius;
color choice_color;

void setup() {
  size(600, 600);
  background(200);
  smooth();
  noStroke();
  Ani.init(this);
  circlesArray = new circles[7][8];
}

void draw() {
  for (int row = 0; row < 6; row++) {
    x = 50;
    y = row*height/7 + 70;
    for (int col = 0; col < 7; col++) {
      x = col*width/7 + 45;
      counter += 1;
      if (counter % 2 == 1) {
        choice_radius = smradius;
        choice_color = 0;
      } else {
        choice_radius = bigradius;
        choice_color = 255;
      }
      circlesArray[row][col] = new circles(x, y, choice_radius, choice_color);
      circlesArray[row][col].display();
      //circlesArray[row][col].bang();
    }
  }
}

  /*
void keyPressed(){
   if(key == ' '){
   */
