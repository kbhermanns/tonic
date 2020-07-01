import g4p_controls.*;

boolean addABeat = false;
CircleButton addABeatButton;
LinearBeatCreation createLinearBeat;

color addABeatHighlight; 
color addABeatColor; 
int addABeatX;
int addABeatY;
int addABeatRadius = 80; 
color testColor = color(204);
boolean renderAddABeat = true;
boolean renderLinearBeat = false;
PImage dashImg;


void setup(){
   size(1300, 800);
   addABeatX = width/2;
   addABeatY = height/2 - 110;
   addABeatHighlight = color(204);
   addABeatButton = new CircleButton(addABeatX, addABeatY, addABeatRadius);
   createLinearBeat = new LinearBeatCreation(this);
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
     createLinearBeat.renderKickSelector();
   }
   if (createLinearBeat.isHatSelected()) {
     createLinearBeat.renderHatSelector();
   }
   if (createLinearBeat.isSnareSelected()) {
     createLinearBeat.renderSnareSelector();
   }
 }
}

//NOTE: this will need to be updated if additional areas require keystrokes
void keyPressed() {
  createLinearBeat.setName();
}
