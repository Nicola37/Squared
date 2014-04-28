/*
 Nicola Frachesen
 CAP 3032
 Final Project
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
TitleMovie gameplay = new TitleMovie();

//Movie Stuff
Movie movie1, movie2, movie3, movie4, movie9000, movie9001;

//Stages
boolean mainMenu = true;
boolean stage1 = false;
boolean stage2 = false;
boolean stage3 = false;
boolean stage4 = false;
boolean stage5 = false;
boolean finalStage = false;
boolean ending = false;

//endings
float fadeIn1 = 0;
float fadeIn2 = 0;
float fadeIn3 = 0;
boolean badEnd = false;
boolean flag1 = false;
boolean flag2 = false;
boolean flag3 = false;
boolean goodEnd = false;

//Winning image, fading in,etc.
PImage Win;
float fadeIn = 0;
float fadeOut = 255;
float rand = random(9100); //for added fun, set this to 9001
float x;

void setup() {
  size(1200, 900);
  background(237);
  minim = new Minim(this);
  music.playaaf();
  Win = loadImage("Win.jpg");

  imageMode(CENTER);
  movie1 = new Movie(this, "movie1.mov");
  movie2 = new Movie(this, "movie2.mov");
  movie3 = new Movie(this, "movie3.mov");
  movie4 = new Movie(this, "movie4.mov");
  movie9000 = new Movie(this, "movie9000.mp4");
  movie9001 = new Movie(this, "movie9000.mov");
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
  //For testing purposes, you can skip to a certain stage and take screenshots if you uncomment this.
  if (keyCode == '1') {
    stage1 = true;
    stage2 = stage3 = stage4 = stage5 = false;
    mainSquare.returnToStart();
  }
  else if (keyCode == '2') {
    stage2 = true;
    stage1 = stage3 = stage4 = stage5 = false;
    mainSquare.returnToStart();
  }
  else if (keyCode == '3') {
    stage3 = true; 
    stage1 = stage2 = stage4 = stage5 = false;
    mainSquare.returnToStart();
    enemy.returnToStart();
  }
  else if (keyCode == '4') {
    stage4 = true;
    stage1 = stage2 = stage3 = stage5 = false; 
    mainSquare.returnToStart();
  }
  else if (keyCode == '5') {
    stage5 = true;
    stage1 = stage2 = stage3 = stage4 = false; 
    mainSquare.returnToStart();
  }
  else if (keyCode == '0') {
    finalStage = true;
    stage1 = stage2 = stage3 = stage4 = stage5 = false; 
    mainSquare.returnToStart();
  }

  if (mousePressed) {
    saveFrame("movie####.png");
  }

  if (mainMenu) {
    level.mainMenu();
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
  else if (stage5) {
    level.stage5();
  }
  else if (finalStage) {
    level.finalStage();
  }
  //A winner is you.
  else if (ending) {
    level.ending();
  }
}

void movieEvent(Movie m) {
  m.read();
}

