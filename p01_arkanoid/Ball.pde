class Ball {
  //ATTRIBUTES
  float xcor;
  float ycor;
  int size;
  float xspeed;
  float yspeed;
  boolean inBounds;

  //CONSTRUCTOR
  Ball() { //values subject to change
    size = 20;
    xcor = width/2;
    ycor = height - 80;
    xspeed = 4;
    yspeed = -4;
    inBounds = true;
  }//default constructor


  //METHODS
  void display() {
    circle(xcor, ycor, size);
  }

  void updateSpeed() {
    xcor += xspeed;
    ycor += yspeed;

    if (xcor <= size/2 || xcor >= width - size/2) {
      xspeed *= -1;
    }//bounce off left & right walls
    if (ycor <= size/2) {
      yspeed *= -1;
    }//bounce off top

    if (ycor >= height) {
      inBounds = false; //will code losing life elsewhere
    }
  }

  void bouncePaddle(Paddle p) {
    if (ycor + size/2 >= height - 50 &&
      xcor >= p.xcor &&
      xcor <= p.xcor + p.len &&
      yspeed > 0) {

      yspeed *= -1;

      float center = p.xcor + p.len/2;
      
      //change xspeed based on where it hits paddle
      if (xcor < center - p.len/4) {
        xspeed = -5;  // far left
      } else if (xcor > center + p.len/4) {
        xspeed = 5;   // far right
      } else {
        xspeed = (xcor < center ? -3 : 3); // near center
      }
    }
  }
}
