class Brick {
  int xcor; // x coordinate
  int ycor; // y coordinate
  int high; // height of brick
  int wid; // width of brick
  boolean hit; // has brick been hit by the ball?
  color c; // color of brick

  Brick(int x, int y, int hSide, int vSide, color r) {
    // all values provided in Wall class
    xcor = x;
    ycor = y;
    high = vSide;
    wid = hSide;
    hit = false;
    c = r;
  } // brick

  void display() {
    fill(c);
    rect(xcor, ycor, wid, high);
  } // display

  boolean contact(Ball b) {
    if ((b.xcor + b.size/2 >= xcor) && // if ball hits right side of brick
      (b.xcor - b.size/2 <= xcor + wid) && // or left side of brick
      (b.ycor + b.size/2 >= ycor) && // or top of brick
      (b.ycor - b.size/2 <= ycor + high) && // or bottom of brick
      !hit) {
      hit = true; // hit is true
      return true;
    }
    return false;
  } // contact

  //  void test() {
  //    print("briiiiick");
  //  }
} // Brick
