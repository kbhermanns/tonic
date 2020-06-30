boolean addABeat = false;
CircleButton addABeatButton;
LinearBeatCreation createLinearBeat;

color addABeatHighlight; 
color addABeatColor; 
int addABeatX;
int addABeatY;
int addABeatRadius = 100; 
color testColor = color(204);
boolean renderAddABeat = true;
boolean renderLinearBeat = false;


void setup(){
   size(1300, 800);
   addABeatX = width/2;
   addABeatY = height/2;
   addABeatHighlight = color(204);
   addABeatButton = new CircleButton(addABeatX, addABeatY, addABeatRadius, testColor);
   createLinearBeat = new LinearBeatCreation();
}

void draw(){ 
  background(-14079703);
  
  if (renderAddABeat) {
    addABeatButton.render(renderAddABeat);
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
