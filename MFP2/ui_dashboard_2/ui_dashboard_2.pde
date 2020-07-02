import g4p_controls.*;

boolean addABeat = false;
CircleButton addABeatButton;
LinearBeatCreation createLinearBeat;
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
   addABeatY = height/2;
   addABeatHighlight = color(204);
   addABeatButton = new CircleButton(addABeatX, addABeatY, addABeatRadius);
   createLinearBeat = new LinearBeatCreation(beats, this);
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
    createLinearBeat.render();
  }
  
 if (renderLinearBeat) {
   createLinearBeat.render();
   createLinearBeat.update();
 
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
  }
 }
  //NOTE: this will need to be updated if additional areas require keystrokes
  void keyPressed() {
    createLinearBeat.setName();
}
