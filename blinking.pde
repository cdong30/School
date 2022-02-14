/*
blinking lights
black spots grow. change to black - grey - white
array of black circles
some start small, some start big

KEYS
space = pause/resume
R = different colors

class arrays of circles
*/

import de.looksgood.ani.*;
int[] circlesArray
int state = 0;

void setup(){
  size(600,  600);
  smooth();
  noStroke();
  Ani.init(this);
}

void draw(){
  background(255);
}

/*
void keyPressed(){
  if(key == ' '){
    if(state == 2){
      circles.pause();
    }
    else{
      circles.resume();
    }
  }
}
*/
