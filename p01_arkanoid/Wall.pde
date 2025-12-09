class Wall {
  int numRows;
  int numCols;
  int wid;
  int high;
  Brick[][] grid;

  Wall(int numX, int numY, int hSide, int vSide) {
    numCols = numX;
    numRows = numY;
    wid = hSide;
    high = vSide;
    grid = new Brick[numRows][numCols];
  }

  void makeWall() {
    for (int i = 0; i < numRows; i ++) {
      for (int n = 0; n < numCols; n ++) {
        grid[i][n] = new Brick(n*wid, 100 + i*high, wid, high);
      }
    }
  } // makeWall

  void display() {
    for (int i = 0; i < numRows; i ++) {
      //print(i);
      for (int n = 0; n < numCols; n ++) {
        //print(n);
        grid[i][n].display();
        //grid[i][n].test();
      }
    }
  }
} // Wall
