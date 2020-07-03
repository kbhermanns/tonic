import java.awt.Rectangle;

class ThisOrThat {
  Boolean[][] originalBeat;
  Boolean[][] beats1;
  Boolean[][] beats2;
  Boolean[] whatHasChangedInBeat1; // kick - 0, snare - 1, hi-hat - 2
  Boolean[] whatHasChangedInBeat2;
  Integer beatNumber;
  //DrumBeats Beats;
  //BeatPopulation beatPopulation;
  ArrayList<RectangularButton> kickButtons;
  ArrayList<RectangularButton> snareButtons;
  ArrayList<RectangularButton> hatButtons;
  
  RectangularButton checkButton;
  RectangularButton xButton;
  RectangularButton cancelButton; 
  RectangularButton useThisButton;
  
  Float leftPlayButtonx = 307.34927;
  Float leftPlayButtony = 361.435;
  Float rightPlayButtonx = 923.991;
  Float rightPlayButtony = 365.32138;
  Float leftIPreferThisButtonx = 210.18935;
  Float leftIPreferThisButtony = 500.04984;
  Float rightIPreferThisButtonx = 828.1266;
  Float rightIPreferThisButtony = 501.3453;
  Float useThisBeatLeftButtonx = 179.09816;
  Float useThisBeatLeftButtony = 572.59595;
  Float useThisBeatRightButtonx = 806.10364;
  Float useThisBeatRightButtony = 573.8914;

  PImage purplePlayButtonImage = loadImage("PlayButtonPurple.png");
  PImage tealPlayButtonImage = loadImage("PlayButtonTeal.png");
  PImage purplePauseButtonImage = loadImage("PauseButtonPurple.png");
  PImage tealPauseButtonImage = loadImage("PauseButtonTeal.png");
  PImage purpleMusicPlayingImage = loadImage("MusicPlayingPurple.png");
  PImage tealMusicPlayingImage = loadImage("MusicPlayingTeal.png");
  PImage preferPurpleButtonImage = loadImage("IPreferThisButtonPurple.png");
  PImage preferTealButtonImage = loadImage("IPreferThisButtonTeal.png");
  PImage useThisInSongButtonImage = loadImage("UseThisInSongButton.png");
  
  ThisOrThat() {
    whatHasChangedInBeat1 = new Boolean[3]; // kick - 0, snare - 1, hi-hat - 2
    whatHasChangedInBeat2 = new Boolean[3];
    beats1 = new Boolean[16][3];
    beats2 = new Boolean[16][3];
    beatNumber = 0;
    // TODO - populate beat with stuff from genetic algorithm and call func for it 
    // call fittest beat here instead of populating empty array
    for (int i = 0; i < 16; i++) {
      for (int j = 0; j < 3; j++) {
        beats1[i][j] = false; // temp
      }
    }
    // TODO - populate beat with stuff from genetic algorithm and call func for it 
    // call 2nd most fit beat here instead of populating empty array
   for (int i = 0; i < 16; i++) {
      for (int j = 0; j < 3; j++) {
        beats2[i][j] = false; // temp
      }
    }
    
    // create linear beats - TODO update to grab the beat we have 
    kickButtons = new ArrayList<RectangularButton>();
    for (int k = 0; k < 17; k++) {
      kickButtons.add(new RectangularButton(-13421259, -2039584, 3.553719, -2039584, (178 + 70*k), 630, 1.5728104, -27.204773, -24.613892, 24, 24));
      //kickButtons.get(k).setSelected(Beats.getBeatValue(1,k));
    }
    snareButtons = new ArrayList<RectangularButton>();
    for (int m = 0; m < 17; m++) {
      snareButtons.add(new RectangularButton(-13421259, -2039584, 3.553719, -2039584, (178 + 70*m), 690, 1.5728104, -25.909317, -24.749884, 24, 24));
      //snareButtons.get(m).setSelected(Beats.getBeatValue(2,m));
    }
    hatButtons = new ArrayList<RectangularButton>();
    for (int n = 0; n < 17; n++) {
      hatButtons.add(new RectangularButton(-13421259, -2039584, 3.553719, -2039584, (178 + 70*n), 750, 1.5728104, -25.909317, -24.749884, 24, 24));
      //hatButtons.get(n).setSelected(Beats.getBeatValue(1,n));
    }
  }

  void update() {
    // TODO: if user clicks main button then pause music ?? - is this even possible ?? - need to look into this based on what is done in the play functions. 
    if (mousePressed == true && mouseButton == LEFT) {
      if (((mouseX >= leftPlayButtonx && mouseX <= leftPlayButtonx + 100) || (mouseX >= leftPlayButtonx - 100 && mouseX <= leftPlayButtonx)) 
      && ((mouseY >= leftPlayButtony && mouseY <= leftPlayButtony + 120) || (mouseY >= leftPlayButtony - 120 && mouseY <= leftPlayButtony))) {
         // user wants to play left beat (teal)
        // TODO: link up to play button 
        playBeatOutLoud();
      } else if (((mouseX >= rightPlayButtonx && mouseX <= rightPlayButtonx + 100) || (mouseX >= rightPlayButtonx - 100 && mouseX <= rightPlayButtonx)) 
      && ((mouseY >= rightPlayButtony && mouseY <= rightPlayButtony + 100) || (mouseY >= rightPlayButtony - 100 && mouseY <= rightPlayButtony))) {
        // user wants to play right beat (purple)
        // TODO: link up to play button 
        playBeatOutLoud();
      } else if (((mouseX >= leftIPreferThisButtonx && mouseX <= leftIPreferThisButtonx + 270) || (mouseX >= leftIPreferThisButtonx - 270 && mouseX <= leftIPreferThisButtonx)) 
      && ((mouseY >= leftIPreferThisButtony && mouseY <= leftIPreferThisButtony + 70) || (mouseY >= leftIPreferThisButtony - 70 && mouseY <= leftIPreferThisButtony))) {
        // user prefers left beat (teal)
        // TODO - let the GA know that the user likes the beat
        // TODO - get a new beat from GA - will this by calling fittestbeat()? 
      } else if (((mouseX >= rightIPreferThisButtonx && mouseX <= rightIPreferThisButtonx + 270) || (mouseX >= rightIPreferThisButtonx - 270 && mouseX <= rightIPreferThisButtonx)) 
      && ((mouseY >= rightIPreferThisButtony && mouseY <= rightIPreferThisButtony + 70) || (mouseY >= rightIPreferThisButtony - 70 && mouseY <= rightIPreferThisButtony))) {
         // user prefers right beat (purple)
        // TODO - let the GA know that the user does not like the beat the beat 
        // TODO - get a new beat from GA - will this by calling fittestbeat()? 
      } else if (((mouseX >= useThisBeatLeftButtonx && mouseX <= useThisBeatLeftButtonx + 300) || (mouseX >= useThisBeatLeftButtonx - 300 && mouseX <= useThisBeatLeftButtonx)) 
      && ((mouseY >= useThisBeatLeftButtony && mouseY <= useThisBeatLeftButtony + 60) || (mouseY >= useThisBeatLeftButtony - 60 && mouseY <= useThisBeatLeftButtony))) {
        // user wants to use left beat in song (teal)
        // TODO: are we going to handle this in prototype?? 
      } else if (((mouseX >= useThisBeatRightButtonx && mouseX <= useThisBeatRightButtonx + 300) || (mouseX >= useThisBeatRightButtonx - 300 && mouseX <= useThisBeatRightButtonx)) 
      && ((mouseY >= useThisBeatRightButtony && mouseY <= useThisBeatRightButtony + 60) || (mouseY >= useThisBeatRightButtony - 60 && mouseY <= useThisBeatRightButtony))) {
        // user wants to use right beat in song (purple)
        // TODO: are we going to handle this in prototype?? 
      } 
    }
  }
  
  void playBeatOutLoud() {
    // TODO: Update once we have this functionality
  }
  
  void selectedPreferredBeat() {
    // TODO: let GA know which beat was selected so it can update 
    // TODO: set variable here 
  }
  
  void render() {
    playBeatOutLoud();
    // Background 
    size(1300, 800);
    background(41, 41, 41);

    // Right background card 
    fill(-13421773);
    strokeWeight(3.0);
    stroke(-6710887);
    pushMatrix();
    translate(861.80865, 183.95616);
    rotate(-9.162426E-4);
    rectMode(CORNERS);
    rect(-173.61174, -119.29545, 347.53275, 466.36768, 7);
    popMatrix();

    // Right circle 
    fill(-3881788);
    noStroke();
    pushMatrix();
    translate(961.5596, 213.75188);
    rotate(0.0);
    ellipse(0,0,249.59152, 254.7164);
    popMatrix();
    
    // Right box under card
    fill(-3881788);
    noStroke();
    pushMatrix();
    translate(723.19385, 703.438);
    rotate(3.8194656E-4);
    rectMode(CORNERS);
    rect(-32.38664, -31.198956, 492.33835, 76.47633, 7);
    popMatrix();

    // Purple play button 
    noFill();
    noStroke();
    pushMatrix();
    translate(923.991, 365.32138);
    rotate(-0.019580245);
    rectMode(CORNERS);
    rect(0, 0, 91.92437, 106.6844);
    image(purplePlayButtonImage, 0, 0, 91.92437, 106.6844);
    popMatrix();
    
    // Left background card 
    fill(-13421773);
    strokeWeight(3.0);
    stroke(-6710887);
    pushMatrix();
    translate(356.577, 305.72995);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-270.963, -238.6507, 250.1457, 342.02515, 7);
    popMatrix();
    
    // Left circle
    fill(-3881788);
    strokeWeight(1.0);
    stroke(-16777216);
    pushMatrix();
    translate(342.32687, 218.93373);
    rotate(0.044894785);
    ellipse(0,0,245.37363, 245.37363);
    popMatrix();
    
    // Left box under card 
    fill(-3881788);
    noStroke();
    pushMatrix();
    translate(334.55408, 725.4609);
    rotate(3.141593);
    rectMode(CORNERS);
    rect(-277.47473, -56.88257, 246.67317, 50.055923, 7);
    popMatrix();
    
    // Teal play button 
    noFill();
    noStroke();
    pushMatrix();
    translate(307.34927, 361.435);
    rotate(0.0);
    rectMode(CORNERS);
    rect(0, 0, 97.15997, 111.410065);
    image(tealPlayButtonImage, 0, 0, 97.15997, 111.410065);
    popMatrix();
    
    // Music playing purple
    noFill();
    noStroke();
    pushMatrix();
    translate(860.51324, 120.478325);
    rotate(0.0012323856);
    rectMode(CORNERS);
    rect(0, 0, 203.38818, 189.138);
    image(purpleMusicPlayingImage, 0, 0, 203.38818, 189.138);
    popMatrix();
    
    // Music playing teal
    noFill();
    noStroke();
    pushMatrix();
    translate(246.46239, 132.13753);
    rotate(0.0);
    rectMode(CORNERS);
    rect(0, 0, 196.91081, 183.95615);
    image(tealMusicPlayingImage, 0, 0, 196.91081, 183.95615);
    popMatrix();

    // I prefer this button purple
    noFill();
    noStroke();
    pushMatrix();
    translate(828.1266, 501.3453);
    rotate(0.0);
    rectMode(CORNERS);
    rect(0, 0, 250.0249, 55.705017);
    image(preferPurpleButtonImage, 0, 0, 250.0249, 55.705017);
    popMatrix();
    
    // I prefer this button teal
    noFill();
    noStroke();
    pushMatrix();
    translate(210.18935, 500.04984);
    rotate(0.0);
    rectMode(CORNERS);
    rect(0, 0, 250.0249, 55.705017);
    image(preferTealButtonImage, 0, 0, 250.0249, 55.705017);
    popMatrix();
    
    // right use this in song button
    noFill();
    noStroke();
    pushMatrix();
    translate(806.10364, 573.8914);
    rotate(0.0);
    rectMode(CORNERS);
    rect(0, 0, 292.77533, 53.114136);
    image(useThisInSongButtonImage, 0, 0, 292.77533, 53.114136);
    popMatrix();
    
    // left use this in song button
    noFill();
    noStroke();
    pushMatrix();
    translate(179.09816, 572.59595);
    rotate(0.0);
    rectMode(CORNERS);
    rect(0, 0, 301.84354, 53.114075);
    image(useThisInSongButtonImage, 0, 0, 301.84354, 53.114075);
    popMatrix();
    
    calculateWhatHasChangedInBeat1();
    calculateWhatHasChangedInBeat2();
    //String changedTextInBeat1 = "This changed: " + formatTextForWhatHasChanged(whatHasChangedInBeat1);
    //String changedTextInBeat2 = "This changed: " + formatTextForWhatHasChanged(whatHasChangedInBeat2);
    // TODO: use these variables 
  } 
  
  void calculateWhatHasChangedInBeat1() {
    //whatHasChangedInBeat1
    // TODO - compare against original to see what has changed 
  }
  
  void calculateWhatHasChangedInBeat2() {
    //whatHasChangedInBeat2
    // TODO - compare against original to see what has changed
  }
  
  String formatTextForWhatHasChanged(Boolean[] changedArray) {
    String changedText = "";
    if (changedArray[0] == true) {
      changedText += " Kick Drum ";
    }
    if (changedArray[1] == true) {
      changedText += " Snare Drum ";
    }
    if (changedArray[2] == true) {
      changedText += " Hi-Hat Drum ";
    }
    return changedText;
  }
}