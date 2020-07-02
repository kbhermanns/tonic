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
  int bpm = 120;
  int curBeat;
  
  DrumBeats() {
    Beats = new boolean[3][16];
  }
  
  void updateBeats(int row, int column, boolean value) {
    Beats[row][column] = value;
  }
  
  boolean getBeat(int row, int column) {
    return Beats[row][column];
  }

}
