Paddle pad = new Paddle();
Brick[][] grid;

void setup() {
  size(800, 600); //provisionary size, subject to change
  background(0, 0, 0);
}

void draw() {
  background(0, 0, 0);
  pad.display();
}

void keyPressed() {
  if (keyCode == RIGHT || keyCode == LEFT) {
    pad.updateXcor();
  }
}

void makeWall() {
  
}
