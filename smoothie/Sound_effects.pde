//This class will hold all of the sound effects and background music
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

AudioPlayer song;
Minim minim;

class Sound_effects {
  //variables here

  Sound_effects() {
    //constructor
  }

  //function for the background music
  void bgm()
  {
    minim = new Minim(this);
    song = minim.loadFile("cpdojo.mp3");
    song.play();
  }

  
}
void stop() {
    song.close();
    minim.stop();
    super.stop();
  }
