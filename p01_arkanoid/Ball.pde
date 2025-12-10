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
  
void bounceBrick(Brick b) {
  if (!b.hit && b.contact(this)) {

    // Determine how far the ball overlaps on each side
    float ballLeft   = xcor - size/2;
    float ballRight  = xcor + size/2;
    float ballTop    = ycor - size/2;
    float ballBottom = ycor + size/2;

    float brickLeft   = b.xcor;
    float brickRight  = b.xcor + b.wid;
    float brickTop    = b.ycor;
    float brickBottom = b.ycor + b.high;

    // distances into each side
    float overlapLeft   = ballRight - brickLeft;
    float overlapRight  = brickRight - ballLeft;
    float overlapTop    = ballBottom - brickTop;
    float overlapBottom = brickBottom - ballTop;

    // Smallest overlap = collision side
    float minOverlap = min(min(overlapLeft, overlapRight),
                           min(overlapTop, overlapBottom));

    if (minOverlap == overlapLeft) {
      // Ball hit brick's left side so it bounces left
      xspeed = abs(xspeed) * -1;
    } 
    else if (minOverlap == overlapRight) {
      // Ball hit brick's right side -- bounces right
      xspeed = abs(xspeed);
    } 
    else if (minOverlap == overlapTop) {
      // Ball hit top of brick -- bounce up
      yspeed = -abs(yspeed);
    } 
    else {
      // Ball hit bottom of brick -- bounce down
      yspeed = abs(yspeed);
    }
  }
}
}
