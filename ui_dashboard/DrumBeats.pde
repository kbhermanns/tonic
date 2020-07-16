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
  void setBpm(float tempo) {
    bpm = (int)(120 * tempo);
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
  
  class Tick implements Instrument
{
  
  void noteOn( float dur )
  {
    Sampler sound1 = kick;
    Sampler sound2 = snare;
    Sampler sound3 = hat;
  
    //set sound 1
    if (instruments.size() >0) {
    if (instruments.get(0).equals("Kick"))
      sound1 = kick;
    else if (instruments.get(0).equals("Snare"))
      sound1 = snare;
    else if (instruments.get(0).equals("Hi Hat"))
      sound1 = hat;
    }

    //set sound 2
    if (instruments.size() >1) {
    if (instruments.get(1).equals("Kick"))
      sound2 = kick;
    else if (instruments.get(1).equals("Snare"))
      sound2 = snare;
    else if (instruments.get(1).equals("Hi Hat"))
      sound2 = hat;
    }

    //set sound 3
    if (instruments.size() >2) {
    if (instruments.get(2).equals("Kick"))
      sound3 = kick;
    else if (instruments.get(2).equals("Snare"))
      sound3 = snare;
    else if (instruments.get(2).equals("Hi Hat"))
      sound3 = hat;
    }


    if ( beats[0][curBeat] > 0) sound1.trigger();
    if ( beats[1][curBeat] > 0) sound2.trigger();
    if ( beats[2][curBeat] > 0) sound3.trigger();
  }
  
  void noteOff()
  {
    curBeat = (curBeat+1)%16;
    out.setTempo( bpm );
    if (beats[0][curBeat] == 1)
      out.playNote(0,0.25f, this);
    else 
      out.playNote(0,0.1f, this);
    
    //out.playNote( 0, 0.25f, this );
  }  
  
}

void audioSetup() {    
    kick  = new Sampler( "BD.wav", 4, minim );
    snare = new Sampler( "SD.wav", 4, minim );
    hat   = new Sampler( "CHH.wav", 4, minim );
    
    kick.patch( out );
    snare.patch( out );
    hat.patch( out );
  
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
