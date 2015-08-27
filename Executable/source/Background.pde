class Background {
  color bColor;
  color pColor;
  Platform p1, p2, p3, p4, p5, p6;

  Background(color bColor, color pColor) {
    this.bColor = bColor;
    this.pColor = pColor;
  }

  void displayB() {
    rectMode(CORNER);
    noStroke();

    //Bottom
    p1 = new Platform(0, 700, 1200, 400, pColor);
    p1.display();
    Platform hole1 = new Platform(300, 700, 150, 40, bColor);
    hole1.displayClear(bColor);

    //Platforms
    p2 = new Platform(990, 575, 100, 30, pColor);
    p2.display();
    p3 = new Platform(880, 485, 100, 30, pColor); 
    p3.display(); 

    //Big Platform
    p4 = new Platform(400, 400, 400, 70, pColor);
    p4.display();
    Platform hole2 = new Platform(520, 400, 150, 40, bColor);
    hole2.displayClear(bColor);

    //Platform
    p5 = new Platform(270, 310, 100, 30, pColor);
    p5.display();

    //Final Platform
    p6 = new Platform(85, 250, 75, 30, pColor);
    p6.display();

    //Spikes
    Spikes spike1 = new Spikes(300, 740, 305, 730, 310, 740, 30);
    spike1.displaySpikes();
    Spikes spike2 = new Spikes(520, 440, 525, 430, 530, 440, 30);
    spike2.displaySpikes();

    //Goal
    fill(0, 200, 0);
    rect(102, 175, 40, 75);
    
    //Dialogue box
    fill(255);
    rect(50, 730, 150, 150);
    fill(0, 0, 200);
    rect(79, 760, 90, 90);
    fill(245);
    rect(240, 750, 937, 125);
  }
}

