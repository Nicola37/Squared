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
}

