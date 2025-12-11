class Paddle {
  int xcor; // x coordiate of upper left corner of paddle
  int len; // length of paddle
  int dist; // distance paddle can move in one frame (lower = more control, higher = faster)

  Paddle() {
    // provisionary values, all subject to change
    xcor = width/2; 
    len = 150; 
    dist = 20;
  }

  void updateXcor() {
    if (keyCode == RIGHT) { // if right key pressed
      if ((xcor + len + dist) <= width) { // and paddle not about to go off screen
        xcor = xcor + dist; // go right by dist
      }
    }
    if (keyCode == LEFT) { // if left key pressed
      if (xcor >= dist) { // and paddle not about to go off screen
        xcor = xcor - dist; // go left by dist
      }
    }
  } // updateXcor

  void moveWithMouse() {
    // keep paddle centered on mouse
    xcor = mouseX - len/2;

    // prevent going off-screen
    if (xcor < 0) xcor = 0;
    if (xcor + len > width) xcor = width - len;
  }

  void display() {
    fill(255);
    rect(xcor, height - 50, len, 10);
  }
} // Paddle
