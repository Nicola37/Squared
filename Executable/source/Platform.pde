class Platform{
   color pColor;
   int x, y, w, h;
  
  Platform(int x, int y, int w, int h, color pColor){
    this.pColor = pColor;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void display(){
    rectMode(CORNER);
    noStroke();
    
    fill(pColor);
    rect(x, y, w, h);    
  }
  void displayClear(color clear){
    rectMode(CORNER);
    noStroke();
    
    fill(clear);
    rect(x, y, w, h); 
  }
}
