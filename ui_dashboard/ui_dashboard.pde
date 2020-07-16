import g4p_controls.*;

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

PImage dashImg;
PImage landingImg;

String target_genre = "None";
String target_speed = "None";
String target_time_sig = "None";
Boolean target_syncopation = false;
int[][] target_beats;

// Buttons
GButton startCreating;
GButton dashPlayButton;
BeatPopulation gaBeatPopulation1;
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
GSlider tempoSlider;

boolean kickSelected = false;
boolean hatSelected = false;
boolean snareSelected = false;

int numInst = 0;

// main teal color -  3, 218, 198
// main purple color - 187, 134, 252
GImageButton p;
  
void setup(){
   size(1300, 800);
   
   playPause = new GImageToggleButton(this, 400, 15 ,"PlayPause.png",2);
   playPause.addEventHandler(this, "audioHandler");
   playPause.setVisible(false);


   tempoSlider = new GSlider(this, 700,642.5511, 250, 30, 20);
   tempoSlider.setLocalColor(5, color(231, 254, 252));
   tempoSlider.setLocalColor(3, color(3,218,198));
   tempoSlider.setLocalColor(11, color(155, 253, 243));
   tempoSlider.setLocalColor(14, color(133, 250, 240));
   tempoSlider.setLocalColor(15, color(9, 220, 203));
   tempoSlider.setVisible(false);
   tempoSlider.addEventHandler(this, "tempoSliderEventHandler");
   //frame rate for animations
   frameRate(500);
   
   beats = new DrumBeats(this,3,16);
   beats.audioSetup();
   beats.mute();
   //addABeatX = width/2;
   //addABeatY = height/2 - 105;
   //addABeatHighlight = color(204);
   //addABeatButton = new CircleButton(addABeatX, addABeatY, addABeatRadius);
   createQuiz = new Quiz(this); 
   createDash = new Dashboard(this, fillBeat);
   createLinearBeat = new LinearBeatCreation(beats, this);
   createCircularBeat = new CircularBeatCreation(beats, this);
   thisOrThat = new ThisOrThat(beats, this);   
   dashImg = loadImage("Dashboard.png");
   landingImg = loadImage("TonicLandingPage.PNG");
   
   dashPlayButton = new GButton(this, 200, 90, 100, 50, "PLAY");
   dashPlayButton.addEventHandler(this, "audioHandler");
   dashPlayButton.setFont(new Font("Gothic A1", Font.PLAIN, 25));
   dashPlayButton.setVisible(false);
   
   addABeatButton = new GButton(this, 320, 90, 120, 50, "Add beat");
   addABeatButton.addEventHandler(this, "addABeatHandler");
   addABeatButton.setFont(new Font("Gothic A1", Font.PLAIN, 25));
   addABeatButton.setVisible(false);

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
   gaBeatPopulation1 = new BeatPopulation(
      0.01, 50,
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
  background(-14079703); //<>//
  noFill();
  pushMatrix();
  translate(5.50573, -1.295466);
  rotate(0.0); //<>//
  popMatrix();

  if(renderLandingPage) {
    image(landingImg,0,0,1300,800);
  }
  if (renderQuiz){
    createQuiz.render();
  }

  if(renderQuiz && createQuiz.isGoClicked()){
    renderQuiz = false;
    renderDash = true;
    target_genre = createQuiz.getGenre();
    target_speed = createQuiz.getSpeed();
    target_time_sig = createQuiz.getTimeSig();
    target_syncopation = createQuiz.isSyncopated();
    target_beats = createQuiz.getTargetBeats();
  }
  
  if (renderDash) {
   createDash.render();
   renderAddABeat = true;
   addABeatButton.setVisible(true);
   dashPlayButton.setVisible(true);
  }
  
  if (addABeatClicked) {
   renderDash = false;
   renderAddABeat = false;
   renderLinearBeat = true;
   addABeatClicked = false;
   addABeatButton.setVisible(false);
   dashPlayButton.setVisible(false);
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
       // TODO: having issues with this so fix later - Abby
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
  }  if (renderLoadingBar == true) {
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
  
  else if ((renderCircularBeat && createCircularBeat.isAlgorithmButtonSelected()) || (renderLinearBeat && createLinearBeat.isAlgorithmButtonSelected())) {
     // algorithm button was selected 
    playPause.setVisible(false);
    save.setVisible(false);
    cancel.setVisible(false);
    tempoSlider.setVisible(false);
    getHelpFromAlgorithm.setVisible(false);
    thisOrThat.render();
    thisOrThat.update();
    beats.mute();
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
  if (beats.isMuted()) beats.unMute();
  else beats.mute();
}

public void playGA1Handler(GButton button, GEvent event) {
  if (gaBeat1.isMuted()) gaBeat1.unMute();
  else gaBeat1.mute();
  gaBeat1.setBeats(thisOrThat.getBeat1().getEntireBeat());
}

public void playGA2Handler(GButton button, GEvent event) {  
  if (gaBeat2.isMuted()) gaBeat2.unMute();
  else gaBeat2.mute();
  gaBeat2.setBeats(thisOrThat.getBeat2().getEntireBeat());
}

public void cancelHandler(GButton button, GEvent event) { 
    // TODO: hide buttons 
    renderLinearBeat = false;
    renderCircularBeat = false;
    createLinearBeat.setAlgorithmSelected(false);
    createCircularBeat.setAlgorithmSelected(false);
    renderThisOrThat = false;
    renderDash = true;
    beats.mute();
}

public void saveHandler(GButton button, GEvent event) { 
  // TODO: hide buttons 
  // TODO: add saving functionality 
    renderLinearBeat = false;
    renderCircularBeat = false;
    createLinearBeat.setAlgorithmSelected(false);
    createCircularBeat.setAlgorithmSelected(false);
    renderThisOrThat = false;
    renderDash = true;
    beats.mute();
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
  renderQuiz = true;
  renderLandingPage = false;
  startCreating.setVisible(false);  
}
  public void instrHandler(GButton button, GEvent event) {
  renderAddInstrument = true;
  button.setVisible(false);
  }

public void addABeatHandler(GButton button, GEvent event) {
   addABeatClicked = true;
}
public void pEvent(GImageButton button, GEvent event) {
  println("Play button clicked");
}

public void xButtonOnThisThatPressed() {
    renderLinearBeat = true;
    renderCircularBeat = false;
    createLinearBeat.setAlgorithmSelected(false);
    createCircularBeat.setAlgorithmSelected(false);
    renderThisOrThat = false;
    beats.mute();
}

public void showLoadingBar() {
  renderLoadingBar = true;
}

public void useBeatInSong(DrumBeats gaBeats) {
  beats = gaBeats;
}
public void tempoSliderEventHandler(GSlider slider, GEvent event) {
  println("tempoSliderHandler "+ slider.getValueF());
  beats.setBpm(slider.getValueF());
}
