import ddf.minim.*;

class Audio {
   AudioPlayer song;

  void playHane() {
    if (song != null){
      song.pause();
    }
    song = minim.loadFile("Hane.mp3");
    song.play();
    song.loop();
  }
  
  void playVictoryFanfare(){
    if (song != null){
      song.pause();
    }
    song = minim.loadFile("Victory Fanfare.mp3");
    song.play();
    song.loop();
  }
}

