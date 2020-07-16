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
    bpm = (int)(200 * tempo);
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
    if ( beats[0][curBeat] > 0) kick.trigger();
    if ( beats[1][curBeat] > 0) snare.trigger();
    if ( beats[2][curBeat] > 0) hat.trigger();
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
