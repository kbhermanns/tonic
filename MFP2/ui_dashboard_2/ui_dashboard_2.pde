import g4p_controls.*;

boolean addABeat = false;
CircleButton addABeatButton;
LinearBeatCreation createLinearBeat;
ThisOrThat thisOrThat;
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
boolean renderQuiz = true;
boolean renderDash = false;
PImage dashImg;

String target_genre = "None";
String target_speed = "None";
String target_time_sig = "None";
Boolean target_syncopation = false;
Boolean[][] target_beats;

boolean kickSelected = false;
boolean snareSelected = false;
boolean hatSelected = false;

void setup(){
   size(1300, 800);
   beats = new DrumBeats();
   addABeatX = width/2;
   addABeatY = height/2 - 105;
   addABeatHighlight = color(204);
   addABeatButton = new CircleButton(addABeatX, addABeatY, addABeatRadius);
   createQuiz = new Quiz();
   createLinearBeat = new LinearBeatCreation(beats, this);
   thisOrThat = new ThisOrThat(beats);
   dashImg = loadImage("Dashboard.png");
}

void draw(){ 
  background(-14079703);
  noFill();
  pushMatrix();
  translate(5.50573, -1.295466);
  rotate(0.0);
  popMatrix();
  
  if (renderQuiz){
    createQuiz.render();
    createQuiz.update();
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
    renderAddABeat = false;
    renderLinearBeat = true;
    addABeatButton.reset();
    createLinearBeat.render();
  }
 
 if (renderLinearBeat) {
   createLinearBeat.render();
   createLinearBeat.update();
   
   if (!createLinearBeat.isAlgorithmButtonSelected()){
     if (createLinearBeat.isKickSelected()) {
       createLinearBeat.setKickSelected(true);
       createLinearBeat.renderKickSelector();
     }
     if (createLinearBeat.isHatSelected()) {
       createLinearBeat.setHatSelected(true);
       createLinearBeat.renderHatSelector();
     }
     if (createLinearBeat.isSnareSelected()) {
       createLinearBeat.setSnareSelected(true);
       createLinearBeat.renderSnareSelector();
     }
   }  else {
     // algorithm button was selected 
     thisOrThat.render();
     thisOrThat.update();
   }
  }
 }

public void handleTextEvents(GEditableTextControl textControl, GEvent event) { 
    if (createLinearBeat.isCircularLayoutSelected()) {
        createLinearBeat.updateName(textControl.getText());
        } else {
        createLinearBeat.updateName(textControl.getText());
        }
}

boolean[][] BoolToPrimative(Boolean[][] arr) {
  boolean[][] ret = new boolean[arr.length][arr[0].length];
  for (int i = 0; i < arr.length; i++) {
    for (int j = 0; j < arr[0].length; j++) {
      ret[i][j] = arr[i][j];
    }
  }
  return ret;
}
