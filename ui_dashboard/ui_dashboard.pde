import g4p_controls.*;

PrintWriter output; // used for testing purposes to record user data 
boolean addABeat = false;
boolean renderLandingPage = true;
boolean renderAddInstrument = false;
LinearBeatCreation createLinearBeat;
CircularBeatCreation createCircularBeat;
ThisOrThat thisOrThat;
AddInstrument add;

DrumBeats beats;
Quiz createQuiz;
Dashboard createDash;

//Variables for loading bar
int per = 0;

color addABeatHighlight; 
color addABeatColor; 
int addABeatX;
int addABeatY;
int addABeatRadius = 85; 
color testColor = color(204);
boolean renderAddABeat = false;
boolean renderLinearBeat = false;
boolean renderCircularBeat = false;
boolean renderQuiz = false;
boolean renderDash = false;
boolean renderThisOrThat = false;
boolean renderLoadingBar = false;
Boolean fillBeat = false;
Boolean addABeatClicked = false;
boolean isBeginner = true;
boolean renderSkillLevelSelect = false;

// needed for user testing 
boolean hasPrintedOutQuizCompletionTimeAlready = false;
int numberOfTimesUserPressedGenerateNewBeats = 0;

PImage dashImg;
PImage landingImg;

String target_genre = "None";
String target_speed = "None";
String target_time_sig = "None";
Boolean target_syncopation = false;
int[][] target_beats;

// Buttons
GButton startCreating;
GButton expertButton; 
GButton beginnerButton;
GButton switchSkillLevelButton;
BeatPopulation gaBeatPopulation1;
BeatPopulation gaBeatPopulation2;
DrumBeats originalGABeat;
GButton getHelpFromAlgorithm;
GButton save; 
GButton cancel;
GButton addABeatButton;
DrumBeats gaBeat1;
DrumBeats gaBeat2;

GButton addInstrument1;
GButton addInstrument2;
GButton addInstrument3;
ArrayList<String> instruments = new ArrayList<String>();
GImageToggleButton playPause;
GImageToggleButton dashPlayButton1;
GImageToggleButton dashPlayButton2;
GImageToggleButton dashPlayButton3;
GCustomSlider tempoSlider;

boolean kickSelected = false;
boolean hatSelected = false;
boolean snareSelected = false;

int numInst = 0;

// main teal color -  3, 218, 198
// main purple color - 187, 134, 252
GImageButton p;
  
void setup(){
   size(1300, 800);
   
   // Create a new file in the sketch directory
   output = createWriter("userTestingData.txt"); 
  
   playPause = new GImageToggleButton(this, 400, 15 ,"PlayPause.png",2);
   playPause.addEventHandler(this, "audioHandler");
   playPause.setVisible(false);

   tempoSlider = new GCustomSlider(this, 700,632.5511, 250, 50, null);
   tempoSlider.setLocalColor(5, color(231, 254, 252));
   tempoSlider.setLocalColor(3, color(3,218,198));
   tempoSlider.setLocalColor(11, color(155, 253, 243));
   tempoSlider.setLocalColor(14, color(133, 250, 240));
   tempoSlider.setLocalColor(15, color(9, 220, 203));
   tempoSlider.setLocalColor(2, color(255));
   tempoSlider.setVisible(false);
   tempoSlider.addEventHandler(this, "tempoSliderEventHandler");
   tempoSlider.setOpaque(true);
   tempoSlider.setLimits(60,180);
   //frame rate for animations
   frameRate(500);
   
   beats = new DrumBeats(this,3,16);
   beats.audioSetup();
   beats.mute();
   createQuiz = new Quiz(this, isBeginner); 
   createDash = new Dashboard(this);
   createLinearBeat = new LinearBeatCreation(beats, this);
   createCircularBeat = new CircularBeatCreation(beats, this);
   thisOrThat = new ThisOrThat(beats, this);   
   dashImg = loadImage("Dashboard.png");
   landingImg = loadImage("TonicLandingPage.PNG");
   
   dashPlayButton1 = new GImageToggleButton(this, 200, 70 ,"PlayPause.png",2);
   dashPlayButton1.addEventHandler(this, "audioHandler");
   dashPlayButton1.setVisible(false);
   
   dashPlayButton2 = new GImageToggleButton(this, 75, 130 ,"PlayPauseSmall.png",2);
   dashPlayButton2.addEventHandler(this, "audioHandler");
   dashPlayButton2.setVisible(false);
   
   dashPlayButton3 = new GImageToggleButton(this, 265, 250 ,"PlayPauseSmall.png",2);
   dashPlayButton3.addEventHandler(this, "audioHandler");
   dashPlayButton3.setVisible(false);
   
   addABeatButton = new GButton(this, 310, 90, 120, 50, "Add Beat");
   addABeatButton.addEventHandler(this, "addABeatHandler");
   addABeatButton.setFont(new Font("Gothic A1", Font.PLAIN, 25));
   addABeatButton.setVisible(false);
   
   beginnerButton = new GButton(this, 362.28024 + 125, 403.3092 -80, 150, 70, "Beginner");
   beginnerButton.addEventHandler(this, "beginnerExpertHandler");
   beginnerButton.setVisible(false);
   beginnerButton.setLocalColor(4, color(85,254,255)); //Background Colour
   beginnerButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
   beginnerButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
   beginnerButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
   beginnerButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
  
   expertButton = new GButton(this, 542.2182 + 125, 403.3092 -80, 150, 70, "Moderate/Expert");
   expertButton.addEventHandler(this, "beginnerExpertHandler");
   expertButton.setVisible(false);
   expertButton.setLocalColor(4, color(85,254,255)); //Background Colour
   expertButton.setLocalColor(6, color(170,255,255)); //Background Hover Colour
   expertButton.setLocalColor(14, color(170,255,255)); //Background Selected Colour
   expertButton.setLocalColor(3, color(40,230,255)); //Boarder Colour
   expertButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
   
   switchSkillLevelButton = new GButton(this, 250, 808.8232 -80 -10, 150, 70, "Back");
   switchSkillLevelButton.addEventHandler(this, "switchSkillLevelHandler");
   switchSkillLevelButton.setLocalColor(4, color(187, 134, 252)); //Background Colour
   switchSkillLevelButton.setLocalColor(6, color(177,126,254)); //Background Hover Colour
   switchSkillLevelButton.setLocalColor(14, color(177,126,254)); //Background Selected Colour
   switchSkillLevelButton.setLocalColor(3, color(83,75,255)); //Boarder Colour
   switchSkillLevelButton.setFont(new Font("Gothic A1", Font.PLAIN, 30));
   switchSkillLevelButton.setVisible(false);

   save = new GButton(this, 1010, 720, 120, 50, "Save");
   save.addEventHandler(this, "saveHandler");
   save.setLocalColor(2, color(41,41,41)); //text color
   save.setLocalColor(3, color(51,174,100)); //border colour
   save.setLocalColor(4, color(51,174,100)); //background color
   save.setFont(new Font("Gothic A1", Font.PLAIN, 30));
   save.setVisible(false);
   
   cancel = new GButton(this, 1150, 720, 120, 50, "Cancel");
   cancel.addEventHandler(this, "cancelHandler");
   cancel.setLocalColor(2, color(41,41,41)); //text color
   cancel.setLocalColor(3, color(239,76,86)); //border colour
   cancel.setLocalColor(4, color(239,76,86)); //background colour
   cancel.setFont(new Font("Gothic A1", Font.PLAIN, 30));
   cancel.setVisible(false);

   startCreating = new GButton(this, 475,550, 350, 50, "Start Creating");
   startCreating.addEventHandler(this, "startCreatingHandler");
   startCreating.setLocalColor(2, color(41,41,41)); //text color
   startCreating.setLocalColor(3, color(66,65,62)); //border colour
   startCreating.setLocalColor(4, color(187, 134, 252)); //background color
   startCreating.setFont(new Font("Gothic A1", Font.PLAIN, 24));
   
   getHelpFromAlgorithm = new GButton(this, 950, 450, 320, 60, "Get Help from Algorithm");
   getHelpFromAlgorithm.addEventHandler(this, "getHelpFromAlgorithmHandler");
   getHelpFromAlgorithm.setLocalColor(2, color(41,41,41)); //text color
   getHelpFromAlgorithm.setLocalColor(3, color(51,174,100)); //border colour
   getHelpFromAlgorithm.setLocalColor(4, color(3, 218, 198)); //background color
   getHelpFromAlgorithm.setFont(new Font("Gothic A1", Font.PLAIN, 25));
   getHelpFromAlgorithm.setVisible(false);   

   gaBeat1 = new DrumBeats(this,3,16);
   gaBeat1.audioSetup();
   gaBeat1.mute();
   
   gaBeat2 = new DrumBeats(this,3,16);
   gaBeat2.audioSetup();
   gaBeat2.mute();
   
   add = new AddInstrument(this,instruments );
   
   originalGABeat = new DrumBeats(this,3,16);
   // Create a population with a mutation rate, population size, number of instruments,
   // length of beat, and the original user-created beat.
   gaBeatPopulation1 = new BeatPopulation(
      0.01, 50,
      gaBeat1.beats.length, gaBeat1.beats[0].length
    );
    gaBeatPopulation2 = new BeatPopulation(
      0.10, 50,
      gaBeat1.beats.length, gaBeat1.beats[0].length
    );


    //setup add instrument functionality
    addInstrument1 = new GButton(this, 50.847015, 607.5735, 151.57673, 69.9552, "Add Instrument");
    addInstrument1.addEventHandler(this, "instrHandler");
    addInstrument1.setVisible(false);
    addInstrument1.setLocalColor(4, -1); //Background Colour
    addInstrument1.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    addInstrument1.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    addInstrument1.setLocalColor(3, color(40,230,255)); //Boarder Colour
    addInstrument1.setFont(new Font("Gothic A1", Font.PLAIN, 20));

    addInstrument2 = new GButton(this, 255.53064, 607.5735, 150, 69.9552, "Add Instrument");
    addInstrument2.addEventHandler(this, "instrHandler");
    addInstrument2.setVisible(false);
    addInstrument2.setLocalColor(4, -1); //Background Colour
    addInstrument2.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    addInstrument2.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    addInstrument2.setLocalColor(3, color(40,230,255)); //Boarder Colour
    addInstrument2.setFont(new Font("Gothic A1", Font.PLAIN, 20));

    
    addInstrument3 = new GButton(this, 465.3961,607.5735, 150, 69.9552, "Add Instrument");
    addInstrument3.addEventHandler(this, "instrHandler");
    addInstrument3.setVisible(false);
    addInstrument3.setLocalColor(4, -1); //Background Colour
    addInstrument3.setLocalColor(6, color(170,255,255)); //Background Hover Colour
    addInstrument3.setLocalColor(14, color(170,255,255)); //Background Selected Colour
    addInstrument3.setLocalColor(3, color(40,230,255)); //Boarder Colour  
    addInstrument3.setFont(new Font("Gothic A1", Font.PLAIN, 20));
}

void draw(){
  background(-14079703);
  noFill();
  pushMatrix();
  translate(5.50573, -1.295466);
  rotate(0.0);
  popMatrix();

  String[] tempoLabels;

  if (isBeginner) {
    tempoLabels = new String[] {"Slow", "Walking", "Moderate", "Heartbeat", "Fast"};
  } else {
    tempoLabels = new String[] {"60", "85", "110", "135", "160", "180"};
  }

  tempoSlider.setShowTicks(true);
  tempoSlider.setTickLabels(tempoLabels);
  tempoSlider.setShowValue(true);
  tempoSlider.setShowDecor(false, true, true, true);


  if(renderLandingPage) {
    image(landingImg,0,0,1300,800);
  }
  if(renderSkillLevelSelect){
    background(-14079703);
    textSize(32);
    fill(225);
    text("How would you describe you musical skill level?", 300, 275);
    beginnerButton.setVisible(true);
    expertButton.setVisible(true);
  }
  
  if (renderQuiz){
    renderSkillLevelSelect = false;
    createQuiz.render(isBeginner);
    switchSkillLevelButton.setVisible(true);
  }

  if(renderQuiz && createQuiz.isGoClicked()){
    renderQuiz = false;
    renderDash = true;
    target_genre = createQuiz.getGenre();
    target_speed = createQuiz.getSpeed();
    target_time_sig = createQuiz.getTimeSig();
    target_syncopation = createQuiz.isSyncopated();
    target_beats = createQuiz.getTargetBeats();
    if (target_speed.equals("Slow") || target_speed.equals("60-85 BPM")) {beats.setBpm(60); tempoSlider.setValue(0);}
    else if (target_speed.equals("Walking Pace") || target_speed.equals("85-110 BPM")) {beats.setBpm(85); tempoSlider.setValue(1);}
    else if (target_speed.equals("Moderate") || target_speed.equals("110-135 BPM")) {beats.setBpm(110); tempoSlider.setValue(2);}
    else if (target_speed.equals("Heartbeat Pace") || target_speed.equals("135-160 BPM")) {beats.setBpm(135); tempoSlider.setValue(3);}
    else if (target_speed.equals("Fast") || target_speed.equals("160-180 BPM")) {beats.setBpm(160); tempoSlider.setValue(4);}
  }
  
  if (renderDash) {
   if (!hasPrintedOutQuizCompletionTimeAlready) {
     // only print out the time it took to complete the quiz once 
     output.println("Time to complete quiz (milliseconds): " + createQuiz.timeToCompleteQuiz()); // Write testing data to file 
     output.flush();
     hasPrintedOutQuizCompletionTimeAlready = true;
   }
   beginnerButton.setVisible(false);
   expertButton.setVisible(false);
   switchSkillLevelButton.setVisible(false);
   createDash.render(fillBeat);
   renderAddABeat = true;
   addABeatButton.setVisible(true);
   dashPlayButton1.setVisible(true);
  }
  
  if (addABeatClicked) {
   renderDash = false;
   renderAddABeat = false;
   renderLinearBeat = true;
   addABeatClicked = false;
   addABeatButton.setVisible(false);
   dashPlayButton1.setVisible(false);
   dashPlayButton2.setVisible(false);
   dashPlayButton3.setVisible(false);
   createLinearBeat.render(beats);
  }  
   
     if (renderLinearBeat && !createLinearBeat.getRenderLinear()) {
       renderLinearBeat = false;
       renderCircularBeat = true;
       createCircularBeat.setRenderCircular(true);       
     } else if (renderCircularBeat && !createCircularBeat.getRenderCircular()) {
       renderCircularBeat = false;
       renderLinearBeat = true;
       createLinearBeat.setRenderLinear(true);
     }
  if (renderThisOrThat) {
    thisOrThat.render();
    thisOrThat.update();
    playPause.setVisible(false);
    save.setVisible(false);
    cancel.setVisible(false);
    addInstrument1.setVisible(false);
    addInstrument2.setVisible(false);
    addInstrument3.setVisible(false);
    tempoSlider.setVisible(false);
    getHelpFromAlgorithm.setVisible(false);
  }

  if (renderAddInstrument) {
    add.render(kickSelected, snareSelected, hatSelected);
    playPause.setVisible(false);
    save.setVisible(false);
    cancel.setVisible(false);
    createLinearBeat.hideTextArea();
    createCircularBeat.hideTextArea();
    getHelpFromAlgorithm.setVisible(false);
    addInstrument1.setVisible(false);
    addInstrument2.setVisible(false);
    addInstrument3.setVisible(false);
    tempoSlider.setVisible(false);
  } else if (renderLinearBeat && !createLinearBeat.isAlgorithmButtonSelected()) {
   save.setVisible(true);
   cancel.setVisible(true);
   getHelpFromAlgorithm.setVisible(true);
   createLinearBeat.render(beats);
   beats = createLinearBeat.update();
    playPause.moveTo(400, 15);
     playPause.setVisible(true);
     tempoSlider.setVisible(true);

   if (instruments.size() == 0 ) addInstrument1.setVisible(true);
   if (instruments.size() == 1) addInstrument2.setVisible(true);
   if (instruments.size() == 2) addInstrument3.setVisible(true);

   
   if (!createLinearBeat.isAlgorithmButtonSelected()) playPause.setVisible(true);
   
   if (!createLinearBeat.isAlgorithmButtonSelected()) {
   if (createLinearBeat.isInst1Selected() || createCircularBeat.isInst1Selected()) {
     createLinearBeat.setInst1Selected(true);
     createCircularBeat.setInst1Selected(false);
     createLinearBeat.renderInst1Selector();
   }
   if (createLinearBeat.isInst2Selected() || createCircularBeat.isInst2Selected()) {
     createLinearBeat.setInst2Selected(true);
     createCircularBeat.setInst2Selected(false);
     createLinearBeat.renderInst2Selector();
   }
   if (createLinearBeat.isInst3Selected() || createCircularBeat.isInst3Selected()) {
     createLinearBeat.setInst3Selected(true);
     createCircularBeat.setInst3Selected(false);
     createLinearBeat.renderInst3Selector();
   }
   }
 } else if (renderCircularBeat && !createCircularBeat.isAlgorithmButtonSelected()){
    save.setVisible(true);
    cancel.setVisible(true);
    getHelpFromAlgorithm.setVisible(true);
    createCircularBeat.render(beats);
    beats = createCircularBeat.update();
    playPause.setVisible(true);
    playPause.moveTo(577, 270);
    tempoSlider.setVisible(true);

    createLinearBeat.accentToggle.setVisible(true);
    
    if (instruments.size() == 0 ) addInstrument1.setVisible(true);
    if (instruments.size() == 1) addInstrument2.setVisible(true);
    if (instruments.size() == 2) addInstrument3.setVisible(true);
    
    if (!createCircularBeat.isAlgorithmButtonSelected()) {
    if (createCircularBeat.isInst1Selected() || createLinearBeat.isInst1Selected()) {
     createCircularBeat.setInst1Selected(true);
     createLinearBeat.setInst1Selected(false);
     createCircularBeat.renderInst1Circle();
   }
   if (createCircularBeat.isInst2Selected()|| createLinearBeat.isInst2Selected()) {
     createCircularBeat.setInst2Selected(true);
     createLinearBeat.setInst2Selected(false);
     createCircularBeat.renderInst2Circle();
   }
   if (createCircularBeat.isInst3Selected() || createLinearBeat.isInst3Selected()) {
     createCircularBeat.setInst3Selected(true);
     createLinearBeat.setInst3Selected(false);
     createCircularBeat.renderInst3Circle();
   }
   }
  }  
  
  if ((renderCircularBeat && createCircularBeat.isAlgorithmButtonSelected()) || (renderLinearBeat && createLinearBeat.isAlgorithmButtonSelected())) {
     // algorithm button was selected 
    playPause.setVisible(false);
    save.setVisible(false);
    cancel.setVisible(false);
    tempoSlider.setVisible(false);
    createLinearBeat.accentToggle.setVisible(false);
    getHelpFromAlgorithm.setVisible(false);
    addInstrument1.setVisible(false);
    addInstrument2.setVisible(false);
    addInstrument3.setVisible(false);
    thisOrThat.render();
    thisOrThat.update();
    beats.mute();
   } 
   if (renderLoadingBar == true) {
      //Loading bar created by https://helloacm.com/processing/
      per = (per + 10) % 100;
      strokeWeight(15.0);
      stroke(-16524602);
      line(1.6193323, 563.52765, 1302.2676, 558.3458);
      fill(-13421259);
      strokeWeight(5.0);
      stroke(-16777216);
      pushMatrix();
      translate(649.3523, 303.139);
      rotate(0.0);
      rectMode(CORNERS);
      rect(-190, -73, 200, 73, 10);
      popMatrix();
      stroke(color(252,252,252));
      fill(color(252,252,252));
      textSize(30);
      text("Loading ... " + per + " %", 650, 300);
      if (per == 90) {
        renderLoadingBar = false;
        per = 0;
      }
  }
 }
  
// Event Handlers

public void handleTextEvents(GEditableTextControl textControl, GEvent event) { 
    if (renderCircularBeat) {
           createLinearBeat.updateName(textControl.getText());
           createCircularBeat.updateName(textControl.getText());
        } else {
           createCircularBeat.updateName(textControl.getText());
           createLinearBeat.updateName(textControl.getText());
        }
}
public void audioHandler(GImageToggleButton button, GEvent event) {
  if (!createLinearBeat.isAlgorithmButtonSelected()) beats = createLinearBeat.getBeats();
  if (beats.isMuted()) {
    beats.audioSetup();
    beats.unMute();
  }
  else beats.mute();
}

public void playGA1Handler(GButton button, GEvent event) {
  if (button.getText() == "PLAY") button.setText("PAUSE");
  else button.setText("PLAY");
  if (gaBeat1.isMuted()) gaBeat1.unMute();
  else gaBeat1.mute();
  gaBeat1.setBeats(thisOrThat.getBeat1().getEntireBeat());
  // make sure the other button is muted and set to paused mode
  setGAButton2Text();
  gaBeat2.mute(); 
}

public void playGA2Handler(GButton button, GEvent event) {
  if (button.getText() == "PLAY") button.setText("PAUSE");
  else button.setText("PLAY");
  if (gaBeat2.isMuted()) gaBeat2.unMute();
  else gaBeat2.mute();
  gaBeat2.setBeats(thisOrThat.getBeat2().getEntireBeat());
  // make sure the other button is muted and set to paused mode
  setGAButton1Text();
  gaBeat1.mute(); 
}

public void cancelHandler(GButton button, GEvent event) { 
    renderLinearBeat = false;
    renderCircularBeat = false;
    createLinearBeat.setAlgorithmSelected(false);
    createCircularBeat.setAlgorithmSelected(false);
    renderThisOrThat = false;
    renderDash = true;
    save.setVisible(false);
    cancel.setVisible(false);
    createLinearBeat.hideTextArea();
    createCircularBeat.hideTextArea();
    add.clearButtons();
    getHelpFromAlgorithm.setVisible(false);
    tempoSlider.setVisible(false);
    playPause.setVisible(false);
    addInstrument1.setVisible(false);
    addInstrument2.setVisible(false);
    addInstrument3.setVisible(false);
    fillBeat = false;
    beats.mute();
}

public void saveHandler(GButton button, GEvent event) { 
    renderLinearBeat = false;
    renderCircularBeat = false;
    createLinearBeat.setAlgorithmSelected(false);
    createCircularBeat.setAlgorithmSelected(false);
    renderThisOrThat = false;
    renderDash = true;
    save.setVisible(false);
    cancel.setVisible(false);
    createLinearBeat.hideTextArea();
    createCircularBeat.hideTextArea();
    add.clearButtons();
    getHelpFromAlgorithm.setVisible(false);
    tempoSlider.setVisible(false);
    playPause.setVisible(false);
    addInstrument1.setVisible(false);
    addInstrument2.setVisible(false);
    addInstrument3.setVisible(false);
    dashPlayButton2.setVisible(true);
    dashPlayButton3.setVisible(true);
    fillBeat = true;
    beats.mute();
    playPause.setVisible(false);
    addInstrument3.setVisible(false);
    addInstrument2.setVisible(false);
    addInstrument1.setVisible(false);
    tempoSlider.setVisible(false);

}

public void getHelpFromAlgorithmHandler(GButton button, GEvent event) {
    renderLinearBeat = false;
    renderCircularBeat = false;
    createLinearBeat.setAlgorithmSelected(true);
    createCircularBeat.setAlgorithmSelected(true);
    createLinearBeat.hideTextArea();
    createCircularBeat.hideTextArea();
    renderThisOrThat = true;
    beats.mute();
}

public void startCreatingHandler(GButton button, GEvent event) {
  renderQuiz = false;
  renderSkillLevelSelect = true;
  renderLandingPage = false;
  startCreating.setVisible(false);  
}

public void beginnerExpertHandler(GButton button, GEvent event) {
    beginnerButton.setVisible(false);
    expertButton.setVisible(false);
    if (button.getText() == "Beginner"){
       isBeginner = true;
       output.println("User selected beginner from quiz"); // Write testing data to file 
    }
    if (button.getText() == "Moderate/Expert"){
       isBeginner = false;
       output.println("User selected expert from quiz"); // Write testing data to file 
    }
    renderQuiz = true; 
    createLinearBeat.setBeginner(isBeginner);
    createCircularBeat.setBeginner(isBeginner);
    // this is needed for the case that a user starts the quiz, goes back, then goes into new begginer/expert level of quiz
    createQuiz.resetStartTimeQuiz();
    output.flush(); // Writes the remaining data to the file
    //output.close(); // Finishes the file
  }

public void switchSkillLevelHandler(GButton button, GEvent event) {
    renderQuiz = false;
    renderSkillLevelSelect = true;
    switchSkillLevelButton.setVisible(false);
    createQuiz.clearButtons();
    // Write testing data to file 
    output.println("User went back to switch skill level on quiz");
    output.println("Time spent on quiz before user went back (milliseconds): " + (millis() - createQuiz.getStartTimeQuiz()));
    output.flush();
}
  public void instrHandler(GButton button, GEvent event) {
    renderAddInstrument = true;
    button.setVisible(false);
    if (createLinearBeat.showInstrumentTooltip || createCircularBeat.showInstrumentTooltip) {
      createLinearBeat.showInstrumentTooltip = false;
      createCircularBeat.showInstrumentTooltip = false;
      createLinearBeat.showBeatTooltip = true;
      createCircularBeat.showBeatTooltip = true;
    }
  }

public void addABeatHandler(GButton button, GEvent event) {
   addABeatClicked = true;
}
public void pEvent(GImageButton button, GEvent event) {
  println("Play button clicked");
}

public void xButtonOnThisThatPressed() {
    gaBeat1.mute();
    gaBeat2.mute();
    renderLinearBeat = true;
    renderCircularBeat = false;
    createLinearBeat.setAlgorithmSelected(false);
    createCircularBeat.setAlgorithmSelected(false);
    renderThisOrThat = false;
    beats.mute();
}

public void trackNewBeatGenerated() {
  // used for testing purposes - called when a user presses "generate another" on this/that page
  numberOfTimesUserPressedGenerateNewBeats += 1;
}

public void trackNumberOfTimesUserGeneratedNewBeats() {
  // called at the end of the generate beat page to print out the total number of times they chose to generate another beat
  output.println("Total number of times user chose to generate more beats: " + numberOfTimesUserPressedGenerateNewBeats);
  output.flush();
}

public void trackTimeToGenerateNewBeat(int time) {
  // used for testing purposes
  output.println("Time to Generate new beat (milliseconds): " + time);
  output.flush();
}

public void trackBeatsShownToUserFitness(float beat1Fitness, float beat2Fitness) {
  // used for testing purposes 
  output.println("Beat 1 Fitness : " + beat1Fitness);
  output.println("Beat 2 Fitness : " + beat2Fitness);
  output.flush();
}

public void showLoadingBar() {
  renderLoadingBar = true;
}

public void useBeatInSong(DrumBeats gaBeats) {
  beats = gaBeats;
}
public void tempoSliderEventHandler(GCustomSlider slider, GEvent event) {
  println(slider.getValueS());
  println(slider.getValueI());
  String val = slider.getValueS();
  int bpm = 120;
  if (val.equals("60") || val.equals("Slow")) bpm = 60;
  else if (val.equals("85")) bpm = 85;
  else if (val.equals("110") || val.equals("Walking")) bpm = 110;
  else if (val.equals("135") || val.equals("Moderate")) bpm = 135;
  else if (val.equals("160") || val.equals("Heartbeat")) bpm = 160;
  else if (val.equals("180") || val.equals("Fast")) bpm = 180;
  beats.setBpm(bpm);
  gaBeat1.setBpm(bpm);
  gaBeat2.setBpm(bpm);
}
