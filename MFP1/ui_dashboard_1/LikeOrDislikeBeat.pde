import java.awt.Rectangle;

class LikeOrDislikeBeat {
  Boolean[][] beats;
  Integer beatNumber;
  DrumBeats Beats;
  ArrayList<RectangularButton> kickButtons;
  ArrayList<RectangularButton> snareButtons;
  ArrayList<RectangularButton> hatButtons;
  
  RectangularButton checkButton;
  RectangularButton xButton;
  RectangularButton cancelButton; 
  RectangularButton useThisButton;
 
  PImage xImage = loadImage("X.png");
  PImage checkMarkImage = loadImage("CheckMark.png");
  PImage musicPlayingImage = loadImage("MusicPlaying.png");
  PImage useThisBeatButtonImage = loadImage("useThisBeatButton.png");
  PImage kickDrumImage = loadImage("Kick.png");
  PImage snareImage = loadImage("Snare.png");
  PImage hiHatImage = loadImage("HiHat.png");
  
  LikeOrDislikeBeat() {
    beats = new Boolean[16][3];
    beatNumber = 0;
    // TODO populate beat with stuff from genetic algorithm and call func for it 
    for (int i = 0; i < 16; i++) {
      for (int j = 0; j < 3; j++) {
        beats[i][j] = false;
      }
    }
    
    //   RectangularButton(int fill, float strokeWeight, int stroke, float transX, float transY, float rotate, float rect1, float rect2, float rect3, float rect4, String text, float textX, float textY, int textSize){
      
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
    // get next fittest beat 
  }
  
  void render() {
    // Background 
    size(1300, 800);
    background(41, 41, 41);
    
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
    noFill();
    noStroke();
    pushMatrix();
    translate(534.0558, 129.54659);
    rotate(0.0016467571);
    rectMode(CORNERS);
    rect(0, 0, 205.97913, 177.47882);
    image(musicPlayingImage, 0, 0, 205.97913, 177.47882);
    popMatrix();
    
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
    
    // Main Header Text
    String beatTitle = "Beat " + str(beatNumber);
    fill(-3881788);
    textSize(32);
    text(beatTitle, 10, 10, 150, 100);  // Text wraps within text box
    
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
    for (int i = 0; i < hatButtons.size() - 1; i++){
      kickButtons.get(i).renderWithoutText();
      snareButtons.get(i).renderWithoutText();
      hatButtons.get(i).renderWithoutText();
    }
  } 
}
