Paddle pad = new Paddle();
Wall arr = new Wall(16, 6, 50, 50);
Ball b;
boolean playing;
int lives;
float level;

void setup() {
  size(800, 600); //provisionary size, subject to change
  background(0, 0, 0);
  arr.makeWall();
  b = new Ball(width/2, height -70);
  playing = true;
  lives = 3;
  level = 1;
}

void draw() {
  background(0, 0, 0);
  pad.display(); // displays paddle
  arr.display(); // displays arr; wall of bricks
  b.display(); //displays ball
  textSize(25);
  fill(255, 255, 255);
  text("Lives : " + lives, width/16, 25);
  text("Level " + int(((level - 1)/0.5 + 1)), width - 100, 25);
  if (playing) {
    pad.moveWithMouse();
    b.bouncePaddle(pad);
    b.xspeed *= level;
    for (int r=0; r<arr.numRows; r++) {
      for (int c=0; c<arr.numCols; c++) {
        b.bounceBrick(arr.grid[r][c]);
      }
    }
    b.updateSpeed(); //keep updating speed when bounces
    if (arr.levelWon()) { // checks if all bricks have been destroyed; level over
      level += 0.5;
      arr = new Wall(16, 6, 50, 50);
      arr.makeWall();
      b = new Ball(width/2, height -70);
    }
    if (!b.inBounds) {
      playing = false;
      lives--;
    }
  } else if (lives != 0) {
    playing = true;
    b.xspeed = 4 * level;
    b.yspeed = -4 * level;
    b.xcor = width/2;
    b.ycor = height - 70;
    b.inBounds = true;
  } else if (key == ' ') {
  } else {
    textSize(128);
    fill(255, 0, 0);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
    textSize(25);
    text("Press r to play again", width/2, height/2 + 50);

    //print(playing);
    //print(lives);
  }
}

void keyPressed() {
  if (keyCode == RIGHT || keyCode == LEFT) { // if left or right key has been pressed
    pad.updateXcor(); // move paddle
  }
  if (key == 'r' || key == 'R') {
    lives = 3;
    arr = new Wall(16, 6, 50, 50);
    arr.makeWall();
    b = new Ball(width/2, height -70);
    playing = true;
  }
}
