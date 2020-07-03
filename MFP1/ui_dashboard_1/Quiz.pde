import java.awt.Rectangle;

//Note: Button clicks do work but take time and work best clicking in the bottom right hand corner

class Quiz{
  
    Boolean[][] target_beats;
    String[] genre_title = {"Hip-Hop", "Disco/Pop", "Dubstep", "Rock"};
    int shiftx = 200;
    int shifty = -50;
    
    Boolean goClicked = false;
    Boolean HipHopPrevClick = false;
    Boolean DiscoPopPrevClick = false;
    Boolean DubstepPrevClick = false;
    Boolean RockPrevClick = false;
    Boolean SlowPrevClick = false;
    Boolean WalkingPrevClick = false;
    Boolean ModeratePrevClick = false;
    Boolean HeartbeatPrevClick = false;
    Boolean FastPrevClick = false;
    Boolean TwoFourPrevClick = false;
    Boolean ThreeFourPrevClick = false;
    Boolean FourFourPrevClick = false;
    Boolean YesSyncoPrevClick = false;
    Boolean NoSyncoPrevClick = false;
    Boolean GoPrevClick = false;
    
    
    String genre = "None";
    String speed = "None";
    String time_sig = "None";
    Boolean syncopation = false; 
    
    Boolean HipHopSelected = false;
    Boolean DiscoPopSelected = false;
    Boolean DubstepSelected = false;
    Boolean RockSelected = false;
    Boolean SlowSelected = false;
    Boolean WalkingSelected = false;
    Boolean ModerateSelected = false;
    Boolean HeartbeatSelected = false;
    Boolean FastSelected = false;
    Boolean TwoFourSelected = false;
    Boolean ThreeFourSelected = false;
    Boolean FourFourSelected = false;
    Boolean YesSyncoSelected = false;
    Boolean NoSyncoSelected = false;
    Boolean GoSelected = false;
    
    RectangularButton HipHopButton;
    RectangularButton DiscoPopButton;
    RectangularButton DubstepButton;
    RectangularButton RockButton;
    RectangularButton SlowButton;
    RectangularButton WalkingButton;
    RectangularButton ModerateButton;
    RectangularButton HeartbeatButton;
    RectangularButton FastButton;
    RectangularButton TwoFourButton;
    RectangularButton ThreeFourButton;
    RectangularButton FourFourButton;
    RectangularButton YesSyncoButton;
    RectangularButton NoSyncoButton;
    RectangularButton GoButton;
    
    int HipHopFill = -16056324;
    int DiscoPopFill = -16056324;
    int DubstepFill = -16056324;
    int RockFill = -16056324;
    int SlowFill = -16056324;
    int WalkingFill = -16056324;
    int ModerateFill = -16056324; 
    int HeartbeatFill = -16056324;
    int FastFill = -16056324; 
    int TwoFourFill =-16056324; 
    int ThreeFourFill = -16056324; 
    int FourFourFill = -16056324; 
    int YesSyncoFill = -16056324;
    int NoSyncoFill = -16056324;
    int GoFill = -4162569;
    
  
  Quiz(){
    target_beats = new Boolean[3][16];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 16; j++) {
        target_beats[i][j] = false;
      }
    }

}
  
  
  void render(){
    background(-14079703);
    textSize(32);
    fill(225);
    text("Tell me about beat you want to create!", 650, 30);
    text("What Genre?", 650, 90);
    text("Speed in Beats per Minute (BPM)?", 650, 270);
    text("Time Signature?", 650, 450);
    text("Add Syncopation?", 650, 630);
   
    HipHopButton = new RectangularButton(HipHopFill, 0.0, 0, 182.3423 + shiftx, 223.37125+ shifty, 0.0, -89.96897, -40.360737, 56.036366, 29.837717, "Hip-Hop", 182.3423 + shiftx - 15, 223.37125+ shifty - 10, 24);
    HipHopButton.update();
    if (HipHopButton.isClicked() || HipHopPrevClick) {
      HipHopFill = -1;
      genre = "Hip-Hop";
      if(HipHopButton.isClicked()){
        HipHopPrevClick = !HipHopPrevClick;
      }
    } else {
      HipHopFill = -16056324;
    }
    HipHopButton.renderWithText();
    
    DiscoPopButton = new RectangularButton(DiscoPopFill, 0.0, 0, 362.28024 + shiftx, 221.82005 + shifty, 0.0, -89.96897, -40.360737, 56.036366, 29.837717, "Disco/Pop", 362.28024 + shiftx- 15, 221.82005 + shifty - 10, 24);
    DiscoPopButton.update();
    if (DiscoPopButton.isClicked() || DiscoPopPrevClick) {
      DiscoPopFill = -1;
      genre = "Disco/Pop";
      if(DiscoPopButton.isClicked()){
        DiscoPopPrevClick = !DiscoPopPrevClick;
      }
    } else {
      DiscoPopFill = -16056324;
    }
    DiscoPopButton.renderWithText();
    
    DubstepButton = new RectangularButton(DubstepFill, 0.0, 0, 542.2182 + shiftx, 223.37125+ shifty, 0.0, -89.96897, -40.360737, 56.036366, 29.837717, "Dubstep", 542.2182 + shiftx- 15, 223.37125+ shifty - 10, 24);
    DubstepButton.update();
    if (DubstepButton.isClicked() || DubstepPrevClick) {
      DubstepFill = -1;
      genre = "Dubstep";
      if(DubstepButton.isClicked()){
        DubstepPrevClick = !DubstepPrevClick;
      }
    } else {
      DubstepFill = -16056324;
    }
    DubstepButton.renderWithText();

    RockButton = new RectangularButton(RockFill, 0.0, 0, 723.70734 + shiftx,  221.82005 + shifty, 0.0, -89.96897, -40.360737, 56.036366, 29.837717, "Rock", 723.70734 + shiftx- 15,  221.82005 + shifty - 10, 24);
    RockButton.update();
    if (RockButton.isClicked() || RockPrevClick) {
      RockFill = -1;
      genre = "Rock";
      if(RockButton.isClicked()){
        RockPrevClick = !RockPrevClick;
      }
    } else {
      RockFill = -16056324;
    }
    RockButton.renderWithText();
    
    SlowButton = new RectangularButton(SlowFill, 0.0, 0, 104.78284 + shiftx,  403.3092+ shifty, 0.0, -89.96897, -40.360737, 56.036366, 29.837717, "60-85 BPM", 104.78284 + shiftx- 15,  403.3092+ shifty - 10, 20);
    SlowButton.update();
    if (SlowButton.isClicked() || SlowPrevClick) {
      SlowFill = -1;
      speed = "60-85";
      if(SlowButton.isClicked()){
        SlowPrevClick = !SlowPrevClick;
      }
    } else {
      SlowFill = -16056324;
    }
    SlowButton.renderWithText();
    
    WalkingButton = new RectangularButton(WalkingFill, 0.0, 0,272.31128 + shiftx,  403.3092 + shifty, 0.0, -89.96897, -40.360737, 56.036366, 29.837717, "85-110 BPM", 272.31128 + shiftx- 15,  403.3092 + shifty - 10, 20);
    WalkingButton.update();
    if (WalkingButton.isClicked() || WalkingPrevClick) {
      WalkingFill = -1;
      speed = "85-110";
      if(WalkingButton.isClicked()){
        WalkingPrevClick = !WalkingPrevClick;
      }
    } else {
      WalkingFill = -16056324;
    }
    WalkingButton.renderWithText();
    
    ModerateButton = new RectangularButton(ModerateFill, 0.0, 0,450.698 + shiftx,  403.3092 + shifty, 0.0, -89.96897, -40.360737, 56.036366, 29.837717, "110-135 BPM", 450.698 + shiftx- 15,  403.3092 + shifty - 10, 20);
    ModerateButton.update();
    if (ModerateButton.isClicked() || ModeratePrevClick) {
      ModerateFill = -1;
      speed = "110-135";
      if(ModerateButton.isClicked()){
        ModeratePrevClick = !ModeratePrevClick;
      }
    } else {
      ModerateFill = -16056324;
    }
    ModerateButton.renderWithText();
    
    HeartbeatButton = new RectangularButton(HeartbeatFill, 0.0, 0,632.18713 + shiftx,  403.3092 + shifty, 0.0, -89.96897, -40.360737, 56.036366, 29.837717, "135-160 BPM", 632.18713 + shiftx- 15,  403.3092 + shifty - 10, 20);
    HeartbeatButton.update();
    if (HeartbeatButton.isClicked() || HeartbeatPrevClick) {
      HeartbeatFill = -1;
      speed = "135-160";
      if(HeartbeatButton.isClicked()){
        HeartbeatPrevClick = !HeartbeatPrevClick;
      }
    } else {
      HeartbeatFill = -16056324;
    }
    HeartbeatButton.renderWithText();
    
   FastButton = new RectangularButton(FastFill, 0.0, 0,812.1251 + shiftx,  403.3092 + shifty, 0.0, -89.96897, -40.360737, 56.036366, 29.837717, "160-180 BPM", 812.1251 + shiftx- 15,  403.3092 + shifty - 10, 20);
    FastButton.update();
    if (FastButton.isClicked() || FastPrevClick) {
      FastFill = -1;
      speed = "160-180";
      if(FastButton.isClicked()){
        FastPrevClick = !FastPrevClick;
      }
    } else {
      FastFill = -16056324;
    }
    FastButton.renderWithText();
    
    TwoFourButton = new RectangularButton(TwoFourFill, 0.0, 0,272.31128 + shiftx, 581.696+ shifty, 0.0, -89.96897, -40.360737, 56.036366, 29.837717, "2:4", 272.31128 + shiftx- 15,   581.696+ shifty - 10, 24);
    TwoFourButton.update();
    if (TwoFourButton.isClicked() || TwoFourPrevClick) {
      TwoFourFill = -1;
      time_sig = "2:4";
      if(TwoFourButton.isClicked()){
        TwoFourPrevClick = !TwoFourPrevClick;
      }
    } else {
      TwoFourFill = -16056324;
    }
    TwoFourButton.renderWithText();
    
    ThreeFourButton = new RectangularButton(ThreeFourFill, 0.0, 0,452.2492 + shiftx, 581.696+ shifty, 0.0, -89.96897, -40.360737, 56.036366, 29.837717, "3:4", 452.2492 + shiftx- 15,   581.696+ shifty - 10, 24);
    ThreeFourButton.update();
    if (ThreeFourButton.isClicked() || ThreeFourPrevClick) {
      ThreeFourFill = -1;
      time_sig = "3:4";
      if(ThreeFourButton.isClicked()){
        ThreeFourPrevClick = !ThreeFourPrevClick;
      }
    } else {
      ThreeFourFill = -16056324;
    }
    ThreeFourButton.renderWithText();
    
    FourFourButton = new RectangularButton(FourFourFill, 0.0, 0,632.18713 + shiftx, 581.696+ shifty, 0.0, -89.96897, -40.360737, 56.036366, 29.837717, "4:4", 632.18713 + shiftx- 15,   581.696+ shifty - 10, 24);
    FourFourButton.update();
    if (FourFourButton.isClicked() || FourFourPrevClick) {
      FourFourFill = -1;
      time_sig = "4:4";
      if(FourFourButton.isClicked()){
        FourFourPrevClick = !FourFourPrevClick;
      }
    } else {
      FourFourFill = -16056324;
    }
    FourFourButton.renderWithText();
    
    YesSyncoButton = new RectangularButton(YesSyncoFill, 0.0, 0,360.72906 + shiftx, 763.1851 + shifty, 0.0, -89.96897, -40.360737, 56.036366, 29.837717, "Yes", 360.72906 + shiftx- 15, 763.1851 + shifty- 10, 24);
    YesSyncoButton.update();
    if (YesSyncoButton.isClicked() || YesSyncoPrevClick) {
      YesSyncoFill = -1;
      syncopation = true;
      if(YesSyncoButton.isClicked()){
        YesSyncoPrevClick = !YesSyncoPrevClick;
      }
    } else {
      YesSyncoFill = -16056324;
    }
    YesSyncoButton.renderWithText();
    
    NoSyncoButton = new RectangularButton(NoSyncoFill, 0.0, 0,542.2182 + shiftx, 763.1851 + shifty, 0.0, -89.96897, -40.360737, 56.036366, 29.837717, "No", 542.2182 + shiftx- 15, 763.1851 + shifty- 10, 24);
    NoSyncoButton.update();
    if (NoSyncoButton.isClicked() || NoSyncoPrevClick) {
      NoSyncoFill = -1;
      syncopation = false;
      if(NoSyncoButton.isClicked()){
        NoSyncoPrevClick = !NoSyncoPrevClick;
      }
    } else {
      NoSyncoFill = -16056324;
    }
    NoSyncoButton.renderWithText();
    
    GoButton = new RectangularButton(GoFill, 0.0, 0,812.1251 + shiftx, 812.8232 + shifty, 0.0, -89.96897, -40.360737, 56.036366, 29.837717, "Go!", 812.1251 + shiftx- 15, 812.8232 + shifty- 10, 24);
    GoButton.update();
    if (GoButton.isClicked() || GoPrevClick) {
      GoFill = -1;
      if (genre == "Hip-Hop"){
        Boolean[][] copy_beats = {{true,false,false,false,false,false,false,false,true,false,true,false,false,false,false,false},
          {false,false,false,false,true,false,false,false,false,false,false,false,true,false,false,false}, 
          {false,false,true,false,false,false,true,false,false,false,false,false,false,false,true,false}};
        for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 16; j++) {
          target_beats[i][j] = copy_beats[i][j];
          }
        }  
      }
      if(genre == "Disco/Pop"){
        Boolean[][] copy_beats = {{true,false,false,false,false,false,false,false,true,false,false,false,false,false,false,false},
          {false,false,false,false,true,false,false,false,false,false,false,false,true,false,false,false},
          {true,false,true,false,false,false,true,false,true,false,true,false,false,false,true,false}};
        for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 16; j++) {
          target_beats[i][j] = copy_beats[i][j];
          }
        }  
      }
      if(genre == "Dubstep"){
        Boolean[][] copy_beats = {{true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false},
          {false,false,false,false,false,false,false,false,true,false,false,false,false,false,false,false},
          {false,false,false,false,true,false,false,false,false,false,false,false,true,false,false,false}};
        for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 16; j++) {
          target_beats[i][j] = copy_beats[i][j];
          }
        }  
      }
       if(genre == "Rock"){
        Boolean[][] copy_beats = {{true,false,true,false,false,false,true,false,true,false,true,false,false,false,true,false},
          {false,false,false,false,true,false,false,false,false,false,false,false,true,false,false,false},
          {true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false}};
        for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 16; j++) {
          target_beats[i][j] = copy_beats[i][j];
          }
        }  
      }
      if(GoButton.isClicked()){
        GoPrevClick = !GoPrevClick;
      }
      goClicked = true;
    } else {
      GoFill = -4162569;
    }
    GoButton.renderWithText();
    
  }
    
  void update() {
    HipHopButton.update();
    
  } 
  
  Boolean[][] getTargetBeats(){
    return target_beats;
  }
  
  String getGenre(){
  return genre;
  }
  
  String getSpeed(){
  return speed;
  }
  
  String getTimeSig(){
  return time_sig;
  }
  
  Boolean isSyncopated(){
  return syncopation;
  }
  
  Boolean isGoClicked(){
    return goClicked;
  }
}
