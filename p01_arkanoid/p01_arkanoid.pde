Paddle pad = new Paddle(); // create Paddle
Wall arr = new Wall(16, 6, 50, 50); // create Wall
Ball b; // create ball;
boolean playing; // if game is going
boolean paused;
int lives;
float level;

void setup() {
  size(800, 600); //provisionary size, subject to change
  background(0, 0, 0); // resets background to black
  arr.makeWall(); // populates Wall with Bricks
  b = new Ball(width/2, height -70); // instantiate Ball
  playing = true; // set game going
  paused = false;
  lives = 3;
  level = 0;
}

void draw() {
  background(0, 0, 0);
  pad.display(); // displays paddle
  arr.display(); // displays arr; wall of bricks
  b.display(); //displays ball
  textSize(25);
  fill(255, 255, 255);
  // this text is a little glitchy- it moves to the left the first time Game Over shows up, no idea why (but only once?)
  text("Lives : " + lives, width/16, 25); // shows number of lives on screen
  text("Level " + int(level + 1), width - 100, 25); // shows level on screen

  if (playing) { // if playing true
    pad.moveWithMouse(); // one can move paddle
    b.bouncePaddle(pad); // ball bounces off paddle

    for (int r=0; r<arr.numRows; r++) {
      for (int c=0; c<arr.numCols; c++) {
        b.bounceBrick(arr.grid[r][c]);
      }
    }
    b.updateSpeed(); //keep updating speed when bounces
    if (arr.levelWon()) { // checks if all bricks have been destroyed; level over
      level += 1; 
      arr = new Wall(16, 6, 50, 50);
      arr.makeWall();
      b.xcor = width/2;
      b.ycor = height - 70;
      b.xspeed += level; //make speed 1 faster
      b.yspeed -= level;
    }
    if (!b.inBounds) { // if ball has fallen past paddle
      playing = false;
      lives--; // subtract 1 life
    }
  } else if (paused == true) { // if game paused
    //print("playing is false ");
    textSize(50);
    fill(255, 255, 255);
    textAlign(CENTER);
    text("Game Paused", width/2, height/2);
  } else if (lives != 0) {  // if a life has been lost
    b.xspeed = 4 + level; // reset ball xspeed
    b.yspeed = -4 - level; // reset ball yspeed
    b.xcor = width/2; // reset ball x coordinate
    b.ycor = height - 70; // reset ball y coordinate
    b.inBounds = true; // reset inBounds to true; ball is in bounds
    playing = true;
  } else if (lives == 0) { // if game has been lost
    textSize(128);
    fill(255, 0, 0);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
    textSize(25);
    text("Press r to play again", width/2, height/2 + 50);

    //print(playing);
    //print(lives);
  }
} // draw

void keyPressed() {
  if (keyCode == RIGHT || keyCode == LEFT) { // if left or right key has been pressed
    pad.updateXcor(); // move paddle
  }
  if (key == 'r' || key == 'R') { // if r pressed reset game
    lives = 3; // reset lives to 3
    level = 0; // reset level
    arr = new Wall(16, 6, 50, 50); // new wall
    arr.makeWall(); 
    b = new Ball(width/2, height -70); // new ball
    playing = true; // start game
  }
  if (key == ' ') { // if space pressed pause game
    //print("SPACE has been pressed ");
    if (playing == true) { // if playing
      playing = false; // stop play
      paused = true; // set paused true (for if else in draw)
    } else { // if not playing
      playing = true; // restart play
      paused = false; // set paused false (for if else in draw)
    }
  }
} // keyPressed
