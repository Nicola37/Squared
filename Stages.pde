class Stages {
  
  void mainMenu() {
    println(rand);
    imageMode(CENTER);
    
    background(255);

    if (fadeIn < 255) {
      fadeIn += 1.5;
    }   

    rectMode(CENTER);
    noStroke();
    fill(0, 0, 200, fadeIn);
    rect(width/2, height/2-150, 350, 350);

    fill(0);
    textSize(30);
    textAlign(CENTER);
    text("Press any key to begin.", width/2, height/2+200);
    if (rand > 9000){
      text("9000", 800, 110);
    }
    else{
      text("2", 800, 110);
    }

    //Please pardon the long, not so pretty movie code.
    //If for some reason things do not run, comment out the movie code.
    //It's still being kind of odd when its power level is too high.
    if (rand <= 3000) {
      if (fadeIn >= 250 && fadeOut == 255) {
        noTint();
        movie1.play();
        image(movie1, width/2, height/2 - 150);
      }

      if (movie1.time() % movie1.duration() == 0) {
        tint(255, fadeOut);
        image(movie1, width/2, height/2 - 150);
        fadeOut -= 0.9;
      }

      if (fadeOut <= 0) {
        movie1.stop();
        fadeOut = 255;
        rand = random(9037);
      }
    }
    else if (rand > 3000 && rand <= 6000) {
      if (fadeIn >= 250 && fadeOut == 255) {
        noTint();
        movie2.play();
        image(movie2, width/2, height/2 - 150);
      }

      if (movie2.time() % movie2.duration() == 0) {
        tint(255, fadeOut);
        image(movie2, width/2, height/2 - 150);
        fadeOut -= 0.9;
      }

      if (fadeOut <= 0) {
        movie2.stop();
        fadeOut = 255;
        rand = random(9037);
      }
    }
    else if (rand > 6000 && rand <= 9000) {
      if (fadeIn >= 250 && fadeOut == 255) {
        noTint();
        movie3.play();
        image(movie3, width/2, height/2 - 150);
      }

      if (movie3.time() >= movie3.duration()) {
        tint(255, fadeOut);
        image(movie3, width/2, height/2 - 150);
        fadeOut -= 0.9;
      }

      if (fadeOut <= 0) {
        movie3.stop();
        fadeOut = 255;
        rand = random(9037);
      }
    }
    else if (rand > 9000) {
      music.pause();
      if (fadeIn >= 250 && fadeOut == 255) {
        noTint();
        movie9000.play();
        movie9001.play();
        image(movie9000, width/2, height/2 - 150, 500, 350);
      }

      if (movie9001.time() >= movie9001.duration()) {
        tint(255, fadeOut);
        image(movie9001, width/2, height/2 - 150, 500, 350);
        fadeOut -= 0.9;
      }

      if (fadeOut <= 0) {
        movie9000.stop();
        movie9001.stop();
        fadeOut = 255;
        rand = random(9037);
        music.cont();
      }
    }

    if (keyPressed) {
      mainMenu = false;
      stage1 = true;
      music.playJam();
    }
  }

  void stage1() {
    background(237);
    usualB.displayB();
    mainSquare.displayS();
    fill(255);

    textSize(30);
    text("Witty dialogue not yet available. Please try again later.", width/2, height/2+350);
    textSize(20);
    text("Getting to the goal would be a good idea, though. You do have those pretty arrow keys, after all.", width/2, height/2+380);

    if (mainSquare.goalReached()) {
      stage1 = false;
      stage2 = true;
      mainSquare.returnToStart();
    }
  }

  void stage2() {
    float redness = map(mainSquare.yPos, 0, 1200, 0, 255);
    float blueness = map(mainSquare.xPos, 0, 900, 0, 255)+50;
    float greenness = map(mainSquare.xPos/mainSquare.yPos, 0, 1200, 0, 255)+20;
    background(redness, greenness, blueness);
    Background stage2B = new Background(color(redness, greenness, blueness), color(15, 15, 15));
    stage2B.displayB();
    mainSquare.displayS();

    fill(255);
    textSize(30);
    text("Blend in with the background. Be one with your inner chameleon...", width/2, height/2+360);

    if (redness >= 0 && redness <= 25 && blueness >= 180 && blueness <= 220) {
      mainSquare.returnToStart();
      stage3 = true;
      stage2 = false;
    }
  }

  void stage3() {
    background(237);
    enemy.sColor = color(map(abs(sin(x)), 0, 1, 30, 230), 0, 0);
    x+=0.02;
    usualB.displayB();
    mainSquare.displayS();
    enemy.displayS();
    if (mainSquare.xPos > (enemy.xPos - enemy.s) && mainSquare.xPos < (enemy.xPos + enemy.s) &&
      mainSquare.yPos > (enemy.yPos - enemy.s) && mainSquare.yPos < (enemy.yPos + enemy.s)) {
      mainSquare.returnToStart();
      enemy.returnToStart();
    }
    if (mainSquare.died) {
      enemy.returnToStart();
    }
    if (mainSquare.goalReached()) {
      stage3 = false;
      stage4 = true;
      mainSquare.returnToStart();
      enemy.returnToStart();
    }
  }

  void stage4() {
    background(237);
    usualB.displayB();
    mainSquare.displayS();
    if (mainSquare.xPos <= 700) {
      usualB.pColor = color(15, int(map(mainSquare.xPos, 475, 700, 0, 255)));
    }
    else if (mainSquare.xPos > 700) {
      usualB.pColor = color(15, int(map(mainSquare.xPos, 700, 950, 255, 0)));
    }
    if (mainSquare.goalReached()) {
      stage4 = false;
      ending = true;
      music.playGarcon();
      mainSquare.returnToStart();
    }
  }

  void ending() {
    imageMode(CORNER);
    image(Win, 0, 0, Win.width*3, Win.height*2.5);

    fill(0);
    text("Press 'R' to do it all again.", width/2, height/2+410);
    if (keyCode == 'R') {
      music.playaaf();
      mainSquare.returnToStart();
      ending = false;
      mainMenu = true;
      fadeIn = 0;
    }
  }
}

