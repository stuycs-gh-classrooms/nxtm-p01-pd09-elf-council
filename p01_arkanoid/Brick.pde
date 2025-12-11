class Brick {
  int xcor; // x coordinate
  int ycor; // y coordinate
  int high; // height of brick
  int wid; // width of brick
  boolean hit; // has brick been hit by the ball?
  color c;

  Brick(int x, int y, int hSide, int vSide, color r) {
    // all values provided in Wall class
    xcor = x;
    ycor = y;
    high = vSide;
    wid = hSide;
    hit = false;
    c = r;
  }

  void display() {
    fill(c);
    rect(xcor, ycor, wid, high);
  }
/**
just commenting this out so we can test the other one
  boolean contact(Ball b) {
    if ((b.xcor + b.size/2) >= xcor && (b.xcor - b.size/2) <= (xcor + wid)) { // if ball in contact with sides of brick
      if ((b.ycor + b.size/2) <= ycor && (b.ycor - b.size/2) >= (ycor + high)) { // if ball in contact with top or bottom of brick
        hit = true; // brick is hit
        return true;
      }
    }
    return false;
  }
**/
boolean contact(Ball b) {
   if ((b.xcor + b.size/2 >= xcor) &&
       (b.xcor - b.size/2 <= xcor + wid) &&
       (b.ycor + b.size/2 >= ycor) &&
       (b.ycor - b.size/2 <= ycor + high) &&
       !hit) {
     hit = true;
     return true;
   }
   return false;
}

  //  void test() {
  //    print("briiiiick");
  //  }
} // Brick
