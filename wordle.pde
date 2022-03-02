/*
WORDLE
 
 Done:
 Create a 5 by 6 in the center and have spacing
 
 Current Objective: Map words into squares
 */
float x = 125;
float y = 0;
int lessrow = 7;
int lesscol = 7;

void setup() {
  size(800, 800);
  background(50);
  for (int row = 0; row < 6; row++) {
    x = 125; //to set the x back to the original x coords
    if (row == 0) {
      y += 75;
    } else {
      y += height/lessrow ;
    }
    for (int col = 0; col < 5; col++) {
      noStroke();
      rect(x, y, 100, 100);
      x += width/lesscol;
      println(x, y);
    }
  }
}

void draw() {
}
