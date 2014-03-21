class Movement {
//Thanks to Chris DeLeon's Processing Platformer Tutorial
//for showing me how to better do this.
  boolean up, down, right, left;
  Movement(){
    up = down = right = left = false;
  }
  void pressKey(int key,int keyCode) {
    if (keyCode == UP) {
      up = true;
    }
    if (keyCode == LEFT) {
      left = true;
    }
    if (keyCode == RIGHT) {
      right = true;
    }
  }
  void releaseKey(int key,int keyCode) {
    if (keyCode == UP) {
      up = false;
    }
    if (keyCode == LEFT) {
      left = false;
    }
    if (keyCode == RIGHT) {
      right = false;
    }
  }
}
