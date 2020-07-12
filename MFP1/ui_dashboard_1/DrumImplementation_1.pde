//Adapted from the Minim drum machine example 
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
  
  boolean[][] Beats;
  Boolean[] holder;
  int bpm = 120;
  int curBeat;
  PApplet pa;
  
  DrumBeats(PApplet papp) {
    pa = papp;
    Beats = new boolean[3][16];
    minim = new Minim(pa);
    out   = minim.getLineOut();
  }
  
  void updateBeats(int row, int column, boolean value) {
    Beats[row][column] = value;
  }
  void setEntireBeat(boolean[][] newBeat) {Beats = newBeat;}
  
  boolean getBeat(int row, int column) {
    return Beats[row][column];
  }
  
  Boolean[] getRow(int row) {
    holder = new Boolean[16];
    for (int i = 0; i < 16; i ++) {
      holder[i] = Beats[row][i];
    }
    return holder;
  }
  boolean[][] getEntireBeat(){
    return Beats;
  }
  void setBeats(boolean[][] newBeat) {
    Beats = newBeat;
  }
  
  class Tick implements Instrument
{
  
  void noteOn( float dur )
  {
    if ( Beats[0][curBeat] ) kick.trigger();
    if ( Beats[1][curBeat] ) snare.trigger();
    if ( Beats[2][curBeat] ) hat.trigger();
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
