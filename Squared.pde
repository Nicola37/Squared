/*
 Nicola Frachesen
 CAP 3032
 Final Project - Iteration 2
 
As requested in the guidelines, I have created an experience that is
much more whole than before. I have made a basic start menu, 2 complete
levels, and a “You Win!” screen (from which you can return to the menu).
Collisions all work very well (with two points, one on each side of the
square's bottom), and the movement of the square now feels far more natural
with my implementation of gravity. Placeholder music and basic instructions
have also been included.
 */

//Music
//The song "Hane" was taken from the game
//"Umineko no Naku Koro ni" by 7th Expansion.
//The song "Victory Fanfare" was taken from the game
//"Final Fantasy 7" by Square-Enix.
import ddf.minim.*;
Minim minim;
AudioPlayer song;

//Creating the major class instances.
Square mainSquare = new Square();
Background usualB = new Background();
Movement sMovement = new Movement();

//Stages
boolean mainMenu = true;
boolean stage1 = false;
boolean stage2 = false;
boolean ending = false;

//Winning image, fading in.
PImage Win;
float fadeIn = 0;

void setup() {
  size(1200, 900);
  background(237);
  minim = new Minim(this);
  song = minim.loadFile("Hane.mp3");
  song.play();
  song.loop();
  Win = loadImage("Win.jpg");
}

void keyPressed() {
  sMovement.pressKey(key, keyCode);
  mainSquare.collided = false;
}
void keyReleased() {
  sMovement.releaseKey(key, keyCode);
  mainSquare.collided = false;
}

void draw() {
  //For testing purposes, you can skip to Stage 2 by clicking the mouse
  //if you uncomment this.
  //if (mousePressed) {
    //stage1 = false;
    //stage2 = true;
  //}
  if (mainMenu) {
    background(255);

    if (fadeIn < 255) {
      fadeIn += 1.3;
    }
    rectMode(CENTER);
    noStroke();
    fill(0, 0, 200, fadeIn);
    rect(width/2, height/2-150, 350, 350);

    fill(0);
    textSize(30);
    textAlign(CENTER);
    text("Press any key to begin.", width/2, height/2+200);
    text("2", 800, 130);
    if (keyPressed) {
      mainMenu = false;
      stage1 = true;
    }
  }
  //The objective of stage 1 is to get to the goal.
  else if (stage1) {
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
  //The objective of stage 2 is to find where you are the same color as 
  //the background. (Which is high above the second spike pit.)
  else if (stage2) {
    float redness = map(mainSquare.yPos, 0, 1200, 0, 255);
    float blueness = map(mainSquare.xPos, 0, 900, 0, 255)+50;
    float greenness = map(mainSquare.xPos/mainSquare.yPos, 0, 1200, 0, 255)+20;
    background(redness, greenness, blueness);
    Background changeB = new Background(color(redness, greenness, blueness));
    changeB.displayB();
    mainSquare.displayS();

    fill(255);
    textSize(30);
    text("Blend in with the background. Be one with your inner chameleon...", width/2, height/2+360);

    if (redness >= 0 && redness <= 25 && blueness >= 180 && blueness <= 220) {
      song.pause();
      song = minim.loadFile("Victory Fanfare.mp3");
      song.play();
      song.loop();
      ending = true;
      stage2 = false;
    }
  }
  //A winner is you.
  else if (ending) {
    image(Win, 0, 0, Win.width*3, Win.height*2.5);

    fill(0);
    text("Press 'R' to do it all again.", width/2, height/2+410);
    if (keyCode == 'R') {
      song.pause();
      song = minim.loadFile("Hane.mp3");
      song.play();
      song.loop();
      mainSquare.returnToStart();
      ending = false;
      mainMenu = true;
      fadeIn = 0;
    }
  }
}

