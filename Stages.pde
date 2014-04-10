class Stages {

  void mainMenu() {
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
    text("Press enter to begin.", width/2, height/2+200);
    if (rand > 9000) {
      text("9000", 800, 110);
    }
    else {
      text("2", 800, 110);
    }

    //Please pardon the long, not so pretty movie code.
    //If for some reason things do not run, comment out the movie code.
    //It's still being kind of odd when its power level is too high.
    gameplay.playRandom();

    if (keyCode == ENTER) {
      mainMenu = false;
      stage1 = true;
      music.playJam();
    }
  }

  void stage1() {
    background(237);
    usualB.displayB();
    mainSquare.displayS();

    textAlign(LEFT);
    fill(0);
    textSize(20);
    text("Hello, dear player. I am but a humble square. Being such a simple shape,", width/2-350, height/2+330);
    text("my job is easy. I just have to go through this uninteresting level over and over.", width/2-350, height/2+370);
    text("I like to imagine that I move thanks to arrows made of keys... Ha, like that's actually a thing.", width/2-350, height/2+410);

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

    fill(0);
    textSize(20);
    text("Oh? You thought I did the EXACT same thing each time? Pfft, that'd be boring.", width/2-350, height/2+330);
    text("Sometimes, it can be fun to blend in with the scenery,", width/2-350, height/2+370);
    text("which isn't too hard to do when you're just one color...", width/2-350, height/2+410);

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

    fill(map(abs(sin(x)), 0, 1, 30, 230), 0, 0);
    rectMode(CORNER);
    rect(79, 760, 90, 90);
    fill(0);
    textSize(35);
    text("I AM YOU MORTAL ENEMY!", width/2-350, height/2+340);
    text("MWAHAHAHAHAHA!!", width/2-350, height/2+395);
    fill(15);
    rect(800, 700, 5, 500);
    fill(0, 0, 200);
    rect(970, 760, 30, 30);
    fill(0);
    textSize(15);
    text("Wow, even my mortal enemy is cliché.", 860, 820);
    text("Well, at least he glows. That's kinda cool, I guess.", 810, 835);


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

    fill(0);
    textSize(20);
    text("So... is my eyesight getting worse, or is the floor invisible?", width/2-350, height/2+330);
    fill(usualB.pColor);
    text("Ohhhh, I get it now.", width/2-350, height/2+370);

    if (mainSquare.goalReached()) {
      usualB.pColor = color(15, 255);
      stage4 = false;
      ending = true;
      music.playGarcon();
      mainSquare.returnToStart();
    }
  }

  void ending() {
    imageMode(CORNER);
    image(Win, 0, 0, Win.width*3, Win.height*2.5);

    textAlign(CENTER);
    fill(0);
    textSize(30);
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

