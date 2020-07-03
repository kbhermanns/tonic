boolean addABeat = false;
CircleButton addABeatButton;
LinearBeatCreation createLinearBeat;
Quiz createQuiz;

color addABeatHighlight; 
color addABeatColor; 
int addABeatX;
int addABeatY;
int addABeatRadius = 80; 
color testColor = color(204);
boolean renderAddABeat = true;
boolean renderLinearBeat = false;
boolean renderQuiz = false;
PImage dashImg;

String target_genre = "None";
String target_speed = "None";
String target_time_sig = "None";
Boolean target_syncopation = false;
Boolean[][] target_beats;


void setup(){
   size(1300, 800);
   addABeatX = width/2;
   addABeatY = height/2 - 110;
   addABeatHighlight = color(204);
   addABeatButton = new CircleButton(addABeatX, addABeatY, addABeatRadius);
   createQuiz = new Quiz();
   createLinearBeat = new LinearBeatCreation();
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
    renderQuiz = true;
    addABeatButton.reset();
    createLinearBeat.render();
  }
  
  if (renderQuiz){
    createQuiz.render();
    createQuiz.update();
  }
  
  if(createQuiz.isGoClicked()){
    renderQuiz = false;
    renderLinearBeat = true;
    target_genre = createQuiz.getGenre();
    target_speed = createQuiz.getSpeed();
    target_time_sig = createQuiz.getTimeSig();
    target_syncopation = createQuiz.isSyncopated();
    target_beats = createQuiz.getTargetBeats();
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
