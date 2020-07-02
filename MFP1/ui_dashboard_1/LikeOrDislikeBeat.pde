import java.awt.Rectangle;

class LikeOrDislikeBeat {
  Boolean[][] beats;
  Integer beatNumber;
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
  
  LikeOrDislikeBeat() {
    beats = new Boolean[16][3];
    beatNumber = 0;
    // TODO populate beat with stuff from genetic algorithm and call func for it 
    for (int i = 0; i < 16; i++) {
      for (int j = 0; j < 3; j++) {
        beats[i][j] = false;
      }
    }
    
  }
  
  void update() {
    
  }
  
  void render() {
    // Background 
    size(1300, 800);
    background(41, 41, 41);
    
    // Could use this for Prototype 2
    //fill(-3881788);
    //strokeWeight(1.0);
    //stroke(0);
    //pushMatrix();
    //translate(649.3523, 388.63977);
    //rotate(-3.1399002);
    //rectMode(CORNERS);
    //rect(-522.0792, -262.9923, 520.83527, 257.84982, 7);
    //popMatrix();

    
    //lighter grey card
    fill(-3881788);
    strokeWeight(1.0);
    stroke(0);
    pushMatrix();
    translate(557.3742, 190.43349);
    rotate(-9.162426E-4);
    rectMode(CORNERS);
    rect(-173.61174, -119.29545, 347.53275, 383.51266, 7);
    popMatrix();
    
    // dark grey circle 
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
    
    // Main Header Text
    String beatTitle = "Beat " + str(beatNumber);
    fill(-3881788);
    textSize(32);
    text(beatTitle, 10, 10, 150, 100);  // Text wraps within text box
    
    //Bottom Section Showing Beat Breakdown
    fill(-3881788);
    noStroke();
    pushMatrix();
    translate(159.66617, 674.93774);
    rotate(3.8194656E-4);
    rectMode(CORNERS);
    rect(-106.236115, -78.41584, 1058.3988, 107.554886, 7);
    popMatrix();
  }
}




//  fill(-13421773);
//  strokeWeight(1.0);
//  stroke(0);
//  pushMatrix();
//  translate(557.3742, 190.43349);
//  rotate(-9.162426E-4);
//  rectMode(CORNERS);
//  rect(-173.61174, -119.29545, 347.53275, 383.51266);
//  popMatrix();

//  fill(-3881788);
//  noStroke();
//  pushMatrix();
//  translate(637.69305, 222.82013);
//  rotate(0.0);
//  ellipse(0,0,249.59152, 254.7164);
//  popMatrix();

///*ADD ME AS A GLOBAL VARIABLE!

// PImage img3;

//PUT ME IN YOUR setup() FUNCTION!

//img3 = loadImage("/Users/jackmartin/Documents/SYDE/3A/SYDE 361 - Design/tonic/MFP1/ui_dashboard_1/MusicPlaying.png");

//*/
//  noFill();
//  noStroke();
//  pushMatrix();
//  translate(534.0558, 129.54659);
//  rotate(0.0016467571);
//  rectMode(CORNERS);
//  rect(0, 0, 205.97913, 177.47882);
//  image(img3, 0, 0, 205.97913, 177.47882);
//  popMatrix();

///*ADD ME AS A GLOBAL VARIABLE!

// PImage img3;

//PUT ME IN YOUR setup() FUNCTION!

//img3 = loadImage("/Users/jackmartin/Documents/SYDE/3A/SYDE 361 - Design/tonic/MFP1/ui_dashboard_1/CheckMark.png");

//*/
//  noFill();
//  noStroke();
//  pushMatrix();
//  translate(536.6467, 367.91232);
//  rotate(-6.3467026E-4);
//  rectMode(CORNERS);
//  rect(0, 0, 95.86444, 89.387146);
//  image(img3, 0, 0, 95.86444, 89.387146);
//  popMatrix();

///*ADD ME AS A GLOBAL VARIABLE!

// PImage img4;

//PUT ME IN YOUR setup() FUNCTION!

//img4 = loadImage("/Users/jackmartin/Documents/SYDE/3A/SYDE 361 - Design/tonic/MFP1/ui_dashboard_1/X.png");

//*/
//  noFill();
//  noStroke();
//  pushMatrix();
//  translate(673.9661, 371.7987);
//  rotate(0.0);
//  rectMode(CORNERS);
//  rect(0, 0, 73.84155, 80.31888);
//  image(img4, 0, 0, 73.84155, 80.31888);
//  popMatrix();

//  fill(-4487428);
//  noStroke();
//  pushMatrix();
//  translate(644.1704, 513.0045);
//  rotate(-0.0039287806);
//  rectMode(CORNERS);
//  rect(-124.39173, -35.001583, 133.45813, 35.001583);
//  popMatrix();

//  fill(-3881788);
//  noStroke();
//  pushMatrix();
//  translate(159.66617, 674.93774);
//  rotate(3.8194656E-4);
//  rectMode(CORNERS);
//  rect(-106.236115, -78.41584, 1058.3988, 107.554886);
//  popMatrix();

//  fill(-4487428);
//  noStroke();
//  pushMatrix();
//  translate(80.64275, 84.205284);
//  rotate(8.2588196E-4);
//  rectMode(CORNERS);
//  rect(-62.195854, -62.195854, 221.76695, 62.195854);
//  popMatrix();

//  fill(-4487428);
//  noStroke();
//  pushMatrix();
//  translate(98.779274, 639.96014);
//  rotate(0.0);
//  rectMode(CORNERS);
//  rect(-25.153404, -22.363176, 17.283674, 16.841064);
//  popMatrix();

//  fill(-4487428);
//  noStroke();
//  pushMatrix();
//  translate(114.32487, 709.9153);
//  rotate(0.0);
//  rectMode(CORNERS);
//  rect(-45.801632, -40.180313, 6.477333, 2.8967547);
//  popMatrix();

//  fill(-4487428);
//  noStroke();
//  pushMatrix();
//  translate(92.30194, 744.8929);
//  rotate(0.0);
//  rectMode(CORNERS);
//  rect(-22.022919, -22.022919, 22.022919, 22.022919);
//  popMatrix();
