/*
 Nicola Frachesen
 CAP 3032
 Final Project - Iteration 3
 
 In progress...
*/

//Music
//The song "Hane" was taken from the game
//"Umineko no Naku Koro ni" by 7th Expansion.
//The song "Victory Fanfare" was taken from the game
//"Final Fantasy 7" by Square-Enix.
import ddf.minim.*;

//Creating the major class instances.
Square mainSquare = new Square();
Background usualB = new Background();
Movement sMovement = new Movement();
Minim minim;
Audio music = new Audio();
Stages level = new Stages();

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
  music.playHane();
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
    level.mainMenu();
  }
  else if (stage1) {
    level.stage1();
  }
  else if (stage2) {
    level.stage2();
  }
  //A winner is you.
  else if (ending) {
    level.ending();
  }
}

