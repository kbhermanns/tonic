import g4p_controls.*;

boolean addABeat = false;
CircleButton addABeatButton;
LinearBeatCreation createLinearBeat;
CircularBeatCreation createCircularBeat;
DrumBeats beats;
Quiz createQuiz;

color addABeatHighlight; 
color addABeatColor; 
int addABeatX;
int addABeatY;
int addABeatRadius = 85; 
color testColor = color(204);
boolean renderAddABeat = false;;
boolean renderLinearBeat = false;
boolean renderDash = false;
boolean renderLikeOrDislikeBeat = false;
boolean renderQuiz = true;
PImage dashImg;

String target_genre = "None";
String target_speed = "None";
String target_time_sig = "None";
Boolean target_syncopation = false;
Boolean[][] target_beats;

boolean kickSelected = false;
boolean snareSelected = false;
boolean hatSelected = false;

GButton playButton;
GButton playGA;
DrumBeats gaBeat;

void setup(){
   size(1300, 800);
   beats = new DrumBeats(this);
   beats.audioSetup();
   beats.mute();
   addABeatX = width/2;
   addABeatY = height/2 -105;
   addABeatHighlight = color(204);
   addABeatButton = new CircleButton(addABeatX, addABeatY, addABeatRadius);
   createLinearBeat = new LinearBeatCreation(beats, this);
   createCircularBeat = new CircularBeatCreation(beats, this);
   
   createQuiz = new Quiz();
   dashImg = loadImage("Dashboard.png");
   
   playButton = new GButton(this, 380, 30, 80, 30, "PLAY");
   playButton.addEventHandler(this, "audioHandler");
   playButton.setVisible(false);
   
   playGA = new GButton(this, 600, 200, 80, 30, "PLAY");
   playGA.addEventHandler(this, "playGAHandler");
   playGA.setVisible(false);
   
   gaBeat = new DrumBeats(this);
   gaBeat.audioSetup();
   gaBeat.mute();
}

void draw(){ 
  background(-14079703);
  noFill();
  pushMatrix();
  translate(5.50573, -1.295466);
  rotate(0.0);
  image(dashImg, 0, 0, 1300, 800);
  popMatrix();
  
  if (renderDash) {
    image(dashImg, 0, 0, 1300, 800);
    renderAddABeat = true;
  }
  
  if (renderAddABeat) {
    addABeatButton.renderNoFill(renderAddABeat);
    addABeatButton.update();
  }
  
  if (createLinearBeat.isAlgorithmButtonSelected() || createCircularBeat.isAlgorithmButtonSelected()) {
    playGA.setVisible(true);
    playButton.setVisible(false);
    beats.mute();
    LikeOrDislikeBeat likeDislike = createLinearBeat.getLikeOrDislike();
   
    gaBeat = likeDislike.getBeat();
  }
  
  
  if (addABeatButton.isClicked()) {
    renderDash = false;
    renderAddABeat = false;
    renderLinearBeat = true;
    addABeatButton.reset();
    createLinearBeat.render(beats);
  }
  
 if (createLinearBeat.isCircularLayoutSelected()) {
   renderLinearBeat = false;
  }
  
  if (createCircularBeat.isLinearLayoutSelected()) {
   renderLinearBeat = true;
  }

    if (renderQuiz){
    createQuiz.render();
    createQuiz.update();
  }

  if(createQuiz.isGoClicked()){
    renderQuiz = false;
    renderDash = true;
    //renderLinearBeat = true;
    target_genre = createQuiz.getGenre();
    target_speed = createQuiz.getSpeed();
    target_time_sig = createQuiz.getTimeSig();
    target_syncopation = createQuiz.isSyncopated();
    target_beats = createQuiz.getTargetBeats();
  }
  
 if (renderLinearBeat || createCircularBeat.isLinearLayoutSelected()) {
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
 }
 
  else if (createLinearBeat.isCircularLayoutSelected()){
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
  }  
  }

public void handleTextEvents(GEditableTextControl textControl, GEvent event) { 
    if (createLinearBeat.isCircularLayoutSelected()) {
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
public void playGAHandler(GButton button, GEvent event) {
  if (gaBeat.isMuted()) gaBeat.unMute();
  else gaBeat.mute();
}
