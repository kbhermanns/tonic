import ddf.minim.*;
import processing.opengl.*;
import ddf.minim.ugens.*;
class Audio{


Minim       minim;
AudioOutput out;

Sampler     kick;
Sampler     snare;
Sampler     hat;

//boolean[] hatRow = new boolean[16];
//boolean[] snrRow = new boolean[16];
//boolean[] kikRow = new boolean[16];
int numIns = 3;
int numBeats = 16;
boolean[][] playBeat;
//boolean[][] playBeat; = {{true,false,false,false,false,false,false,false,true,false,true,false,false,false,false,false},
//          {false,false,false,false,true,false,false,false,false,false,false,false,true,false,false,false}, 
//          {false,false,true,false,false,false,true,false,false,false,false,false,false,false,true,false}};

//BeatDNA playBeat = new BeatDNA(copy_beats);


int bpm = 120;

PApplet pa;

int beat;
Audio(PApplet papp, boolean[][] pBeat) {  
  pa = papp;
minim = new Minim(pa);
    out   = minim.getLineOut();
    playBeat = pBeat;
}

class Tick implements Instrument
{
  
  void noteOn( float dur )
  {
    //if ( hatRow[beat] ) hat.trigger();
    //if ( snrRow[beat] ) snare.trigger();
    //if ( kikRow[beat] ) kick.trigger();
    if ( playBeat[0][beat] ) hat.trigger();
    if ( playBeat[0][beat] ) snare.trigger();
    if ( playBeat[0][beat] ) kick.trigger();
  }
  
  void noteOff()
  {
    beat = (beat+1)%16;
    out.setTempo( bpm );
    out.playNote( 0, 0.25f, this );
  }
  
  //void Setkik(boolean[] _kik)
  //{
  //    playBeat[0] = _kik;
  //}
  
  //void Setsnr(boolean[] _snr)
  //  {
  //      playBeat[1] = _snr;
  //  }
  
  //void Sethat(boolean[] _hat)
  //  {
  //      playBeat[2] = _hat;
  //  }
  
}

void audioSetup() {  
    //size(395, 200);
    
    println("here");
    
    kick  = new Sampler( "BD.wav", 4, minim );
    snare = new Sampler( "SD.wav", 4, minim );
    hat   = new Sampler( "CHH.wav", 4, minim );
    
    kick.patch( out );
    snare.patch( out );
    hat.patch( out );
  
    beat = 0;
    
  
    out.setTempo( bpm );
    out.playNote( 0, 0.25f, new Tick() );
    

}
void mute() {
  out.mute();
}
void unMute() {
  out.unmute();
}
//void draw()
//{
//  background(0);
//  fill(255);
  
//}
}
