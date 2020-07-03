import java.awt.Rectangle;

class LikeOrDislikeBeat {
  DrumBeats beats;
  Integer beatNumber;
  BeatPopulation beatPopulation;
  ArrayList<RectangularButton> kickButtons;
  ArrayList<RectangularButton> snareButtons;
  ArrayList<RectangularButton> hatButtons;

  Float xButtonx = 673.9661;
  Float xButtony = 371.7987;
  Float checkMarkButtonx = 536.6467;
  Float checkMarkButtony = 367.91232;
  Float useThisBeatButtonx = 518.5102;
  Float useThisBeatButtony = 483.20877;
  Float playButtonCenterx = 0.0;
  Float playButtonCentery = 0.0;
 
  Boolean isPlaying = false; 
  Boolean wasPressed = false;
  Boolean wasEditingOnLinearLayout = false;
  
  RectangularButton checkButton;
  RectangularButton xButton;
  RectangularButton cancelButton; 
  RectangularButton useThisButton;
 
  PImage closeButtonImage = loadImage("lightGreyCloseButton.png");
  PImage xImage = loadImage("X.png");
  PImage checkMarkImage = loadImage("CheckMark.png");
  PImage musicPlayingImage = loadImage("MusicPlaying.png");
  PImage playButtonImage = loadImage("PlayButton.png");
  PImage pauseButtonImage = loadImage("PauseButton.png");
  PImage useThisBeatButtonImage = loadImage("useThisBeatButton.png");
  PImage kickDrumImage = loadImage("Kick.png");
  PImage snareImage = loadImage("Snare.png");
  PImage hiHatImage = loadImage("HiHat.png");
  
  LikeOrDislikeBeat(DrumBeats userCreatedBeats, Boolean isComingFromLinearLayout) {
    beats = userCreatedBeats;
    wasEditingOnLinearLayout = isComingFromLinearLayout;
    beatNumber = 0;
    
    // create linear beats - TODO update to grab the beat we have 
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
  }

  void update() {
    println("ABBY - on this screen - x " + mouseX);
    println("ABBY - on this screen - y " + mouseY);
    if (mousePressed == true && mouseButton == LEFT) {
      if (((mouseX >= checkMarkButtonx && mouseX <= checkMarkButtonx + 100) || (mouseX >= checkMarkButtonx - 100 && mouseX <= checkMarkButtonx)) 
      && ((mouseY >= checkMarkButtony && mouseY <= checkMarkButtony + 100) || (mouseY >= checkMarkButtony - 100 && mouseY <= checkMarkButtony))) {
        // user likes the beat 
        beatNumber += 1;
        // TODO - let the GA know that the user likes the beat
        // TODO - get a new beat from GA - will this by calling fittestbeat()? 
        playBeatOutLoud();
      } else if (((mouseX >= xButtonx && mouseX <= xButtonx + 100) || (mouseX >= xButtonx - 100 && mouseX <= xButtonx)) 
      && ((mouseY >= xButtony && mouseY <= xButtony + 100) || (mouseY >= xButtony - 100 && mouseY <= xButtony))) {
        // user dislikes the beat 
          beatNumber += 1;
        // TODO - let the GA know that the user does not like the beat the beat 
        // TODO - get a new beat from GA - will this by calling fittestbeat()? 
        playBeatOutLoud();
      } else if (((mouseX >= useThisBeatButtonx && mouseX <= useThisBeatButtonx + 270) || (mouseX >= useThisBeatButtonx - 270 && mouseX <= useThisBeatButtonx)) 
      && ((mouseY >= useThisBeatButtony && mouseY <= useThisBeatButtony + 100) || (mouseY >= useThisBeatButtony - 100 && mouseY <= useThisBeatButtony))) {
        // We want to route back to the page the user came from. 
        // user wants to use the beat in their song
        // TODO - close this page and navigate back to the beat implementation page 
        // let GA know this is the fittest beat?? - maybe? 
      } else if (((mouseX >= playButtonCenterx && mouseX <= playButtonCenterx + 270) || (mouseX >= playButtonCenterx - 270 && mouseX <= playButtonCenterx)) 
      && ((mouseY >= playButtonCentery && mouseY <= playButtonCentery + 100) || (mouseY >= playButtonCentery - 100 && mouseY <= playButtonCentery))) {
        // user is clicking either play or pause 
        isPlaying = !isPlaying;
        
        // Dark grey circle 
        fill(-13421773);
        noStroke();
        pushMatrix();
        translate(637.69305, 222.82013);
        rotate(0.0);
        ellipse(0,0,249.59152, 254.7164);
        popMatrix();
        
        if (isPlaying) {
          playBeatOutLoud();
          //Beat Playing Image
          noFill();
          noStroke();
          pushMatrix();
          translate(534.0558, 129.54659);
          rotate(0.0016467571);
          rectMode(CORNERS);
          rect(0, 0, 205.97913, 177.47882);
          image(musicPlayingImage, 0, 0, 205.97913, 177.47882);
          popMatrix();
        } else {
          stopPlayingMusic();
         // Play button center of circle
         noFill();
         noStroke();
         pushMatrix();
         translate(581.98804, 161.93324);
         rotate(-0.0012860298);
         rectMode(CORNERS);
         rect(0, 0, 128.09612, 120.643166);
         image(playButtonImage, 0, 0, 128.09612, 120.643166);
         popMatrix();
        }
      } 
    }
  }
  
  void playBeatOutLoud() {
    // TODO - integrate with other code to play this outloud 
  }
  
  void stopPlayingMusic() {
    // TODO - integrate with other code to stop playing music 
  }
  
  void render() {
    playBeatOutLoud();
    // Background 
    size(1300, 800);
    background(41, 41, 41);
 
    // Main Header Text
    String beatTitle = "Beat " + str(beatNumber);
    fill(-3881788);
    textSize(32);
    text(beatTitle, 10, 10, 150, 100);  // Text wraps within text box

    // Close Button top right corner 
    noFill();
    noStroke();
    pushMatrix();
    translate(1206.4026, 10.363728);
    rotate(0.0);
    rectMode(CORNERS);
    rect(0, 0, 76.00952, 79.57245);
    image(closeButtonImage, 0, 0, 70, 70);
    popMatrix();

    // Lighter grey card
    fill(-3881788);
    strokeWeight(1.0);
    stroke(0);
    pushMatrix();
    translate(557.3742, 190.43349);
    rotate(-9.162426E-4);
    rectMode(CORNERS);
    rect(-173.61174, -119.29545, 347.53275, 383.51266, 7);
    popMatrix();
    
    // Dark grey circle 
    fill(-13421773);
    noStroke();
    pushMatrix();
    translate(637.69305, 222.82013);
    rotate(0.0);
    ellipse(0,0,249.59152, 254.7164);
    popMatrix();
    
    // Beat Playing Image
    //noFill();
    //noStroke();
    //pushMatrix();
    //translate(534.0558, 129.54659);
    //rotate(0.0016467571);
    //rectMode(CORNERS);
    //rect(0, 0, 205.97913, 177.47882);
    //image(musicPlayingImage, 0, 0, 205.97913, 177.47882);
    //popMatrix();
    
    // Check Mark Image
    noFill();
    noStroke();
    pushMatrix();
    translate(536.6467, 367.91232);
    rotate(-6.3467026E-4);
    rectMode(CORNERS);
    rect(0, 0, 95.86444, 89.387146);
    image(checkMarkImage, 0, 0, 95.86444, 89.387146);
    popMatrix();
    
    // X Image 
    noFill();
    noStroke();
    pushMatrix();
    translate(673.9661, 371.7987);
    rotate(0.0);
    rectMode(CORNERS);
    rect(0, 0, 73.84155, 80.31888);
    image(xImage, 0, 0, 73.84155, 80.31888);
    popMatrix();
    
    // Save Button 
    noFill();
    noStroke();
    pushMatrix();
    translate(518.5102, 483.20877);
    rotate(-2.2353232E-4);
    rectMode(CORNERS);
    rect(0, 0, 261.68414, 68.6597);
    image(useThisBeatButtonImage, 0, 0, 261.68414, 68.6597);
    popMatrix();
    
     // Play button center of circle
     noFill();
     noStroke();
     pushMatrix();
     translate(581.98804, 161.93324);
     rotate(-0.0012860298);
     rectMode(CORNERS);
     rect(0, 0, 128.09612, 120.643166);
     image(playButtonImage, 0, 0, 128.09612, 120.643166);
     popMatrix();

    // Play button in top right corner
    //noFill();
    //noStroke();
    //pushMatrix();
    //translate(403.21375, 76.43249);
    //rotate(0.023546413);
    //rectMode(CORNERS);
    //rect(0, 0, 54.471916, 57.029278);
    //image(playButtonImage, 0, 0, 54.471916, 57.029278);
    //image(pauseButtonImage, 0, 0, 50.189808, 54.71725);
    //popMatrix();
    
    // Bottom section showing beat breakdown
    fill(-13421773);
    noStroke();
    pushMatrix();
    translate(159.66617, 674.93774);
    rotate(3.8194656E-4);
    rectMode(CORNERS);
    rect(-106.236115, -78.41584, 1058.3988, 107.554886, 7);
    popMatrix();
    
    // Bottom section kick drum
    noFill();
    noStroke();
    pushMatrix();
    translate(66.392624, 606.278);
    rotate(-0.021530986);
    rectMode(CORNERS);
    rect(0, 0, 46.636772, 58.29596);
    image(kickDrumImage, 0, 0, 46.636772, 58.29596);
    popMatrix();

    // Bottom section snare drum
    noFill();
    noStroke();
    pushMatrix();
    translate(66.392624, 672.3468);
    rotate(0.0);
    rectMode(CORNERS);
    rect(0, 0, 53.114105, 44.045837);
    image(snareImage, 0, 0, 53.114105, 44.045837);
    popMatrix();
    
    // Bottom section hi-hat
    noFill();
    noStroke();
    pushMatrix();
    translate(63.801697, 725.4609);
    rotate(-0.004789591);
    rectMode(CORNERS);
    rect(0, 0, 59.59143, 44.045837);
    image(hiHatImage, 0, 0, 59.59143, 44.045837);
    popMatrix();
    
    // Drum beat linear layout boxes
    for (int i = 0; i < 15; i++){
      // TODO - update this with the algorithm created beat instead of OG beat
      kickButtons.get(i).setSelected(beats.getBeat(0, i));
      kickButtons.get(i).renderWithoutText();
      snareButtons.get(i).setSelected(beats.getBeat(1, i));
      snareButtons.get(i).renderWithoutText();
      hatButtons.get(i).setSelected(beats.getBeat(2, i));
      hatButtons.get(i).renderWithoutText();
    }
  } 
  DrumBeats getBeat() {return beats;}
}
