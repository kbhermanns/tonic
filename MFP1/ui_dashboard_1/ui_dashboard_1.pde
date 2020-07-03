import g4p_controls.*;

boolean addABeat = false;
CircleButton addABeatButton;
LinearBeatCreation createLinearBeat;
CircularBeatCreation createCircularBeat;
DrumBeats beats;

color addABeatHighlight; 
color addABeatColor; 
int addABeatX;
int addABeatY;
int addABeatRadius = 80; 
color testColor = color(204);
boolean renderAddABeat = true;
boolean renderLinearBeat = false;
PImage dashImg;

boolean kickSelected = false;
boolean snareSelected = false;
boolean hatSelected = false;

void setup(){
   size(1300, 800);
   beats = new DrumBeats();
   addABeatX = width/2;
   addABeatY = height/2 -105;
   addABeatHighlight = color(204);
   addABeatButton = new CircleButton(addABeatX, addABeatY, addABeatRadius);
   createLinearBeat = new LinearBeatCreation(beats, this);
   createCircularBeat = new CircularBeatCreation(beats);
   dashImg = loadImage("Dashboard.png");
   
}

void draw(){ 
  background(-14079703);
  noFill();
  pushMatrix();
  translate(5.50573, -1.295466);
  rotate(0.0);
  image(dashImg, 0, 0, 1300, 800);
  popMatrix();
  
  if (renderAddABeat) {
    addABeatButton.renderNoFill(renderAddABeat);
    addABeatButton.update();
  }
  
  if (addABeatButton.isClicked()) {
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
  
 if (renderLinearBeat || createCircularBeat.isLinearLayoutSelected()) {
   createLinearBeat.render(beats);
   beats = createLinearBeat.update();
 
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
 
  else if (createLinearBeat.isCircularLayoutSelected()){
    createCircularBeat.render(beats);
    beats = createCircularBeat.update();
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
  //NOTE: this will need to be updated if additional areas require keystrokes
  void keyPressed() {
    createLinearBeat.setName();
}
