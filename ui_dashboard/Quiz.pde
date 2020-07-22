import java.awt.Rectangle;
import g4p_controls.*;
String glob_genre = "None";
String glob_speed = "None";
String glob_time_sig = "None";
String glob_synco_str = "None";

Boolean glob_syncopation = false;
Boolean glob_go = false;
int startTimeQuiz = 0; // in milliseconds 
int endTimeQuiz = 0; // in milliseconds 

class Quiz{
  
    int[][] target_beats;
    int shiftx = 125;
    int shifty = 20;
    
    GButton hipHopButton;
    GButton discoPopButton;
    GButton dubstepButton;
    GButton rockButton;
   
    GButton slowButton;
    GButton walkingButton;
    GButton moderateButton;
    GButton heartbeatButton;
    GButton fastButton;
    
    GButton yesSyncoButton;
    GButton noSyncoButton;
    
    GButton goButton;
    
  
  Quiz(PApplet papp, Boolean isBeginner){
    target_beats = new int[3][16];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 16; j++) {
        target_beats[i][j] = 0;
      }
    }
    
    // start timer showing user has started the quiz 
    startTimeQuiz = millis();
    
    hipHopButton = new GButton(papp, 182.3423 + shiftx, 223.37125+ shifty, 150, 70, "Hip-Hop");
    hipHopButton.addEventHandler(papp, "genreHandler");
    hipHopButton.setVisible(false);
    hipHopButton.setLocalColor(4, color(85,254,255)); //Background Colour
    hipHopButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    hipHopButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    hipHopButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    hipHopButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    discoPopButton = new GButton(papp, 362.28024 + shiftx, 221.82005 + shifty, 150, 70, "Disco/Pop");
    discoPopButton.addEventHandler(papp, "genreHandler");
    discoPopButton.setVisible(false);
    discoPopButton.setLocalColor(4, color(85,254,255)); //Background Colour
    discoPopButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    discoPopButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    discoPopButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    discoPopButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    dubstepButton = new GButton(papp, 542.2182 + shiftx, 223.37125+ shifty, 150, 70, "Dubstep");
    dubstepButton.addEventHandler(papp, "genreHandler");
    dubstepButton.setVisible(false);
    dubstepButton.setLocalColor(4, color(85,254,255)); //Background Colour
    dubstepButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    dubstepButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    dubstepButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    dubstepButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    rockButton = new GButton(papp, 723.70734 + shiftx,  221.82005 + shifty, 150, 70, "Rock");
    rockButton.addEventHandler(papp, "genreHandler");
    rockButton.setVisible(false);
    rockButton.setLocalColor(4, color(85,254,255)); //Background Colour
    rockButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    rockButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    rockButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    rockButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    if(isBeginner){slowButton = new GButton(papp, 104.78284 + shiftx,  403.3092+ shifty, 150, 70,"Slow");}
    if(!isBeginner){slowButton = new GButton(papp, 104.78284 + shiftx,  403.3092+ shifty, 150, 70,"60-85 BPM");}
    slowButton.addEventHandler(papp, "speedHandler");
    slowButton.setVisible(false);
    slowButton.setLocalColor(4, color(85,254,255)); //Background Colour
    slowButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    slowButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    slowButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    slowButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    if(isBeginner){walkingButton = new GButton(papp, 272.31128 + shiftx,  403.3092 + shifty, 150, 70,"Walking Pace");}
    if(!isBeginner){walkingButton = new GButton(papp, 272.31128 + shiftx,  403.3092 + shifty, 150, 70,"85-110 BPM");}
    walkingButton.addEventHandler(papp, "speedHandler");
    walkingButton.setVisible(false);
    walkingButton.setLocalColor(4, color(85,254,255)); //Background Colour
    walkingButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    walkingButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    walkingButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    walkingButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    if(isBeginner){moderateButton = new GButton(papp, 450.698 + shiftx,  403.3092 + shifty, 150, 70,"Moderate");}
    if(!isBeginner){moderateButton = new GButton(papp, 450.698 + shiftx,  403.3092 + shifty, 150, 70,"110-135 BPM");}
    moderateButton.addEventHandler(papp, "speedHandler");
    moderateButton.setVisible(false);
    moderateButton.setLocalColor(4, color(85,254,255)); //Background Colour
    moderateButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    moderateButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    moderateButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    moderateButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    if(isBeginner){heartbeatButton = new GButton(papp, 632.18713 + shiftx,  403.3092 + shifty, 150, 70,"Heartbeat Pace");}
    if(!isBeginner){heartbeatButton = new GButton(papp, 632.18713 + shiftx,  403.3092 + shifty, 150, 70,"135-160 BPM");}
    heartbeatButton.addEventHandler(papp, "speedHandler");
    heartbeatButton.setVisible(false);
    heartbeatButton.setLocalColor(4, color(85,254,255)); //Background Colour
    heartbeatButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    heartbeatButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    heartbeatButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    heartbeatButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    if(isBeginner){fastButton = new GButton(papp, 812.1251 + shiftx,  403.3092 + shifty, 150, 70,"Fast");}
    if(!isBeginner){fastButton = new GButton(papp, 812.1251 + shiftx,  403.3092 + shifty, 150, 70,"160-180 BPM");}
    fastButton.addEventHandler(papp, "speedHandler");
    fastButton.setVisible(false);
    fastButton.setLocalColor(4, color(85,254,255)); //Background Colour
    fastButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    fastButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    fastButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    fastButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    if(isBeginner){yesSyncoButton = new GButton(papp,360.72906 + shiftx, 763.1851 + shifty -180, 150, 70,"Off Beat");}
    if(!isBeginner){yesSyncoButton = new GButton(papp,360.72906 + shiftx, 763.1851 + shifty-180, 150, 70,"Yes");}
    yesSyncoButton.addEventHandler(papp, "syncoHandler");
    yesSyncoButton.setVisible(false);
    yesSyncoButton.setLocalColor(4, color(85,254,255)); //Background Colour
    yesSyncoButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    yesSyncoButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    yesSyncoButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    yesSyncoButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
  
    if(isBeginner){noSyncoButton = new GButton(papp, 542.2182 + shiftx, 763.1851 + shifty-180, 150, 70, "Strong Beat");}
    if(!isBeginner){noSyncoButton = new GButton(papp, 542.2182 + shiftx, 763.1851 + shifty-180, 150, 70, "No");}
    noSyncoButton.addEventHandler(papp, "syncoHandler");
    noSyncoButton.setVisible(false);
    noSyncoButton.setLocalColor(4, color(85,254,255)); //Background Colour
    noSyncoButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    noSyncoButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    noSyncoButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
    noSyncoButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    goButton = new GButton(papp, 812.1251 + shiftx - 20, 808.8232 -80 -10, 150, 70, "Go!");
    goButton.addEventHandler(papp, "goHandler");
    goButton.setVisible(false);
    goButton.setLocalColor(4, color(187, 134, 252)); //Background Colour
    goButton.setLocalColor(6, color(177,126,254)); //Background Hover Colour
    goButton.setLocalColor(14, color(177,126,254)); //Background Selected Colour
    goButton.setLocalColor(3, color(83,75,255)); //Boarder Colour
    goButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
}
  
  
  void render(boolean isBeginner){
    background(-14079703);
    textSize(32);
    fill(225);
    text("Tell me about beat you want to create!", 370, 35+100);
    text("What Genre?", 550, 95+100);
    
    beginnerButton.setVisible(false);
    expertButton.setVisible(false);
    
    if(isBeginner){
      text("Speed of the beat?", 500, 275+100);
      text("Where do you want the down beat? (Syncopation)", 260, 455+100);
    }
    if(!isBeginner){
      text("Speed in Beats per Minute (BPM)?", 400, 275+100);
      text("Add Syncopation?", 520, 455+100);
    }
    
    if(isBeginner){slowButton.setText("Slow");}
    if(!isBeginner){slowButton.setText("60-85 BPM");}
    
    if(isBeginner){walkingButton.setText("Walking Pace");}
    if(!isBeginner){walkingButton.setText("85-110 BPM");}
    
    if(isBeginner){moderateButton.setText("Moderate");}
    if(!isBeginner){moderateButton.setText("110-135 BPM");}
    
    if(isBeginner){heartbeatButton.setText("Heartbeat Pace");}
    if(!isBeginner){heartbeatButton.setText("135-160 BPM");}
    
    if(isBeginner){fastButton.setText("Fast");}
    if(!isBeginner){fastButton.setText("160-180 BPM");}
    
    if(isBeginner){yesSyncoButton.setText("Off Beat");}
    if(!isBeginner){yesSyncoButton.setText("Yes");}
    
    if(isBeginner){noSyncoButton.setText("Strong Beat");}
    if(!isBeginner){noSyncoButton.setText("No");}
    
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
      yesSyncoButton.setVisible(false);
      noSyncoButton.setVisible(false); 
      goButton.setVisible(false);
    } else {
       hipHopButton.setVisible(true);
      discoPopButton.setVisible(true);
      dubstepButton.setVisible(true);
      rockButton.setVisible(true);
      slowButton.setVisible(true);
      walkingButton.setVisible(true);
      moderateButton.setVisible(true);
      heartbeatButton.setVisible(true);
      fastButton.setVisible(true);
      yesSyncoButton.setVisible(true);
      noSyncoButton.setVisible(true); 
      goButton.setVisible(true);
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
      
   if (glob_synco_str == "Yes"){
       glob_syncopation = true;
      yesSyncoButton.setLocalColor(4, color(255,255,255));
      noSyncoButton.setLocalColor(4, color(85,254,255));}
    
   else if (glob_synco_str == "No"){
      glob_syncopation = false;
      yesSyncoButton.setLocalColor(4, color(85,254,255));
      noSyncoButton.setLocalColor(4, color(255,255,255));} 
    
  }
 
  
  int[][] getTargetBeats(){
    if (glob_genre == "Hip-Hop"){
        int[][] copy_beats = {{1,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0},
          {0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0}, 
          {0,0,1,0,0,0,1,0,0,0,0,0,0,0,1,0}};
        for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 16; j++) {
          target_beats[i][j] = copy_beats[i][j];
          }
        }  
      }
      if(glob_genre == "Disco/Pop"){
        int[][] copy_beats = {{1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0},
          {0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0},
          {1,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0}};
        for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 16; j++) {
          target_beats[i][j] = copy_beats[i][j];
          }
        }  
      }
      if(glob_genre == "Dubstep"){
        int[][] copy_beats = {{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
          {0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0},
          {0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0}};
        for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 16; j++) {
          target_beats[i][j] = copy_beats[i][j];
          }
        }  
      }
       if(glob_genre == "Rock"){
        int[][] copy_beats = {{1,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0},
          {0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0},
          {1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0}};
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
  
  int timeToCompleteQuiz() {
    //print("endtimequiz: " + endTimeQuiz + "\n");
    //print("starttimequiz: " + startTimeQuiz + "\n");
    //print("timeToCompleteQuiz: " + (startTimeQuiz - endTimeQuiz) + "\n");
    return (endTimeQuiz - startTimeQuiz);
  }
  
  int getStartTimeQuiz() {
    return startTimeQuiz;
  }
  
  void resetStartTimeQuiz() {
    startTimeQuiz = millis();
  }
  
  void clearButtons(){
    hipHopButton.setVisible(false);
    discoPopButton.setVisible(false);
    dubstepButton.setVisible(false);
    rockButton.setVisible(false);
    slowButton.setVisible(false);
    walkingButton.setVisible(false);
    moderateButton.setVisible(false);
    heartbeatButton.setVisible(false);
    fastButton.setVisible(false);
    yesSyncoButton.setVisible(false);
    noSyncoButton.setVisible(false);
    goButton.setVisible(false);
  }
}

public void genreHandler(GButton button, GEvent event) {
    if (button.getText() == "808 Beats" || button.getText() == "Hip-Hop"){glob_genre = "Hip-Hop";}
    if (button.getText() == "Radio Hits" || button.getText() == "Disco/Pop"){glob_genre = "Disco/Pop";}
    if (button.getText() == "Dance Club" || button.getText() == "Dubstep"){glob_genre = "Dubstep";}
    if (button.getText() == "Rock'n Roll" || button.getText() =="Rock") {glob_genre = "Rock";}    
  }
  
public void speedHandler(GButton button, GEvent event) {
    if (button.getText() == "Slow" || button.getText() =="60-85 BPM"){glob_speed = "60-85 BPM";}
    if (button.getText() == "Walking Pace" || button.getText() =="85-110 BPM"){glob_speed = "85-110 BPM";}
    if (button.getText() == "Moderate" || button.getText() == "110-135 BPM"){glob_speed = "110-135 BPM";}
    if (button.getText() == "Heartbeat Pace" || button.getText() == "135-160 BPM") {glob_speed = "135-160 BPM";}
    if (button.getText() == "Fast" || button.getText() =="160-180 BPM") {glob_speed = "160-180 BPM";}
  }
  
public void syncoHandler(GButton button, GEvent event) {
    if (button.getText() == "Off Beat" || button.getText() == "Yes"){glob_synco_str = "Yes";}
    if (button.getText() == "Strong Beat" || button.getText() =="No"){glob_synco_str = "No";}
  }

public void goHandler(GButton button, GEvent event) {
    glob_go = true;
    // set timer showing user has ended the quiz
    endTimeQuiz = millis();
  }
