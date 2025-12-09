class Brick {
  int xcor;
  int ycor;
  int high;
  int wid;
  boolean hit;
  
  Brick(int x, int y, int hSide, int vSide) {
    xcor = x;
    ycor = y;
    high = vSide;
    wid = hSide;
  }
  
  void display() {
    rect(xcor, ycor, wid, high);
  }
  
  boolean contact(Ball b) {
    if (b.xcor >= xcor && b.xcor <= (xcor + wid)) {
      if (b.ycor >= ycor && b.ycor <= (ycor + high)) {
        
      }
    }
    
  }
  
//  void test() {
//    print("briiiiick");
//  }
} // Brick
