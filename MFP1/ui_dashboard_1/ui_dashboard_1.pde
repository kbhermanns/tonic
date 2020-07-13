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
boolean renderAddABeat = false;
boolean renderLinearBeat = false;
boolean renderCircularBeat = false;
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
GButton save; 
GButton cancel;
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
   
   createQuiz = new Quiz(this);
   dashImg = loadImage("Dashboard.png");
   
   playButton = new GButton(this, 380, 30, 80, 30, "PLAY");
   playButton.addEventHandler(this, "audioHandler");
   playButton.setVisible(false);
   
   playGA = new GButton(this, 600, 200, 80, 30, "PLAY");
   playGA.addEventHandler(this, "playGAHandler");
   playGA.setVisible(false);
   
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
    save.setVisible(false);
    cancel.setVisible(false);
    beats.mute();    
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

    if (renderQuiz){
    createQuiz.render();
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
  
 if (renderLinearBeat) {
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
 }
 
  else if (renderCircularBeat){
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
  }  
  }

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
public void playGAHandler(GButton button, GEvent event) {
  if (gaBeat.isMuted()) gaBeat.unMute();
  else gaBeat.mute();
  LikeOrDislikeBeat likeDislike = createLinearBeat.getLikeOrDislike();
  gaBeat.setBeats(likeDislike.getBeat().getEntireBeat());
}

public void cancelHandler(GButton button, GEvent event) {  
}

public void saveHandler(GButton button, GEvent event) {  
}
