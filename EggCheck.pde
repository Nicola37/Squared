class EggCheck {
  boolean up1, up2, down1, down2, left1, right1, left2, right2, b, a;
  boolean facingLeft = false;
  boolean facingRight = false;

  EggCheck() {
    up1 = false;
    up2 = down1 = down2 = left1 = right1 = left2 = right2 = b = a = false;
  }

  //Check to see if the user has entered the Konami Code 
  void check() {
    if (keyCode == UP && up1 == false) {
      up1 = true;
    }
    else if (keyCode == UP && up1 == true && up2 == false) {
      up2 = true;
    }
    else if (keyCode == DOWN && up2 == true && down1 == false) {
      down1 = true;
    }
    else if (keyCode == DOWN && down1 == true && down2 == false) {
      down2 = true;
    }
    else if (keyCode == LEFT && down2 == true && left1 == false) {
      left1 = true;
    }
    else if (keyCode == RIGHT && left1 == true && right1 == false) {
      right1 = true;
    }
    else if (keyCode == LEFT && right1 == true && left2 == false) {
      left2 = true;
    }
    else if (keyCode == RIGHT && left2 == true && right2 == false) {
      right2 = true;
    }
    else if (keyCode == 'B' && right2 == true && b == false) {
      b = true;
    }
    else if (keyCode == 'A' && b == true && a == false) {
      a = true;
      music.playNyan();
    }
    else if (keyCode!= 0 && keyCode != UP && keyCode != DOWN && keyCode != LEFT && keyCode != RIGHT && keyCode != 'B' && keyCode != 'A' && keyCode != ENTER) {
      up1 = up2 = down1 = down2 = left1 = right1 = left2 = right2 = b = a = false;
    }

    if (a == true) {
      //Play the OVER 9000! video if on the main menu.
      if (mainMenu) {
        if (fadeOut < 255){
          fadeOut = 255;
        }
        rand = 9001;
        up1 = up2 = down1 = down2 = left1 = right1 = left2 = right2 = b = a = false;
      }
      //Activate nyan cat mode if in the main game.
      else {
        imageMode(CENTER);
        //Flipping the image for facing left and right.
        if (keyCode == LEFT) {
          facingLeft = true;
          facingRight = false;
        }
        else if (keyCode == RIGHT) {
          facingRight = true;
          facingLeft = false;
        }
        if (facingLeft == true) {
          pushMatrix();
          scale(-1.0, 1.0);
          image(nyan, -mainSquare.xPos, mainSquare.yPos+2, -100, 59);
          popMatrix();
          if (stage3 || stage6) {
            image(evilnyan, enemy.xPos, enemy.yPos+2, 100, 59);
          }
        }
        else if (facingRight == true) {
          if (stage3 || stage6) {
            pushMatrix();
            scale(-1.0, 1.0);
            image(evilnyan, -enemy.xPos, enemy.yPos+2, -100, 59);
            popMatrix();
          }
          image(nyan, mainSquare.xPos, mainSquare.yPos+2, 100, 59);
        }
      }
    }
  }
}

