class Wall {
  int numRows; // number of rows
  int numCols; // number of colums (indexes in each row array)
  int wid; // width of each brick
  int high; // height of each brick
  Brick[][] grid;

  Wall(int numX, int numY, int hSide, int vSide) {
    numCols = numX;
    numRows = numY;
    wid = hSide;
    high = vSide;
    grid = new Brick[numRows][numCols];
  }

  void makeWall() {
    color[] rainbow = new color[6];
    rainbow[0] = #e60000;
    rainbow[1] = #ff7b00;
    rainbow[2] = #ffff00;
    rainbow[3] = #00c131;
    rainbow[4] = #5bbce4;
    rainbow[5] = #9b00ce;

    for (int i = 0; i < numRows; i ++) { // each row
      for (int n = 0; n < numCols; n ++) { // each index in each row (column)
        grid[i][n] = new Brick(n*wid, 100 + i*high, wid, high); // make Brick at that index
      }
    }
  } // makeWall

  void display() {
    for (int i = 0; i < numRows; i ++) { // for each row
      //print(i);
      for (int n = 0; n < numCols; n ++) { // each index (column) in that row
        //print(n);
        if (grid[i][n].hit == false) { // if brick has not been hit
          grid[i][n].display(); // display brick
        }
        //grid[i][n].test();
      }
    }
  }

  boolean levelWon() {
    for (int i = 0; i < numRows; i ++) { // each row
      for (int n = 0; n < numCols; n ++) { // each index (column) in each row
        if (grid[i][n].hit == false) { // if any brick has not been hit
          return false; // the level isn't over
        }
      }
    }
    return true; // else every brick is hit; level over
  } // levelWon
} // Wall
