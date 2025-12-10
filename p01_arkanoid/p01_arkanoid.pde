Paddle pad = new Paddle();
Wall arr = new Wall(16, 6, 50, 50);
boolean playing;

void setup() {
  size(800, 600); //provisionary size, subject to change
  background(0, 0, 0);
  arr.makeWall();
}

void draw() {
  background(0, 0, 0);
  pad.display(); // displays paddle
  arr.display(); // displays arr; wall of bricks
  arr.levelWon(); // checks if all bricks have been destoryed; level over
}

void keyPressed() {
  if (keyCode == RIGHT || keyCode == LEFT) { // if left or right key has been pressed
    pad.updateXcor(); // move paddle
  }
}

void mouseMoved() {
  pad.updateXcor();
}
