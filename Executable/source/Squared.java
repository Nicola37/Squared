import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import processing.video.*; 
import ddf.minim.*; 
import processing.video.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Squared extends PApplet {

/*
 Nicola Frachesen
 CAP 3032
 Final Project
*/

//Music taken from the Free Music Archive.



//Creating the major class instances.
Square mainSquare = new Square();
Square enemy = new Square(50, color(200, 0, 0), 1100, 670);
Background usualB = new Background(237, color(15, 255));
Movement sMovement = new Movement();
Minim minim;
Audio music = new Audio();
Stages level = new Stages();
TitleMovie gameplay = new TitleMovie();
EggCheck easter = new EggCheck();

//Movie Stuff
Movie movie1, movie2, movie3, movie4, movie9000, movie9001;

//Stages
boolean mainMenu = true;
boolean stage1 = false;
boolean stage2 = false;
boolean stage3 = false;
boolean stage4 = false;
boolean stage5 = false;
boolean stage6 = false;
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
float v1 = 0;
float v2 = 0;
float v3 = 0;

//Winning image, fading in,etc.
PImage Win;
PImage nyan;
PImage evilnyan;
float fadeIn = 0;
float fadeOut = 255;
float rand = random(9037);
float x;
boolean switches = false;

public void setup() {
  size(1200, 900);
  background(237);
  minim = new Minim(this);
  music.playaaf();
  Win = loadImage("Win.jpg");
  nyan = loadImage("nyan.png");
  evilnyan = loadImage("evilnyan.png");

  imageMode(CENTER);
  movie1 = new Movie(this, "movie1.mov");
  movie2 = new Movie(this, "movie2.mov");
  movie3 = new Movie(this, "movie3.mov");
  movie4 = new Movie(this, "movie4.mov");
  movie9000 = new Movie(this, "movie9000.mp4");
  movie9001 = new Movie(this, "movie9000.mov");
}


public void keyPressed() {
  sMovement.pressKey(key, keyCode);
  mainSquare.collided = false;
  enemy.collided = false;
}
public void keyReleased() {
  sMovement.releaseKey(key, keyCode);
  mainSquare.collided = false;
  enemy.collided = false;
}

public void draw() {
  //For testing purposes, you can skip to a certain stage, take screenshots, and see coordinates if you uncomment this.
  //Can mess up user gameplay, please only use for testing.
  /*if (keyCode == '1') {
    stage1 = true;
    stage2 = stage3 = stage4 = stage5 = stage6 = false;
    mainSquare.returnToStart();
  }
  else if (keyCode == '2') {
    stage2 = true;
    stage1 = stage3 = stage4 = stage5 = stage6 = false;
    mainSquare.returnToStart();
  }
  else if (keyCode == '3') {
    stage3 = true; 
    stage1 = stage2 = stage4 = stage5 = stage6 = false;
    mainSquare.returnToStart();
    enemy.returnToStart();
  }
  else if (keyCode == '4') {
    stage4 = true;
    stage1 = stage2 = stage3 = stage5 = stage6 = false; 
    mainSquare.returnToStart();
  }
  else if (keyCode == '5') {
    stage5 = true;
    stage1 = stage2 = stage3 = stage4 = stage6 = false; 
    mainSquare.returnToStart();
  }
  else if (keyCode == '6') {
    stage6 = true;
    stage1 = stage2 = stage3 = stage4 = stage5 = false; 
    mainSquare.returnToStart();
  }
  else if (keyCode == '0') {
    finalStage = true;
    stage1 = stage2 = stage3 = stage4 = stage5 = stage6 = false; 
    mainSquare.returnToStart();
  }
  else if (keyCode == 'G') {
    goodEnd = true;
    ending = true;
    stage1 = stage2 = stage3 = stage4 = stage5 = stage6 = false; 
    mainSquare.returnToStart();
  }

  if (mousePressed) {
    saveFrame("movie####.png");
  }
  
  println(mouseX+","+mouseY);*/

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
  else if (stage6) {
    level.stage6();
  }
  else if (finalStage) {
    level.finalStage();
  }
  //A winner is you.
  else if (ending) {
    level.ending();
  }
  if (!ending && !finalStage) {
    easter.check();
  }
}

public void movieEvent(Movie m) {
  m.read();
}



class Audio {
  AudioPlayer song;

  public void playaaf() {
    if (song != null) {
      song.pause();
    }
    song = minim.loadFile("aaf.mp3");
    song.play();
    song.loop();
  }

  public void playJam() {
    if (song != null) {
      song.pause();
    }
    song = minim.loadFile("Jam.mp3");
    song.play();
    song.loop();
  }

  public void playGarcon() {
    if (song != null) {
      song.pause();
    }
    song = minim.loadFile("Gar\u00e7on jeux (Boy game).mp3");
    song.play();
    song.loop();
  }

  public void playSquareAndEnjoy() {
    if (song != null) {
      song.pause();
    }
    song = minim.loadFile("square and enjoy.mp3");
    song.play();
    song.loop();
  }

  public void playCircleSquare() {
    if (song != null) {
      song.pause();
    }
    song = minim.loadFile("Circle square.mp3");
    song.play();
    song.loop();
  }
  
  public void playNyan() {
    if (song != null) {
      song.pause();
    }
    song = minim.loadFile("Nyan Cat.mp3");
    song.play();
    song.loop();
  }

  public void pause() {
    song.pause();
  }

  public void cont() {
    song.play();
    song.loop();
  }
}

class Background {
  int bColor;
  int pColor;
  Platform p1, p2, p3, p4, p5, p6;

  Background(int bColor, int pColor) {
    this.bColor = bColor;
    this.pColor = pColor;
  }

  public void displayB() {
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

class EggCheck {
  boolean up1, up2, down1, down2, left1, right1, left2, right2, b, a;
  boolean facingLeft = false;
  boolean facingRight = false;

  EggCheck() {
    up1 = false;
    up2 = down1 = down2 = left1 = right1 = left2 = right2 = b = a = false;
  }

  //Check to see if the user has entered the Konami Code 
  public void check() {
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
        rand = 9001;
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
          scale(-1.0f, 1.0f);
          image(nyan, -mainSquare.xPos, mainSquare.yPos+2, -100, 59);
          popMatrix();
          if (stage3 || stage6) {
            image(evilnyan, enemy.xPos, enemy.yPos+2, 100, 59);
          }
        }
        else if (facingRight == true) {
          if (stage3 || stage6) {
            pushMatrix();
            scale(-1.0f, 1.0f);
            image(evilnyan, -enemy.xPos, enemy.yPos+2, -100, 59);
            popMatrix();
          }
          image(nyan, mainSquare.xPos, mainSquare.yPos+2, 100, 59);
        }
      }
    }
  }
}

class Movement {
//Thanks to Chris DeLeon's Processing Platformer Tutorial
//for showing me how to better do this.
  boolean up, down, right, left;
  Movement(){
    up = down = right = left = false;
  }
  public void pressKey(int key,int keyCode) {
    if (keyCode == UP) {
      up = true;
    }
    if (keyCode == LEFT) {
      left = true;
    }
    if (keyCode == RIGHT) {
      right = true;
    }
  }
  public void releaseKey(int key,int keyCode) {
    if (keyCode == UP) {
      up = false;
    }
    if (keyCode == LEFT) {
      left = false;
    }
    if (keyCode == RIGHT) {
      right = false;
    }
  }
}
class Platform{
   int pColor;
   int x, y, w, h;
  
  Platform(int x, int y, int w, int h, int pColor){
    this.pColor = pColor;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public void display(){
    rectMode(CORNER);
    noStroke();
    
    fill(pColor);
    rect(x, y, w, h);    
  }
  public void displayClear(int clear){
    rectMode(CORNER);
    noStroke();
    
    fill(clear);
    rect(x, y, w, h); 
  }
}
class Spikes{
  int x1, y1, x2, y2, x3, y3;
  int amountOfSpikes;
  
  Spikes(int x1, int y1, int x2, int y2, int x3, int y3, int amountOfSpikes){
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.x3 = x3;
    this.y3 = y3;
    this.amountOfSpikes = amountOfSpikes;
  }
  
  public void displaySpikes(){
    for(int i = 0; i < amountOfSpikes; i++){
      fill(137, 0, 0);
      triangle(x1, y1, x2, y2, x3, y3);
      x1 += 10;
      x2 += 10;
      x3 += 10;
      i++;
    }
  }
}
class Square {
  float s;
  int sColor;
  float xPos = 100;
  float yPos = 675;
  float footx1 = xPos - s/2;
  float footy1 = yPos + s/2;
  float footx2 = xPos + s/2;
  float footy2 = yPos + s/2;
  double speedx = 3.7f;
  double speedy = 0;
  boolean collided = false;
  boolean enemyS;
  boolean died;
  boolean portal = false;

  Square() {
    s = 50;
    sColor = color(0, 0, 200);
    enemyS = false;
  }
  Square(float s, int sColor, float xPos, float yPos) {
    this.s = s;
    this.sColor = sColor;
    this.xPos = xPos;
    this.yPos = yPos;
    enemyS = true;
  }

  public void displayS() {
    //Gravity
    if (!collided) {
      gravity();
    }
    died = false;
    //Moving the Square
    if (sMovement.right && enemyS == false) {
      xPos += speedx;
      xPos = constrain(xPos, 0, 1200);
    }
    if (sMovement.left && enemyS == false) {
      xPos -= speedx;
      xPos = constrain(xPos, 0, 1200);
    }
    if (sMovement.right && enemyS == true) {
      xPos -= speedx;
      xPos = constrain(xPos, 0, 1200);
    }
    if (sMovement.left && enemyS == true) {
      xPos += speedx;
      xPos = constrain(xPos, 0, 1200);
    }
    if (sMovement.up && collided) {
      speedy -= 10;
      yPos += speedy;
      collided = false;
    }

    //Sends you back to the start if you touch spikes, or teleports you if you're in stage 5.
    if (stage5 && yPos > 700) {
      yPos = 400;
      xPos = 600;
      speedy -= 20;
      portal = true;
    }
    else if (stage5 && ((xPos > 520) && (xPos < 770) && (yPos > 400) && (yPos < 440))) {
      yPos = 700;
      xPos = 375;
      speedy -= 20;
      portal = true;
    }
    else if (yPos > 700 || ((xPos > 520) && (xPos < 770) && (yPos > 400) && (yPos < 440))) {
      returnToStart();
    }

    //Collision points.
    footx1 = xPos - s/2;
    footy1 = yPos + s/2;
    footx2 = xPos + s/2;
    footy2 = yPos + s/2;

    //Checking for each platform.
    collision(usualB.p1);
    if (!finalStage) {
      if (!stage5) {
        collision(usualB.p2);
        collision(usualB.p3);
      }
      collision(usualB.p4);
      collision(usualB.p5);
      collision(usualB.p6);
    }

    //Making the actual square.
    rectMode(CENTER);
    fill(sColor);
    rect(xPos, yPos, s, s);

    //Uncomment to see collision detection points.
    //fill(0, 255, 0);
    //ellipse(footx1, footy1, 5, 5);
    //ellipse(footx2, footy2, 5, 5);
  }

  public void gravity() {
    speedy += 0.3f;
    yPos += speedy;
    speedy = constrain((float)speedy, -1000, 7);
  }

  public void collision(Platform p) {
    //Exceptions for falling into pits.
    if (footy1 > 600 && footx1 > 300 && footx1 < 450 && footx2 > 300 && footx2 < 450 && !finalStage) {
      collided = false;
    }
    else if (footy1 < 500 && footx1 > 520 && footx1 < 670 && footx2 > 520 && footx2 < 670 && !finalStage) {
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
  public boolean goalReached() {
    if (xPos > 100 && xPos < 142 && yPos < 300) {
      return true;
    }
    else {
      return false;
    }
  }

  //Send you back to the spawn point.
  public void returnToStart() {
    if (enemyS == false) {
      xPos = 100;
      yPos = 675;
    }
    if (enemyS == true) {
      xPos = 1100;
      yPos = 675;
    }
    died = true;
  }
}

class Stages {

  public void mainMenu() {
    imageMode(CENTER);

    background(255);

    if (fadeIn < 255) {
      fadeIn += 1.5f;
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

    //For playing the movies.
    gameplay.playRandom();
    noTint();

    if (keyCode == ENTER) {
      mainMenu = false;
      stage1 = true;
      easter.a = false;
      music.playJam();
    }
  }

  public void stage1() {
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

  public void stage2() {
    float redness = map(mainSquare.yPos, 0, 1200, 0, 255);
    float blueness = map(mainSquare.xPos, 0, 900, 0, 255)+50;
    float greenness = map(mainSquare.xPos/mainSquare.yPos, 0, 900, 0, 255)+27;
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

  public void stage3() {
    background(237);
    enemy.sColor = color(map(abs(sin(x)), 0, 1, 30, 230), 0, 0);
    x+=0.02f;
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
    text("I AM YOUR MORTAL ENEMY!", width/2-350, height/2+340);
    text("MWAHAHAHAHAHA!!", width/2-350, height/2+395);
    fill(15);
    rect(800, 700, 5, 500);
    fill(0, 0, 200);
    rect(970, 760, 30, 30);
    fill(0);
    textSize(15);
    text("Wow, even my mortal enemy is clich\u00e9.", 860, 820);
    text("Well, at least he glows. That's kinda cool, I guess.", 810, 837);


    if (mainSquare.goalReached()) {
      stage3 = false;
      stage4 = true;
      mainSquare.returnToStart();
      enemy.returnToStart();
    }
  }

  public void stage4() {
    background(237);
    usualB.displayB();
    mainSquare.displayS();
    if (mainSquare.xPos <= 700) {
      usualB.pColor = color(15, PApplet.parseInt(map(mainSquare.xPos, 475, 700, 0, 255)));
    }
    else if (mainSquare.xPos > 700) {
      usualB.pColor = color(15, PApplet.parseInt(map(mainSquare.xPos, 700, 950, 255, 0)));
    }

    fill(0);
    textSize(20);
    text("So... is my eyesight getting worse, or is the floor invisible?", width/2-350, height/2+330);
    fill(usualB.pColor);
    text("Ohhhh, I get it now.", width/2-350, height/2+370);

    if (mainSquare.goalReached()) {
      usualB.pColor = color(15, 255);
      stage4 = false;
      stage5 = true;
      mainSquare.returnToStart();
      mainSquare.portal = false;
    }
  }

  public void stage5() {
    background(237);
    usualB.displayB();
    mainSquare.displayS();

    fill(0);
    textSize(20);
    text("The platforms are a lie, so what else could you use...?", width/2-350, height/2+330);
    if (mainSquare.portal) {
      text("Now you're thinking with porta-- I mean spikes. Thinking with spikes.", width/2-350, height/2+370);
      textSize(12);
      text("Nope, no copyright infringement here. Whew, dodged a bullet there.", width/2-350, height/2+395);
    }

    if (mainSquare.goalReached()) {
      stage5 = false;
      stage6 = true;
      mainSquare.returnToStart();
    }
  }

  public void stage6() {
    background(237);
    enemy.sColor = color(map(abs(sin(x)), 0, 1, 30, 230), 0, 0);
    x+=0.02f;
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
    textSize(30);
    text("MWAHAHAHAHAHA!!", width/2-350, height/2+335);
    text("THIS IS OUR FINAL SHOWDOWN!", width/2-350, height/2+375);
    text("YOU'LL NEVER GET THROUGH NOW!", width/2-350, height/2+415);
    fill(15);
    rect(800, 700, 5, 500);
    fill(0, 0, 200);
    rect(970, 760, 30, 30);
    fill(0);
    textSize(15);
    text("This guy isn't exactly the smartest, is he?", 845, 820);
    text("I think if we can just stand on those switches", 820, 837);
    text("at the same time...", 920, 854);


    if (!switches) {
      fill(200, 0, 0);
      rect(102, 175, 40, 75);
      ellipse(460, 400, 120, 10); 
      ellipse(735, 400, 130, 10);
    }
    else {
      fill(0, 200, 0);
      ellipse(460, 400, 120, 10); 
      ellipse(735, 400, 130, 10);
    }
    
    if (((mainSquare.xPos > 375 && mainSquare.xPos < 545 && enemy.xPos > 645 && enemy.xPos < 825) ||
        (enemy.xPos > 375 && enemy.xPos < 545 && mainSquare.xPos > 645 && mainSquare.xPos < 825))&&
        mainSquare.yPos < 400 && mainSquare.yPos > 330 && enemy.yPos < 400 && enemy.yPos > 330){
      switches = true;
    }

    if (mainSquare.goalReached() && switches) {
      stage6 = false;
      switches = false;
      finalStage = true;
      music.playSquareAndEnjoy();
      enemy.returnToStart();
      mainSquare.xPos = 600;
      mainSquare.yPos = 675;
    }
  }

  public void finalStage() {
    background(0);

    if (flag1 == false && flag2 == false && flag3 == false) {
      if (fadeIn1 < 255) {
        fadeIn1 += 0.9f;
      }
      if (fadeIn1 >= 255) {
        fadeIn2 += 0.9f;
      }
      if (fadeIn1 >= 255 && fadeIn2 >= 255) {
        fadeIn3 += 0.9f;
      }
      textSize(30);
      textAlign(CENTER);
      fill(fadeIn1);
      text("The humble square now reaches the end of his adventure,", width/2, height/2-300);
      fill(fadeIn2);
      text("but time stops for no square.", width/2, height/2-150);  
      fill(fadeIn3);
      text("So he simply continues going through this endless level...", width/2, height/2);
    }

    if (mainSquare.xPos > 1100 && !flag1 && !flag2 && !flag3) {
      mainSquare.xPos = 100;
      flag1 = true;
    }
    else if (mainSquare.xPos > 1100 && !flag2 && !flag3) {
      mainSquare.xPos = 100;
      flag1 = false;
      flag2 = true;
    }
    else if (mainSquare.xPos > 1100 && !flag3) {
      mainSquare.xPos = 100;
      flag2 = false;
      flag3 = true;
    }
    if (flag1 && !flag2 && !flag3) {
      fill(255);
      textSize(25);
      text("Nope. I'm not doing this anymore, omnipotent narrator person.", width/2, 750);
      text("My whole life, I've just repeated this level over and over, and I'm tired of it.", width/2, 800);
      text("I've always been screwed, or I guess you could say I've been...", width/2, 850);
    }
    if (flag2 && !flag1 && !flag3) {
      fill(255);
      textSize(100);
      text("Squared", width/2, 400);
    }
    if (flag3 && !flag1 && !flag2) {
      background(map(mainSquare.xPos, 200, 1200, 0, 250));
      fill(255);
      textSize(30);
      text("So now it's time to get out of here...", width/2, 750);
    }

    mainSquare.displayS();

    if (fadeIn1 >= 255 && fadeIn2 >= 255 && fadeIn3 >= 255) {
      fadeIn1 = fadeIn2 = fadeIn3 = 0;
      finalStage = false;
      badEnd = true;
      goodEnd = false;
      ending = true;
      mainSquare.returnToStart();
      music.playCircleSquare();
    }

    if (flag3 && mainSquare.xPos > 1100) {
      fadeIn1 = fadeIn2 = fadeIn3 = 0;
      flag1 = flag2 = flag3 = false;
      finalStage = false;
      goodEnd = true;
      badEnd = false;
      ending = true;
      mainSquare.returnToStart();
      music.playGarcon();
    }
  }

  public void ending() {
    background(255);
    if (badEnd) {
      textSize(90);
      fill(0, 200, 0);
      text("Congratulations!!", width/2, 200);
      fill(0);
      textSize(70);
      text("You have completed the game.", width/2, 350);
      textSize(30);
      text("The good ending is still out of your grasp, and the square continues on...", width/2, 550);
      textSize(20);
      text("Try doing something during that final narration. Maybe you can change things...", width/2, 600);
      textSize(50);
      text("Press 'R' to try again.", width/2, 800);
    }
    else if (goodEnd) {
      imageMode(CORNER);
      image(Win, 0, 0, Win.width*3, Win.height*2.5f);

      fill(0, 0, 200);
      rect(50, 450+200*sin(v1), 50, 50);
      fill(200, 0, 0);
      rect(1150, 450+200*cos(v1), 50, 50);
      fill(255*sin(v1), 255*cos(v2), 255*sin(v3));
      rect(600, 50, 50, 50);
      rect(200, 850, 50, 50);
      rect(1000, 850, 50, 50);
      v1+=0.028f;
      v2+=0.03f;
      v3+=0.04f;

      textAlign(CENTER);
      fill(0);
      textSize(30);
      text("Press 'R' to do it all again.", width/2, height/2+410);
    }
    if (keyCode == 'R') {
      music.playaaf();
      mainSquare.returnToStart();
      ending = false;
      mainMenu = true;
      fadeIn = 0;
    }
  }
}



class TitleMovie {

  //Please pardon the long, not so pretty movie code.
  
  public void playRandom() {
    if (rand <= 2500) {
      if (fadeIn >= 250 && fadeOut == 255) {
        noTint();
        movie1.play();
        image(movie1, width/2, height/2 - 150);
      }

      if (movie1.time() % movie1.duration() == 0) {
        tint(255, fadeOut);
        image(movie1, width/2, height/2 - 150);
        fadeOut -= 0.9f;
      }

      if (fadeOut <= 0) {
        movie1.stop();
        fadeOut = 255;
        rand = random(2500, 9037);
      }
    }
    else if (rand > 2500 && rand <= 5000) {
      if (fadeIn >= 250 && fadeOut == 255) {
        noTint();
        movie2.play();
        image(movie2, width/2, height/2 - 150);
      }

      if (movie2.time() % movie2.duration() == 0) {
        tint(255, fadeOut);
        image(movie2, width/2, height/2 - 150);
        fadeOut -= 0.9f;
      }

      if (fadeOut <= 0) {
        movie2.stop();
        fadeOut = 255;
        rand = random(9037);
      }
    }
    else if (rand > 5000 && rand <= 7500) {
      if (fadeIn >= 250 && fadeOut == 255) {
        noTint();
        movie3.play();
        image(movie3, width/2, height/2 - 150);
      }

      if (movie3.time() % movie3.duration() == 0) {
        tint(255, fadeOut);
        image(movie3, width/2, height/2 - 150);
        fadeOut -= 0.9f;
      }

      if (fadeOut <= 0) {
        movie3.stop();
        fadeOut = 255;
        rand = random(9037);
      }
    }
    else if (rand > 7500 && rand <= 9000) {
      if (fadeIn >= 250 && fadeOut == 255) {
        noTint();
        movie4.play();
        image(movie4, width/2, height/2 - 150);
      }

      if (movie4.time() % movie4.duration() == 0) {
        tint(255, fadeOut);
        image(movie4, width/2, height/2 - 150);
        fadeOut -= 0.9f;
      }

      if (fadeOut <= 0) {
        movie4.stop();
        fadeOut = 255;
        rand = random(7500);
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
        fadeOut -= 0.9f;
      }

      if (fadeOut <= 0) {
        movie9000.stop();
        movie9001.stop();
        fadeOut = 255;
        rand = random(9037);
        music.cont();
      }
    }
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Squared" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
