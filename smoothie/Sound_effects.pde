//This class will hold all of the sound effects and background music
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

AudioPlayer bg, slice;
Minim minim;

class Sound_effects {
  //variables here

  Sound_effects(PApplet p) {
    //constructor
    minim = new Minim(p);
    bg = minim.loadFile("cpdojo.mp3");
    slice = minim.loadFile("whoosh.mp3");
  }

  //function for the background music
  void bgm()
  {
    bg.play();
  }
  
  void slice(){
    slice.rewind();
    slice.play();
  }
}

void stop() {
  bg.close();
  minim.stop();
  super.stop();
}
