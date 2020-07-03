import ddf.minim.*;
import ddf.minim.ugens.*;

Minim       minim;
AudioOutput out;

Sampler     kick;
Sampler     snare;
Sampler     hat;

boolean[] hatRow = new boolean[16];
boolean[] snrRow = new boolean[16];
boolean[] kikRow = new boolean[16];

int bpm = 120;

int beat;

class Tick implements Instrument
{
  
  Tick() {
      minim = new Minim(this);
  out   = minim.getLineOut();
  
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
  
  void noteOn( float dur )
  {
    if ( hatRow[beat] ) hat.trigger();
    if ( snrRow[beat] ) snare.trigger();
    if ( kikRow[beat] ) kick.trigger();
  }
  
  void noteOff()
  {
    beat = (beat+1)%16;
    out.setTempo( bpm );
    out.playNote( 0, 0.25f, this );
  }
  
  void Setkik(boolean[] _kik)
  {
      kikRow = _kik;
  }
  
  void Setsnr(boolean[] _snr)
    {
        snrRow = _snr;
    }
  
  void Sethat(boolean[] _hat)
    {
        hatRow = _hat;
    }
  
}
