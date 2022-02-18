/*
images to choose from
 these images will move around with the functions of Ani
 brc for easing
 brc slider for delay
 brc slider for animation time
 brc button for sequence
 keypress for pause/resume
 */

import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

float x = width/2;
float y = height/2;
float delay = 1;
float time =  1;
boolean reversing;
String type;
int state = 0;
//PImage img

void setup() {
  size(800, 800);
  smooth();
  Ani.init(this); //need to put in everytime
}

void draw() {
  background(200);
  noStroke();
  brc();
  String name = brcChanged();
  if (name.equals("Animation Time")) time = float(brcValue("Animation Time"));
  if (name.equals("Delay")) delay = float(brcValue("Delay"))/10;
  if (name.equals("Reverse")) reversing = true;

  if (reversing == true) {
    Ani.from(this, delay, time, "x", mouseX);
    Ani.from(this, delay, time, "y", mouseY);
  }
  if (name.equals("Easing")) {
    if (brcValue("Easing").equals("A")) {
      state = 1;
    }
  }
  circle(x, y, 100);
}

void mouseClicked() {
  if (state == 1) {
    Ani.to(this, time, delay, "x", mouseX, Ani.LINEAR);
    Ani.to(this, time, delay, "y", mouseY, Ani.LINEAR);
    println(x);
  }
}
