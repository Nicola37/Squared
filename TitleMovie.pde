import processing.video.*;

class TitleMovie {

  //Please pardon the long, not so pretty movie code.
  
  void playRandom() {
    if (rand <= 2500) {
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
        fadeOut -= 0.9;
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
        fadeOut -= 0.9;
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
        fadeOut -= 0.9;
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
        fadeOut -= 0.9;
      }

      if (fadeOut <= 0) {
        movie9000.stop();
        movie9001.stop();
        fadeOut = 255;
        rand = random(9037);
        music.playaaf();
      }
    }
  }
}

