import ddf.minim.*;

class Audio {
  AudioPlayer song;

  void playaaf() {
    if (song != null) {
      song.pause();
    }
    song = minim.loadFile("aaf.mp3");
    song.play();
    song.loop();
  }

  void playJam() {
    if (song != null) {
      song.pause();
    }
    song = minim.loadFile("Jam.mp3");
    song.play();
    song.loop();
  }

  void playGarcon() {
    if (song != null) {
      song.pause();
    }
    song = minim.loadFile("Garçon jeux (Boy game).mp3");
    song.play();
    song.loop();
  }

  void playSquareAndEnjoy() {
    if (song != null) {
      song.pause();
    }
    song = minim.loadFile("square and enjoy.mp3");
    song.play();
    song.loop();
  }

  void playCircleSquare() {
    if (song != null) {
      song.pause();
    }
    song = minim.loadFile("Circle square.mp3");
    song.play();
    song.loop();
  }
  
  void playNyan() {
    if (song != null) {
      song.pause();
    }
    song = minim.loadFile("Nyan Cat.mp3");
    song.play();
    song.loop();
  }

  void pause() {
    song.pause();
  }

  void cont() {
    song.play();
    song.loop();
  }
}

