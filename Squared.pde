/*
 Nicola Frachesen
 CAP 3032
 Final Project - Iteration 3
 
 In progress...
 */

//Music taken from the Free Music Archive.
import ddf.minim.*;
import processing.video.*;

//Creating the major class instances.
Square mainSquare = new Square();
Square enemy = new Square(50, color(200, 0, 0), 1100, 670);
Background usualB = new Background(237, color(15, 255));
Movement sMovement = new Movement();
Minim minim;
Audio music = new Audio();
Stages level = new Stages();

//Movie Stuff
Movie movie1;

//Stages
boolean mainMenu = true;
boolean stage1 = false;
boolean stage2 = false;
boolean stage3 = false;
boolean stage4 = false;
boolean ending = false;

//Winning image, fading in,etc.
PImage Win;
float fadeIn = 0;
float x;

void setup() {
  size(1200, 900);
  background(237);
  minim = new Minim(this);
  music.playaaf();
  Win = loadImage("Win.jpg");

  imageMode(CENTER);
  movie1 = new Movie(this, "movie1.mov");
  movie1.play();
}

void keyPressed() {
  sMovement.pressKey(key, keyCode);
  mainSquare.collided = false;
  enemy.collided = false;
}
void keyReleased() {
  sMovement.releaseKey(key, keyCode);
  mainSquare.collided = false;
  enemy.collided = false;
}

void draw() {
  //For testing purposes, you can skip to a certain stage if you uncomment this.
  /*if (keyCode == '1') {
   stage1 = true;
   stage2 = stage3 = stage4 = false;
   mainSquare.returnToStart();
   }
   else if (keyCode == '2') {
   stage2 = true;
   stage1 = stage3 = stage4 = false;
   mainSquare.returnToStart();
   }
   else if (keyCode == '3') {
   stage3 = true; 
   stage1 = stage2 = stage4 = false;
   mainSquare.returnToStart();
   enemy.returnToStart();
   }
   else if (keyCode == '4') {
   stage4 = true;
   stage1 = stage2 = stage3 = false; 
   mainSquare.returnToStart();
   }*/

  if (mousePressed) {
    saveFrame("movie1####.png");
  }

  if (mainMenu) {
    level.mainMenu();
    movie1.play();
    image(movie1, 0, 0, 500, 350);
  }
  else if (stage1) {
    level.stage1();
  }
  else if (stage2) {
    level.stage2();
  }
  else if (stage3) {
    level.stage3();
  }
  else if (stage4) {
    level.stage4();
  }
  //A winner is you.
  else if (ending) {
    level.ending();
  }
}

