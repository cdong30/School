/*
WORDLE
 
 Done:
 Create a 5 by 6 in the center and have spacing
 
 Current Objective: Map words into squares
 */
int x = 125;
int y = 0;
int srow = 7;
int scol = 7;

void setup() {
  size(800, 800);
  background(50);
  
  for (int row = 0; row < 6; row++) {
    x = int(width/6.5); //to set the x back to the original x coords
    if (row == 0) {
      y += height/11;
    } else {
      y += height/srow ;
    }
    for (int col = 0; col < 5; col++) {
      noStroke();
      rect(x, y, 100, 100);
      x += width/scol;
      println(col, row);
      println(x, y);
    }
  }
  
  /*
  placing a word
  make word uppercase
  given a string, break it up into individual characters via charAt
  put letter into boxes
  */
  fill(0, 0, 0);
  textSize(50);
  text("Y", 237-int(width/10.5), 72+70); 
}

void draw() {
}
