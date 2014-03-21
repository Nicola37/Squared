class Square {
  int s;
  color sColor;
  float xPos = 100;
  float yPos = 670;
  float footx1 = xPos - s/2;
  float footy1 = yPos + s/2;
  float footx2 = xPos + s/2;
  float footy2 = yPos + s/2;
  double speedx = 3.37;
  double speedy = 0;
  boolean collided = false;

  Square() {
    s = 50;
    sColor = color(0, 0, 200);
  }
  Square(int s, color sColor) {
    this.s = s;
    this.sColor = sColor;
  }

  void displayS() {
    //Gravity
    if (!collided) {
      gravity();
    }

    //Moving the Square
    if (sMovement.right) {
      xPos += speedx;
    }
    if (sMovement.left) {
      xPos -= speedx;
    }
    if (sMovement.up && collided) {
      speedy -= 10;
      yPos += speedy;
      collided = false;
    }

    //Sends you back to the start if you touch spikes.
    if (yPos > 700 || ((xPos > 520) && (xPos < 770) && (yPos > 400) && (yPos < 440))) {
      xPos = 100;
      yPos = 670;
    }

    //Collision points.
    footx1 = xPos - s/2;
    footy1 = yPos + s/2;
    footx2 = xPos + s/2;
    footy2 = yPos + s/2;

    //Checking for each platform.
    collision(usualB.p1);
    collision(usualB.p2);
    collision(usualB.p3);
    collision(usualB.p4);
    collision(usualB.p5);
    collision(usualB.p6);

    //Making the actual square.
    rectMode(CENTER);
    fill(sColor);
    rect(xPos, yPos, s, s);
    
    //Uncomment to see collision detection points.
    //fill(0, 255, 0);
    //ellipse(footx1, footy1, 5, 5);
    //ellipse(footx2, footy2, 5, 5);
  }

  void gravity() {
    speedy += 0.3;
    yPos += speedy;
    speedy = constrain((float)speedy, -1000, 7);
  }

  void collision(Platform p) {
    //Exceptions for falling into pits.
    if (footy1 > 600 && footx1 > 300 && footx1 < 450 && footx2 > 300 && footx2 < 450) {
      collided = false;
    }
    else if (footy1 < 500 && footx1 > 520 && footx1 < 670 && footx2 > 520 && footx2 < 670) {
      collided = false;
    }
    //Handles platform collision. Thank you to Joseph Murphy for the help.
    else if (speedy > 0) {
      if ((footx1 > p.x && footx1 < (p.x + p.w)) || (footx2 > p.x && footx2 < (p.x + p.w))) {
        if ((footy1 > p.y && footy1 < p.y+(p.h/2)) || (footy2 > p.y && footy2 < p.y+(p.h/2))) {
          collided = true;
          yPos = p.y-s/2;
          speedy = 0;
        }
      }
    }
  }

  //Have you reached the goal?
  boolean goalReached() {
    if (xPos > 100 && xPos < 142 && yPos < 300) {
      return true;
    }
    else {
      return false;
    }
  }
  
  //Send you back to the spawn point.
  void returnToStart() {
    xPos = 100;
    yPos = 670;
  }
}

