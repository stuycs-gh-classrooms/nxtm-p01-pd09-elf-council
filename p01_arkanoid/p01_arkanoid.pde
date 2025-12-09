Paddle pad = new Paddle();
Wall arr = new Wall(16, 6, 50, 50);

void setup() {
  size(800, 600); //provisionary size, subject to change
  background(0, 0, 0);
  arr.makeWall();
}

void draw() {
  background(0, 0, 0);
  pad.display();
  arr.display();
}

void keyPressed() {
  if (keyCode == RIGHT || keyCode == LEFT) {
    pad.updateXcor();
  }
}
