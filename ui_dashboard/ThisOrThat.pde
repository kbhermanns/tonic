import java.awt.Rectangle;

class ThisOrThat {
  DrumBeats originalBeat;
  DrumBeats beats1;
  DrumBeats beats2;
  boolean[] whatHasChangedInBeat1; // kick - 0, snare - 1, hi-hat - 2
  boolean[] whatHasChangedInBeat2;
  Integer beatNumber;

  BeatPopulation population;
  boolean firstPairCreated = false;

  //DrumBeats Beats;
  //BeatPopulation beatPopulation;
  ArrayList<RectangularButton> kickButtons;
  ArrayList<RectangularButton> snareButtons;
  ArrayList<RectangularButton> hatButtons;
  
  RectangularButton checkButton;
  RectangularButton xButton;
  RectangularButton cancelButton; 
  RectangularButton useThisButton;
  GButton playGA1;
  GButton playGA2;
  GButton preferThisBeatGA1;
  GButton preferThisBeatGA2;
  GButton useThisInSongGA1;
  GButton useThisInSongGA2;
  
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
  Float topRightXButtonx = 2306.4026;
  Float topRightXButtony = 10.363728;

  PImage closeButtonImage = loadImage("lightGreyCloseButton.png");
  PImage purplePlayButtonImage = loadImage("PlayButtonPurple.png");
  PImage tealPlayButtonImage = loadImage("PlayButtonTeal.png");
  PImage purplePauseButtonImage = loadImage("PauseButtonPurple.png");
  PImage tealPauseButtonImage = loadImage("PauseButtonTeal.png");
  PImage purpleMusicPlayingImage = loadImage("MusicPlayingPurple.png");
  PImage tealMusicPlayingImage = loadImage("MusicPlayingTeal.png");
  PImage preferPurpleButtonImage = loadImage("IPreferThisButtonPurple.png");
  PImage preferTealButtonImage = loadImage("IPreferThisButtonTeal.png");
  PImage useThisInSongButtonImage = loadImage("UseThisInSongButton.png");
  
  PApplet pa;
  
  ThisOrThat(DrumBeats userCreatedBeats, PApplet papp) {
    whatHasChangedInBeat1 = new boolean[3]; // kick - 0, snare - 1, hi-hat - 2
    whatHasChangedInBeat2 = new boolean[3];
    originalBeat = userCreatedBeats;
    pa = papp;
    beats1 = new DrumBeats(pa,3,16);
    beats2 = new DrumBeats(pa,3,16);
    beatNumber = 0;

    // Create a population with a mutation rate, population size, number of instruments,
    // length of beat, and the original user-created beat.
    population = new BeatPopulation(
      0.01, 50,
      beats1.beats.length, beats1.beats[0].length
    );
    
    kickButtons = new ArrayList<RectangularButton>();
    for (int k = 0; k < 17; k++) {
      kickButtons.add(new RectangularButton(-13421259, -2039584, 3.553719, -2039584, (178 + 70*k), 630, 1.5728104, -27.204773, -24.613892, 24, 24));
    }
    snareButtons = new ArrayList<RectangularButton>();
    for (int m = 0; m < 17; m++) {
      snareButtons.add(new RectangularButton(-13421259, -2039584, 3.553719, -2039584, (178 + 70*m), 690, 1.5728104, -25.909317, -24.749884, 24, 24));
    }
    hatButtons = new ArrayList<RectangularButton>();
    for (int n = 0; n < 17; n++) {
      hatButtons.add(new RectangularButton(-13421259, -2039584, 3.553719, -2039584, (178 + 70*n), 750, 1.5728104, -25.909317, -24.749884, 24, 24));
    }
    
       playGA1 = new GButton(pa, 310, 400, 80, 30, "PLAY");
   playGA1.addEventHandler(pa, "playGA1Handler");
   playGA1.setVisible(false);
   
   playGA2 = new GButton(pa, 935, 400, 80, 30, "PLAY");
   playGA2.addEventHandler(pa, "playGA2Handler");
   playGA2.setVisible(false);
   
   preferThisBeatGA1 = new GButton(pa, 250, 480, 200, 60, "I Prefer this Beat");
   preferThisBeatGA1.addEventHandler(pa, "preferThisBeatHandler1");
   preferThisBeatGA1.setLocalColor(2, color(41,41,41)); //text color
   preferThisBeatGA1.setLocalColor(3, color(66,65,62)); //border colour
   preferThisBeatGA1.setLocalColor(4, color(3, 218, 198)); //background color
   preferThisBeatGA1.setFont(new Font("Gothic A1", Font.PLAIN, 25));
   preferThisBeatGA1.setVisible(false);
   
   preferThisBeatGA2 = new GButton(pa, 870, 480, 200, 60, "I Prefer this Beat");
   preferThisBeatGA2.addEventHandler(pa, "preferThisBeatHandler2");
   preferThisBeatGA2.setLocalColor(2, color(41,41,41)); //text color
   preferThisBeatGA2.setLocalColor(3, color(66,65,62)); //border colour
   preferThisBeatGA2.setLocalColor(4, color(187, 134, 252)); //background color
   preferThisBeatGA2.setFont(new Font("Gothic A1", Font.PLAIN, 25));
   preferThisBeatGA2.setVisible(false);
   
   useThisInSongGA1 = new GButton(pa, 230, 550, 250, 60, "Use this Beat in Song");
   useThisInSongGA1.addEventHandler(pa, "useThisInSongBeatHandler1");
   useThisInSongGA1.setLocalColor(2, color(41,41,41)); //text color
   useThisInSongGA1.setLocalColor(3, color(66,65,62)); //border colour
   useThisInSongGA1.setLocalColor(4, color(3, 218, 198)); //background color
   useThisInSongGA1.setFont(new Font("Gothic A1", Font.PLAIN, 25));
   useThisInSongGA1.setVisible(false);
   
   useThisInSongGA2 = new GButton(pa, 850, 550, 250, 60, "Use this Beat in Song");
   useThisInSongGA2.addEventHandler(pa, "useThisInSongBeatHandler2");
   useThisInSongGA2.setLocalColor(2, color(41,41,41)); //text color
   useThisInSongGA2.setLocalColor(3, color(66,65,62)); //border colour
   useThisInSongGA2.setLocalColor(4, color(187, 134, 252)); //background color
   useThisInSongGA2.setFont(new Font("Gothic A1", Font.PLAIN, 25));
   useThisInSongGA2.setVisible(false);
   
   getHelpFromAlgorithm = new GButton(pa, 950, 450, 320, 60, "Get Help from Algorithm");
   getHelpFromAlgorithm.addEventHandler(pa, "getHelpFromAlgorithmHandler");
   getHelpFromAlgorithm.setLocalColor(2, color(41,41,41)); //text color
   getHelpFromAlgorithm.setLocalColor(3, color(51,174,100)); //border colour
   getHelpFromAlgorithm.setLocalColor(4, color(3, 218, 198)); //background color
   getHelpFromAlgorithm.setFont(new Font("Gothic A1", Font.PLAIN, 25));
   getHelpFromAlgorithm.setVisible(false);
  }

  void update() {
      // Run the GA upon initialization without user input to get the first pair of beats.
      if (!firstPairCreated) {
        population.run(null, null, originalBeat.beats, target_beats, 100);
        beats1.beats = population.getBestBeat();
        beats2.beats = population.getSecondBestBeat();
        firstPairCreated = true;
      }
  }
  
  void render() {
    playGA1.setVisible(true); 
    playGA2.setVisible(true);
    preferThisBeatGA1.setVisible(true);
    preferThisBeatGA2.setVisible(true);
    useThisInSongGA1.setVisible(true);
    useThisInSongGA2.setVisible(true);
    
    // Background 
    size(1300, 800);
    background(41, 41, 41);
    
    // close button top right
    noFill();
    noStroke();
    pushMatrix();
    translate(1206.4026, 10.363728);
    rotate(0.0);
    rectMode(CORNERS);
    rect(0, 0, 76.00952, 79.57245);
    image(closeButtonImage, 0, 0, 50, 50);
    popMatrix();
    
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

    calculateWhatHasChangedInBeat1();
    calculateWhatHasChangedInBeat2();

    // Left text in bottom box 
    String changedTextInBeat1 = "This changed: \n" + formatTextForWhatHasChanged(whatHasChangedInBeat1);
    fill(-13421773);
    textSize(20);
    text(changedTextInBeat1, 200, 730);  // Text wraps within text box
    
    // Right text in bottom box 
    String changedTextInBeat2 = "This changed: \n" + formatTextForWhatHasChanged(whatHasChangedInBeat2);
    fill(-13421773);
    textSize(20);
    text(changedTextInBeat2, 800, 730);  // Text wraps within text box
  } 
  
  void calculateWhatHasChangedInBeat1() {
    // comparing originalBeat to beats1
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 15; j++) {
        if (originalBeat.getBeat(i, j) != beats1.getBeat(i, j)) {
          // break out of inner loop 
          whatHasChangedInBeat1[i] = true;
          j = 15;
        } else {
          whatHasChangedInBeat1[i] = false;
        }
      }
    }
  }
  
  void calculateWhatHasChangedInBeat2() {
    // comparing originalBeat to beats1
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 15; j++) {
        if (originalBeat.getBeat(i, j) != beats2.getBeat(i, j)) {
          // break out of inner loop 
          whatHasChangedInBeat1[i] = true;
          j = 15;
        } else {
          whatHasChangedInBeat1[i] = false;
        }
      }
    }
  }
  
  String formatTextForWhatHasChanged(boolean[] changedArray) {
    String changedText = "";
    if (changedArray[0] == true) {
      changedText += " Kick Drum \n";
    }
    if (changedArray[1] == true) {
      changedText += " Snare Drum \n";
    }
    if (changedArray[2] == true) {
      changedText += " Hi-Hat Drum ";
    }
    return changedText;
  }
  
  DrumBeats getBeat1() {
    return beats1;
  }

  DrumBeats getBeat2() {
    return beats2;
  }
  
  public void preferThisBeatHandler1(GButton button, GEvent event) {  
   // user prefers left beat (teal)
   population.run(beats1.beats, beats2.beats, originalBeat.beats, target_beats, 100);
   beats1.beats = gaBeatPopulation1.getBestBeat();
   beats2.beats = gaBeatPopulation1.getSecondBestBeat();
  }

  public void preferThisBeatHandler2(GButton button, GEvent event) {  
     // user prefers left beat (teal)
     population.run(beats2.beats, beats1.beats, originalBeat.beats, target_beats, 100);
     beats1.beats = gaBeatPopulation1.getBestBeat();
     beats.beats = gaBeatPopulation1.getSecondBestBeat();
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
}
