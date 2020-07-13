import java.awt.Rectangle;
import g4p_controls.*;
String glob_genre = "None";
String glob_speed = "None";
String glob_time_sig = "None";
String glob_synco_str = "None";

Boolean glob_syncopation = false;
Boolean glob_go = false;


//Note: Button clicks do work but take time and work best clicking in the bottom right hand corner

class Quiz{
  
    Boolean[][] target_beats;
    int shiftx = 125;
    int shifty = -80;
    
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
    
    GButton hipHopButton;
    GButton discoPopButton;
    GButton dubstepButton;
    GButton rockButton;
   
    GButton slowButton;
    GButton walkingButton;
    GButton moderateButton;
    GButton heartbeatButton;
    GButton fastButton;
    
    GButton twoFourButton;
    GButton threeFourButton;
    GButton fourFourButton;
    
    GButton yesSyncoButton;
    GButton noSyncoButton;
    
    GButton goButton;
    
  
  Quiz(PApplet papp){
    target_beats = new Boolean[3][16];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 16; j++) {
        target_beats[i][j] = false;
      }
    }
    
    hipHopButton = new GButton(papp, 182.3423 + shiftx, 223.37125+ shifty, 150, 70, "Hip-Hop");
    hipHopButton.addEventHandler(papp, "genreHandler");
    hipHopButton.setVisible(true);
    hipHopButton.setLocalColor(4, color(85,254,255)); //Background Colour
    hipHopButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    hipHopButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    hipHopButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    hipHopButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    discoPopButton = new GButton(papp, 362.28024 + shiftx, 221.82005 + shifty, 150, 70, "Disco/Pop");
    discoPopButton.addEventHandler(papp, "genreHandler");
    discoPopButton.setVisible(true);
    discoPopButton.setLocalColor(4, color(85,254,255)); //Background Colour
    discoPopButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    discoPopButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    discoPopButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    discoPopButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    dubstepButton = new GButton(papp, 542.2182 + shiftx, 223.37125+ shifty, 150, 70, "Dubstep");
    dubstepButton.addEventHandler(papp, "genreHandler");
    dubstepButton.setVisible(true);
    dubstepButton.setLocalColor(4, color(85,254,255)); //Background Colour
    dubstepButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    dubstepButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    dubstepButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    dubstepButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    rockButton = new GButton(papp, 723.70734 + shiftx,  221.82005 + shifty, 150, 70, "Rock");
    rockButton.addEventHandler(papp, "genreHandler");
    rockButton.setVisible(true);
    rockButton.setLocalColor(4, color(85,254,255)); //Background Colour
    rockButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    rockButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    rockButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    rockButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    slowButton = new GButton(papp, 104.78284 + shiftx,  403.3092+ shifty, 150, 70,"60-85 BPM");
    slowButton.addEventHandler(papp, "speedHandler");
    slowButton.setVisible(true);
    slowButton.setLocalColor(4, color(85,254,255)); //Background Colour
    slowButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    slowButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    slowButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    slowButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    walkingButton = new GButton(papp, 272.31128 + shiftx,  403.3092 + shifty, 150, 70,"85-110 BPM");
    walkingButton.addEventHandler(papp, "speedHandler");
    walkingButton.setVisible(true);
    walkingButton.setLocalColor(4, color(85,254,255)); //Background Colour
    walkingButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    walkingButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    walkingButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    walkingButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    moderateButton = new GButton(papp, 450.698 + shiftx,  403.3092 + shifty, 150, 70,"110-135 BPM");
    moderateButton.addEventHandler(papp, "speedHandler");
    moderateButton.setVisible(true);
    moderateButton.setLocalColor(4, color(85,254,255)); //Background Colour
    moderateButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    moderateButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    moderateButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    moderateButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    heartbeatButton = new GButton(papp, 632.18713 + shiftx,  403.3092 + shifty, 150, 70,"135-160 BPM");
    heartbeatButton.addEventHandler(papp, "speedHandler");
    heartbeatButton.setVisible(true);
    heartbeatButton.setLocalColor(4, color(85,254,255)); //Background Colour
    heartbeatButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    heartbeatButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    heartbeatButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    heartbeatButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    fastButton = new GButton(papp, 812.1251 + shiftx,  403.3092 + shifty, 150, 70,"160-180 BPM");
    fastButton.addEventHandler(papp, "speedHandler");
    fastButton.setVisible(true);
    fastButton.setLocalColor(4, color(85,254,255)); //Background Colour
    fastButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    fastButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    fastButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    fastButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    twoFourButton = new GButton(papp, 272.31128 + shiftx, 581.696+ shifty, 150, 70,"2:4");
    twoFourButton.addEventHandler(papp, "timeSigHandler");
    twoFourButton.setVisible(true);
    twoFourButton.setLocalColor(4, color(85,254,255)); //Background Colour
    twoFourButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    twoFourButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    twoFourButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    twoFourButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    threeFourButton = new GButton(papp, 452.2492 + shiftx, 581.696+ shifty, 150, 70,"3:4");
    threeFourButton.addEventHandler(papp, "timeSigHandler");
    threeFourButton.setVisible(true);
    threeFourButton.setLocalColor(4, color(85,254,255)); //Background Colour
    threeFourButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    threeFourButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    threeFourButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    threeFourButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    fourFourButton = new GButton(papp, 632.18713 + shiftx, 581.696+ shifty, 150, 70,"4:4");
    fourFourButton.addEventHandler(papp, "timeSigHandler");
    fourFourButton.setVisible(true);
    fourFourButton.setLocalColor(4, color(85,254,255)); //Background Colour
    fourFourButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    fourFourButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    fourFourButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    fourFourButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    yesSyncoButton = new GButton(papp,360.72906 + shiftx, 763.1851 + shifty, 150, 70,"Yes");
    yesSyncoButton.addEventHandler(papp, "syncoHandler");
    yesSyncoButton.setVisible(true);
    yesSyncoButton.setLocalColor(4, color(85,254,255)); //Background Colour
    yesSyncoButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    yesSyncoButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    yesSyncoButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    yesSyncoButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
  
    noSyncoButton = new GButton(papp, 542.2182 + shiftx, 763.1851 + shifty, 150, 70, "No");
    noSyncoButton.addEventHandler(papp, "syncoHandler");
    noSyncoButton.setVisible(true);
    noSyncoButton.setLocalColor(4, color(85,254,255)); //Background Colour
    noSyncoButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    noSyncoButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    noSyncoButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    noSyncoButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    goButton = new GButton(papp, 812.1251 + shiftx, 808.8232 + shifty, 150, 70, "Go!");
    goButton.addEventHandler(papp, "goHandler");
    goButton.setVisible(true);
    goButton.setLocalColor(4, color(152,50,255)); //Background Colour
    goButton.setLocalColor(6, color(177,126,254)); //Background Hover Colour
    goButton.setLocalColor(14, color(177,126,254)); //Background Selected Colour
    goButton.setLocalColor(3, color(83,75,255)); //Boarder Colour
    goButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
}
  
  
  void render(){
    background(-14079703);
    textSize(32);
    fill(225);
    text("Tell me about beat you want to create!", 350, 35);
    text("What Genre?", 550, 95);
    text("Speed in Beats per Minute (BPM)?", 400, 275);
    text("Time Signature?", 520, 455);
    text("Add Syncopation?", 520, 635);
    
    // When go button is pressed hid all buttons for next render
    if(glob_go){
      hipHopButton.setVisible(false);
      discoPopButton.setVisible(false);
      dubstepButton.setVisible(false);
      rockButton.setVisible(false);
      slowButton.setVisible(false);
      walkingButton.setVisible(false);
      moderateButton.setVisible(false);
      heartbeatButton.setVisible(false);
      fastButton.setVisible(false);
      twoFourButton.setVisible(false);
      threeFourButton.setVisible(false);
      fourFourButton.setVisible(false);
      yesSyncoButton.setVisible(false);
      noSyncoButton.setVisible(false); 
      goButton.setVisible(false);
    }
    
    if(glob_genre == "Hip-Hop"){
      hipHopButton.setLocalColor(4, color(255,255,255));
      discoPopButton.setLocalColor(4, color(85,254,255));
      dubstepButton.setLocalColor(4, color(85,254,255));
      rockButton.setLocalColor(4, color(85,254,255));}
   
     else if(glob_genre == "Disco/Pop"){
      hipHopButton.setLocalColor(4, color(85,254,255));
      discoPopButton.setLocalColor(4, color(255,255,255));
      dubstepButton.setLocalColor(4, color(85,254,255));
      rockButton.setLocalColor(4, color(85,254,255));}
   
    else if(glob_genre == "Dubstep"){
      hipHopButton.setLocalColor(4, color(85,254,255));
      discoPopButton.setLocalColor(4, color(85,254,255));
      dubstepButton.setLocalColor(4, color(255,255,255));
      rockButton.setLocalColor(4, color(85,254,255));}
   
   else if(glob_genre == "Rock"){
      hipHopButton.setLocalColor(4, color(85,254,255));
      discoPopButton.setLocalColor(4, color(85,254,255));
      dubstepButton.setLocalColor(4, color(85,254,255));
      rockButton.setLocalColor(4, color(255,255,255));}
      
   if(glob_speed == "60-85 BPM"){
      slowButton.setLocalColor(4, color(255,255,255));
      walkingButton.setLocalColor(4, color(85,254,255));
      moderateButton.setLocalColor(4, color(85,254,255));
      heartbeatButton.setLocalColor(4, color(85,254,255));
      fastButton.setLocalColor(4, color(85,254,255));}
      
   else if(glob_speed == "85-110 BPM"){
      slowButton.setLocalColor(4, color(85,254,255));
      walkingButton.setLocalColor(4, color(255,255,255));
      moderateButton.setLocalColor(4, color(85,254,255));
      heartbeatButton.setLocalColor(4, color(85,254,255));
      fastButton.setLocalColor(4, color(85,254,255));}
   
   else if(glob_speed == "110-135 BPM"){
      slowButton.setLocalColor(4, color(85,254,255));
      walkingButton.setLocalColor(4, color(85,254,255));
      moderateButton.setLocalColor(4, color(255,255,255));
      heartbeatButton.setLocalColor(4, color(85,254,255));
      fastButton.setLocalColor(4, color(85,254,255));}
      
   else if(glob_speed == "135-160 BPM"){
      slowButton.setLocalColor(4, color(85,254,255));
      walkingButton.setLocalColor(4, color(85,254,255));
      moderateButton.setLocalColor(4, color(85,254,255));
      heartbeatButton.setLocalColor(4, color(255,255,255));
      fastButton.setLocalColor(4, color(85,254,255));}
      
   else if(glob_speed == "160-180 BPM"){
      slowButton.setLocalColor(4, color(85,254,255));
      walkingButton.setLocalColor(4, color(85,254,255));
      moderateButton.setLocalColor(4, color(85,254,255));
      heartbeatButton.setLocalColor(4, color(85,254,255));
      fastButton.setLocalColor(4, color(255,255,255));}
      
   if(glob_time_sig == "2:4"){
      twoFourButton.setLocalColor(4, color(255,255,255));
      threeFourButton.setLocalColor(4, color(85,254,255));
      fourFourButton.setLocalColor(4, color(85,254,255));}
      
   else if(glob_time_sig == "3:4"){
      twoFourButton.setLocalColor(4, color(85,254,255));
      threeFourButton.setLocalColor(4, color(255,255,255));
      fourFourButton.setLocalColor(4, color(85,254,255));}

  else if(glob_time_sig == "4:4"){
      twoFourButton.setLocalColor(4, color(85,254,255));
      threeFourButton.setLocalColor(4, color(85,254,255));
      fourFourButton.setLocalColor(4, color(255,255,255));}
      
   if (glob_synco_str == "Yes"){
       glob_syncopation = true;
      yesSyncoButton.setLocalColor(4, color(255,255,255));
      noSyncoButton.setLocalColor(4, color(85,254,255));}
    
   else if (glob_synco_str == "No"){
      glob_syncopation = false;
      yesSyncoButton.setLocalColor(4, color(85,254,255));
      noSyncoButton.setLocalColor(4, color(255,255,255));} 
    
  }
 
  
  Boolean[][] getTargetBeats(){
    if (glob_genre == "Hip-Hop"){
        Boolean[][] copy_beats = {{true,false,false,false,false,false,false,false,true,false,true,false,false,false,false,false},
          {false,false,false,false,true,false,false,false,false,false,false,false,true,false,false,false}, 
          {false,false,true,false,false,false,true,false,false,false,false,false,false,false,true,false}};
        for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 16; j++) {
          target_beats[i][j] = copy_beats[i][j];
          }
        }  
      }
      if(glob_genre == "Disco/Pop"){
        Boolean[][] copy_beats = {{true,false,false,false,false,false,false,false,true,false,false,false,false,false,false,false},
          {false,false,false,false,true,false,false,false,false,false,false,false,true,false,false,false},
          {true,false,true,false,false,false,true,false,true,false,true,false,false,false,true,false}};
        for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 16; j++) {
          target_beats[i][j] = copy_beats[i][j];
          }
        }  
      }
      if(glob_genre == "Dubstep"){
        Boolean[][] copy_beats = {{true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false},
          {false,false,false,false,false,false,false,false,true,false,false,false,false,false,false,false},
          {false,false,false,false,true,false,false,false,false,false,false,false,true,false,false,false}};
        for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 16; j++) {
          target_beats[i][j] = copy_beats[i][j];
          }
        }  
      }
       if(glob_genre == "Rock"){
        Boolean[][] copy_beats = {{true,false,true,false,false,false,true,false,true,false,true,false,false,false,true,false},
          {false,false,false,false,true,false,false,false,false,false,false,false,true,false,false,false},
          {true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false}};
        for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 16; j++) {
          target_beats[i][j] = copy_beats[i][j];
          }
        }  
      }
    return target_beats;
  }
  
  String getGenre(){
  return glob_genre;
  }
  
  String getSpeed(){
  return glob_speed;
  }
  
  String getTimeSig(){
  return glob_time_sig;
  }
  
  Boolean isSyncopated(){
  return glob_syncopation;
  }
  
  Boolean isGoClicked(){
    return glob_go;
  }
}

public void genreHandler(GButton button, GEvent event) {
    if (button.getText() == "Hip-Hop"){glob_genre = "Hip-Hop";}
    if (button.getText() == "Disco/Pop"){glob_genre = "Disco/Pop";}
    if (button.getText() == "Dubstep"){glob_genre = "Dubstep";}
    if (button.getText() == "Rock") {glob_genre = "Rock";}    
  }
  
public void speedHandler(GButton button, GEvent event) {
    if (button.getText() == "60-85 BPM"){glob_speed = "60-85 BPM";}
    if (button.getText() == "85-110 BPM"){glob_speed = "85-110 BPM";}
    if (button.getText() == "110-135 BPM"){glob_speed = "110-135 BPM";}
    if (button.getText() == "135-160 BPM") {glob_speed = "135-160 BPM";}
    if (button.getText() == "160-180 BPM") {glob_speed = "160-180 BPM";}
  }
  
public void timeSigHandler(GButton button, GEvent event) {
    if (button.getText() == "2:4"){glob_time_sig = "2:4";}
    if (button.getText() == "3:4"){glob_time_sig = "3:4";}
    if (button.getText() == "4:4"){glob_time_sig = "4:4";}
  }
  
public void syncoHandler(GButton button, GEvent event) {
    if (button.getText() == "Yes"){glob_synco_str = "Yes";}
    if (button.getText() == "No"){glob_synco_str = "No";}
  }

public void goHandler(GButton button, GEvent event) {
    glob_go = true;
  }
