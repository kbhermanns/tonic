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
  
  boolean[][] beats;
  int bpm = 120;
  int curBeat;
  PApplet pa;
  
  DrumBeats(PApplet papp, int numIns, int numBeats) {
    beats = new boolean[numIns][numBeats];
    pa = papp;
    minim = new Minim(pa);
    out   = minim.getLineOut();
  }
  
  void updateBeats(int row, int column, boolean value) {
    beats[row][column] = value;
  }
  void setEntireBeat(boolean[][] newBeat) {beats = newBeat;}
  
  boolean getBeat(int row, int column) {
    return beats[row][column];
  }
  boolean[][] getEntireBeat(){
    return beats;
  }
  void setBeats(boolean[][] newBeat) {
    beats = newBeat;
  }
  
  class Tick implements Instrument
{
  
  void noteOn( float dur )
  {
    if ( beats[0][curBeat] ) kick.trigger();
    if ( beats[1][curBeat] ) snare.trigger();
    if ( beats[2][curBeat] ) hat.trigger();
  }
  
  void noteOff()
  {
    curBeat = (curBeat+1)%16;
    out.setTempo( bpm );
    
    out.playNote( 0, 0.25f, this );
  }  
  
}

void audioSetup() {  
    println("here");
    
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

}
