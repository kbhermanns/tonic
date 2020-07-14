import g4p_controls.*;

boolean addABeat = false;
boolean renderLandingPage = true;
CircleButton addABeatButton;
LinearBeatCreation createLinearBeat;
CircularBeatCreation createCircularBeat;
ThisOrThat thisOrThat;

DrumBeats beats;
Quiz createQuiz;

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
boolean renderLikeOrDislikeBeat = false;
boolean renderThisOrThat = false;

PImage dashImg;
PImage landingImg;

String target_genre = "None";
String target_speed = "None";
String target_time_sig = "None";
Boolean target_syncopation = false;
int[][] target_beats;

boolean kickSelected = false;
boolean snareSelected = false;
boolean hatSelected = false;

// Buttons
GButton startCreating;
GButton playButton;
GButton playGA;
GButton playGA1;
GButton playGA2;
GButton preferThisBeatGA1;
GButton preferThisBeatGA2;
GButton useThisInSongGA1;
GButton useThisInSongGA2;
BeatPopulation gaBeatPopulation1;
DrumBeats originalGABeat;
GButton getHelpFromAlgorithm;
GButton save; 
GButton cancel;
DrumBeats gaBeat1;
DrumBeats gaBeat2;

// main teal color -  3, 218, 198
// main purple color - 187, 134, 252
  
void setup(){
   size(1300, 800);
   beats = new DrumBeats(this,3,16);
   beats.audioSetup();
   beats.mute();
   addABeatX = width/2;
   addABeatY = height/2 - 105;
   addABeatHighlight = color(204);
   addABeatButton = new CircleButton(addABeatX, addABeatY, addABeatRadius);
   createQuiz = new Quiz(this); 
   createLinearBeat = new LinearBeatCreation(beats, this);
   createCircularBeat = new CircularBeatCreation(beats, this);
   thisOrThat = new ThisOrThat(beats, this);   
   dashImg = loadImage("Dashboard.png");
   landingImg = loadImage("LandingPage.png");
   
   playButton = new GButton(this, 380, 30, 80, 30, "PLAY");
   playButton.addEventHandler(this, "audioHandler");
   playButton.setVisible(false);
   
   playGA1 = new GButton(this, 310, 400, 80, 30, "PLAY");
   playGA1.addEventHandler(this, "playGA1Handler");
   playGA1.setVisible(false);
   
   playGA2 = new GButton(this, 935, 400, 80, 30, "PLAY");
   playGA2.addEventHandler(this, "playGA2Handler");
   playGA2.setVisible(false);
   
   preferThisBeatGA1 = new GButton(this, 250, 480, 200, 60, "I Prefer this Beat");
   preferThisBeatGA1.addEventHandler(this, "preferThisBeatHandler1");
   preferThisBeatGA1.setLocalColor(2, color(41,41,41)); //text color
   preferThisBeatGA1.setLocalColor(3, color(66,65,62)); //border colour
   preferThisBeatGA1.setLocalColor(4, color(3, 218, 198)); //background color
   preferThisBeatGA1.setFont(new Font("Gothic A1", Font.PLAIN, 25));
   preferThisBeatGA1.setVisible(false);
   
   preferThisBeatGA2 = new GButton(this, 870, 480, 200, 60, "I Prefer this Beat");
   preferThisBeatGA2.addEventHandler(this, "preferThisBeatHandler2");
   preferThisBeatGA2.setLocalColor(2, color(41,41,41)); //text color
   preferThisBeatGA2.setLocalColor(3, color(66,65,62)); //border colour
   preferThisBeatGA2.setLocalColor(4, color(187, 134, 252)); //background color
   preferThisBeatGA2.setFont(new Font("Gothic A1", Font.PLAIN, 25));
   preferThisBeatGA2.setVisible(false);
   
   useThisInSongGA1 = new GButton(this, 230, 550, 250, 60, "Use this Beat in Song");
   useThisInSongGA1.addEventHandler(this, "useThisInSongBeatHandler1");
   useThisInSongGA1.setLocalColor(2, color(41,41,41)); //text color
   useThisInSongGA1.setLocalColor(3, color(66,65,62)); //border colour
   useThisInSongGA1.setLocalColor(4, color(3, 218, 198)); //background color
   useThisInSongGA1.setFont(new Font("Gothic A1", Font.PLAIN, 25));
   useThisInSongGA1.setVisible(false);
   
   useThisInSongGA2 = new GButton(this, 850, 550, 250, 60, "Use this Beat in Song");
   useThisInSongGA2.addEventHandler(this, "useThisInSongBeatHandler2");
   useThisInSongGA2.setLocalColor(2, color(41,41,41)); //text color
   useThisInSongGA2.setLocalColor(3, color(66,65,62)); //border colour
   useThisInSongGA2.setLocalColor(4, color(187, 134, 252)); //background color
   useThisInSongGA2.setFont(new Font("Gothic A1", Font.PLAIN, 25));
   useThisInSongGA2.setVisible(false);
   
   getHelpFromAlgorithm = new GButton(this, 950, 450, 320, 60, "Get Help from Algorithm");
   getHelpFromAlgorithm.addEventHandler(this, "getHelpFromAlgorithmHandler");
   getHelpFromAlgorithm.setLocalColor(2, color(41,41,41)); //text color
   getHelpFromAlgorithm.setLocalColor(3, color(51,174,100)); //border colour
   getHelpFromAlgorithm.setLocalColor(4, color(3, 218, 198)); //background color
   getHelpFromAlgorithm.setFont(new Font("Gothic A1", Font.PLAIN, 25));
   getHelpFromAlgorithm.setVisible(false);
   
   save = new GButton(this, 950, 700, 160, 80, "Save");
   save.addEventHandler(this, "saveHandler");
   save.setLocalColor(2, color(41,41,41)); //text color
   save.setLocalColor(3, color(51,174,100)); //border colour
   save.setLocalColor(4, color(51,174,100)); //background color
   save.setFont(new Font("Gothic A1", Font.PLAIN, 30));
   save.setVisible(false);
   
   cancel = new GButton(this, 1125, 700, 160, 80, "Cancel");
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
   

   gaBeat1 = new DrumBeats(this,3,16);
   gaBeat1.audioSetup();
   gaBeat1.mute();
   
   gaBeat2 = new DrumBeats(this,3,16);
   gaBeat2.audioSetup();
   gaBeat2.mute();
   
   originalGABeat = new DrumBeats(this,3,16);
   gaBeatPopulation1 = new BeatPopulation(
      0.01, 50,
      gaBeat1.beats.length, gaBeat1.beats[0].length
    );
}

void draw(){ 
  background(-14079703);
  noFill();
  pushMatrix();
  translate(5.50573, -1.295466);
  rotate(0.0);
  popMatrix();

  if(renderLandingPage) {
    image(landingImg,0,0,1300,800);
  }

  if (renderQuiz){
    createQuiz.render();
  }

  if(createQuiz.isGoClicked()){
    renderQuiz = false;
    renderDash = true;
    target_genre = createQuiz.getGenre();
    target_speed = createQuiz.getSpeed();
    target_time_sig = createQuiz.getTimeSig();
    target_syncopation = createQuiz.isSyncopated();
    target_beats = createQuiz.getTargetBeats();
  }
  
  if (renderDash) {
    image(dashImg, 0, 0, 1300, 800);
    renderAddABeat = true;
  }
  
  if (renderAddABeat) {
    addABeatButton.renderNoFill(renderAddABeat);
    addABeatButton.update();
  }
  
  if (addABeatButton.isClicked()) {
    renderDash = false;
    renderAddABeat = false;
    renderLinearBeat = true;
    addABeatButton.reset();
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
    playButton.setVisible(false);
    save.setVisible(false);
    cancel.setVisible(false);
    getHelpFromAlgorithm.setVisible(false);
    playGA1.setVisible(true); 
    playGA2.setVisible(true);
    preferThisBeatGA1.setVisible(true);
    preferThisBeatGA2.setVisible(true);
    useThisInSongGA1.setVisible(true);
    useThisInSongGA2.setVisible(true);
  }

 if (renderLinearBeat && !createLinearBeat.isAlgorithmButtonSelected()) {
   save.setVisible(true);
   cancel.setVisible(true);
   createLinearBeat.render(beats);
   beats = createLinearBeat.update();
   if (!createLinearBeat.isAlgorithmButtonSelected()) playButton.setVisible(true);
   
   if (!createLinearBeat.isAlgorithmButtonSelected()) {
   if (createLinearBeat.isKickSelected() || createCircularBeat.isKickSelected()) {
     createLinearBeat.setKickSelected(true);
     createCircularBeat.setKickSelected(false);
     createLinearBeat.renderKickSelector();
   }
   if (createLinearBeat.isHatSelected() || createCircularBeat.isHatSelected()) {
     createLinearBeat.setHatSelected(true);
     createCircularBeat.setHatSelected(false);
     createLinearBeat.renderHatSelector();
   }
   if (createLinearBeat.isSnareSelected() || createCircularBeat.isSnareSelected()) {
     createLinearBeat.setSnareSelected(true);
     createCircularBeat.setSnareSelected(false);
     createLinearBeat.renderSnareSelector();
   }
   }
 } else if (renderCircularBeat && !createCircularBeat.isAlgorithmButtonSelected()){
    save.setVisible(true);
    cancel.setVisible(true);
    createCircularBeat.render(beats);
    beats = createCircularBeat.update();
    if (!createCircularBeat.isAlgorithmButtonSelected()) {
    if (createCircularBeat.isKickSelected() || createLinearBeat.isKickSelected()) {
     createCircularBeat.setKickSelected(true);
     createLinearBeat.setKickSelected(false);
     createCircularBeat.renderKickCircle();
   }
   if (createCircularBeat.isHatSelected()|| createLinearBeat.isHatSelected()) {
     createCircularBeat.setHatSelected(true);
     createLinearBeat.setHatSelected(false);
     createCircularBeat.renderHatCircle();
   }
   if (createCircularBeat.isSnareSelected() || createLinearBeat.isSnareSelected()) {
     createCircularBeat.setSnareSelected(true);
     createLinearBeat.setSnareSelected(false);
     createCircularBeat.renderSnareCircle();
   }
   }
  }  else if ((renderCircularBeat && createCircularBeat.isAlgorithmButtonSelected()) || (renderLinearBeat && createLinearBeat.isAlgorithmButtonSelected())) {
     // algorithm button was selected 
    playButton.setVisible(false);
    save.setVisible(false);
    cancel.setVisible(false);
    getHelpFromAlgorithm.setVisible(false);
    playGA1.setVisible(true); 
    playGA2.setVisible(true);
    preferThisBeatGA1.setVisible(true);
    preferThisBeatGA2.setVisible(true);
    useThisInSongGA1.setVisible(true);
    useThisInSongGA2.setVisible(true);
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
public void audioHandler(GButton button, GEvent event) {
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
}

public void saveHandler(GButton button, GEvent event) {  
}

public void getHelpFromAlgorithmHandler(GButton button, GEvent event) {
    renderThisOrThat = true;
    beats.mute();
}

public void preferThisBeatHandler1(GButton button, GEvent event) {  
   // user prefers left beat (teal)
   gaBeatPopulation1.run(gaBeat1.beats, gaBeat2.beats, originalGABeat.beats, target_beats, 100);
   gaBeat1.beats = gaBeatPopulation1.getBestBeat();
   gaBeat2.beats = gaBeatPopulation1.getSecondBestBeat();
}

public void preferThisBeatHandler2(GButton button, GEvent event) {  
   // user prefers left beat (teal)
   gaBeatPopulation1.run(gaBeat2.beats, gaBeat1.beats, originalGABeat.beats, target_beats, 100);
   gaBeat1.beats = gaBeatPopulation1.getBestBeat();
   gaBeat2.beats = gaBeatPopulation1.getSecondBestBeat();
}

public void useThisInSongBeatHandler1(GButton button, GEvent event) {  
   // user prefers left beat (teal)
   //gaBeatPopulation1.run(gaBeat1.beats, gaBeat2.beats, originalGABeat.beats, target_beats, 100);
   //gaBeat1.beats = gaBeatPopulation1.getBestBeat();
   //gaBeat2.beats = gaBeatPopulation1.getSecondBestBeat();
}

public void useThisInSongBeatHandler2(GButton button, GEvent event) {  
   // user prefers left beat (teal)
   //gaBeatPopulation1.run(gaBeat2.beats, gaBeat1.beats, originalGABeat.beats, target_beats, 100);
   //gaBeat1.beats = gaBeatPopulation1.getBestBeat();
   //gaBeat2.beats = gaBeatPopulation1.getSecondBestBeat();
}
public void startCreatingHandler(GButton button, GEvent event) {
  renderQuiz = true;
  renderLandingPage = false;
  startCreating.setVisible(false);  
}
