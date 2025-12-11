Paddle pad = new Paddle();
Wall arr = new Wall(16, 6, 50, 50);
Ball b;
boolean playing;
int lives;

void setup() {
  size(800, 600); //provisionary size, subject to change
  background(0, 0, 0);
  arr.makeWall();
  b = new Ball(width/2, height -70);
  playing = true;
  lives = 3;
}

void draw() {
  background(0, 0, 0);
  pad.display(); // displays paddle
  arr.display(); // displays arr; wall of bricks
  b.display(); //displays ball
  if (playing) {
    pad.moveWithMouse();
    b.bouncePaddle(pad);
    for (int r=0; r<arr.numRows; r++) {
      for (int c=0; c<arr.numCols; c++) {
        b.bounceBrick(arr.grid[r][c]);
      }
    }
    b.updateSpeed(); //keep updating speed when bounces
    arr.levelWon(); // checks if all bricks have been destoryed; level over
    if (!b.inBounds) {
      playing = false;
      lives--;
    }
  } else if (lives != 0) {
    playing = true;
    b.xspeed = 4;
    b.yspeed = -4;
    b.xcor = width/2;
    b.ycor = height - 70;
    b.inBounds = true;
  }
}

void keyPressed() {
  if (keyCode == RIGHT || keyCode == LEFT) { // if left or right key has been pressed
    pad.updateXcor(); // move paddle
  }
}
