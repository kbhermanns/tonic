//Adapted from the Minim drum machine example provided by Prof. Borland
import processing.opengl.*;
import ddf.minim.*;
import ddf.minim.ugens.*;

class DrumBeats {

  Minim       minim;
  AudioOutput out;
  
  Sampler     kick;
  Sampler     snare;
  Sampler     hat;

  Sampler kickAccent;
  Sampler snareAccent;
  Sampler hatAccent;
  
  int kickRow = 1;
  int snareRow = 2;
  int hatRow = 3;
  
  int[][] beats;
  int[] holder;
  int bpm;
  int curBeat;
  PApplet pa;
  ArrayList<String> instruments = new ArrayList<String>();
  
  DrumBeats(PApplet papp, int numIns, int numBeats) {
    beats = new int[numIns][numBeats];
    pa = papp;
    minim = new Minim(pa);
    out   = minim.getLineOut();
    bpm = 120;
  }
  
  void updateBeats(int row, int column, int value) {
    beats[row][column] = value;
  }
  void setEntireBeat(int[][] newBeat) {beats = newBeat;}
  void setBpm(int tempo) {
    bpm = tempo;
  }
  
  int getBeat(int row, int column) {
    return beats[row][column];
  }
  
  int[] getRow(int row) {
    holder = new int[16];
    for (int i = 0; i < 16; i ++) {
      holder[i] = beats[row][i];
    }
    return holder;
  }
  int[][] getEntireBeat(){
    return beats;
  }
  void setBeats(int[][] newBeat) {
    beats = newBeat;
  }

  boolean isEmpty() {
    boolean foundExistance = false;
    for (int i = 0; i < beats.length; i++) {
      for (int j = 0; j < beats.length; j++) {
        if (beats[i][j] != 0) {
          foundExistance = true;
          break;
        }
      }
    }
    return !foundExistance;
  }
  
  class Tick implements Instrument
{
  
  void noteOn( float dur )
  {
    Sampler sound1 = kick;
    Sampler sound2 = snare;
    Sampler sound3 = hat;
  
    //set sound 1
    if (instruments.size() >0) {
      if (instruments.get(0).equals("Kick")) {
        if (beats[0][curBeat] == 1)
          sound1 = kick;
        else
          sound1 = kickAccent;
      }
      else if (instruments.get(0).equals("Snare")) {
        if (beats[0][curBeat] == 1)
          sound1 = snare;
        else
          sound1 = snareAccent;
      }
      else if (instruments.get(0).equals("Hi Hat")) {
        if (beats[0][curBeat] == 1)
          sound1 = hat;
        else
          sound1 = hatAccent;
      }
    }

    //set sound 2
    if (instruments.size() >1) {
      if (instruments.get(1).equals("Kick")) {
        if (beats[1][curBeat] == 1)
          sound2 = kick;
        else
          sound2 = kickAccent;
      }
      else if (instruments.get(1).equals("Snare")) {
        if (beats[1][curBeat] == 1)
          sound2 = snare;
        else
          sound2 = snareAccent;
      }
      else if (instruments.get(1).equals("Hi Hat")) {
        if (beats[1][curBeat] == 1)
          sound2 = hat;
        else
          sound2 = hatAccent;
      }
    }

    //set sound 3
    if (instruments.size() >2) {
      if (instruments.get(2).equals("Kick")) {
        if (beats[2][curBeat] == 1)
            sound3 = kick;
          else
            sound3 = kickAccent;
      }
      else if (instruments.get(2).equals("Snare")) {
        if (beats[2][curBeat] == 1)
            sound3 = snare;
          else
            sound3 = snareAccent;
      }
      else if (instruments.get(2).equals("Hi Hat")) {
        if (beats[2][curBeat] == 1)
            sound3 = hat;
          else
            sound3 = hatAccent;
      }
    }


    if ( beats[0][curBeat] > 0) sound1.trigger();
    if ( beats[1][curBeat] > 0) sound2.trigger();
    if ( beats[2][curBeat] > 0) sound3.trigger();
  }
  
  void noteOff()
  {
    curBeat = (curBeat+1)%16;
    out.setTempo( bpm );
    
    out.playNote( 0, 0.25f, this );
  }  
  
}

void audioSetup() {    
    kick  = new Sampler( "BD.wav", 4, minim );
    snare = new Sampler( "SD.wav", 4, minim );
    hat   = new Sampler( "CHH.wav", 4, minim );

    //accent files
    kickAccent = new Sampler("KickAccent.wav", 4, minim);
    snareAccent = new Sampler("SnareAccent.wav", 4, minim);
    hatAccent = new Sampler("HatAccent.wav", 4, minim);
    
    kick.patch( out ); 
    snare.patch( out );
    hat.patch( out );
    kickAccent.patch(out);
    snareAccent.patch(out);
    hatAccent.patch(out);
  
    curBeat = 0;    
  
    out.setTempo( bpm );
    out.playNote( 0, 0.25f, new Tick() );
}
void mute() {
  out.mute();
}
void unMute() {
  out.unmute();
}

boolean isMuted() {return out.isMuted();}

void setInstruments(ArrayList<String> inst) {
  instruments = inst;
} 

}
