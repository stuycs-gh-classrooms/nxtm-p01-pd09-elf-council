Paddle pad = new Paddle();
Wall arr = new Wall(16, 6, 50, 50);
Ball b;
boolean playing;

void setup() {
  size(800, 600); //provisionary size, subject to change
  background(0, 0, 0);
  arr.makeWall();
  b = new Ball(width/2, height -70);
}

void draw() {
  background(0, 0, 0);
  pad.moveWithMouse();
  pad.display(); // displays paddle
  arr.display(); // displays arr; wall of bricks
  b.display(); //displays ball
  b.bouncePaddle(pad);
  for (r=0; r<arr.numRows; r++) {
    for (c=0; c<arr.numCols; c++) {
      b.bounceBrick(arr[r][c]);
    }
  }
  b.updateSpeed(); //keep updating speed when bounces
  arr.levelWon(); // checks if all bricks have been destoryed; level over
}

void keyPressed() {
  if (keyCode == RIGHT || keyCode == LEFT) { // if left or right key has been pressed
    pad.updateXcor(); // move paddle
  }
}
