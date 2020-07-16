import java.awt.Rectangle;
import g4p_controls.*;
  GButton playGA1;
  GButton playGA2;
  GButton preferThisBeatGA1;
  GButton preferThisBeatGA2;
  GButton useThisInSongGA1;
  GButton useThisInSongGA2;
  GButton closeButton;
  DrumBeats beats1;
  DrumBeats beats2;
  DrumBeats originalBeat;
  BeatPopulation population;
  
  ArrayList<RectangularButton> kickButtons;
  ArrayList<RectangularButton> snareButtons;
  ArrayList<RectangularButton> hatButtons;

class ThisOrThat {
  boolean[] whatHasChangedInBeat1; // kick - 0, snare - 1, hi-hat - 2
  boolean[] whatHasChangedInBeat2;
  Integer beatNumber;
  
  //Tracks which beat is selected by user
  String cardSelected = "left";
  boolean firstPairCreated = false;
  
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
  Float leftCardLeftBound = 98.0;
  Float leftCardRightBound = 571.0;
  Float leftCardTopBound = 76.0;
  Float leftCardBottomBound = 515.0;
  Float rightCardLeftBound = 725.0;
  Float rightCardRightBound = 1198.0;
  Float rightCardTopBound = 76.43;
  Float rightCardBottomBound = 521.0;

  PImage purplePlayButtonImage = loadImage("PlayButtonPurple.png");
  PImage tealPlayButtonImage = loadImage("PlayButtonTeal.png");
  PImage purpleMusicPlayingImage = loadImage("MusicPlayingPurple.png");
  PImage tealMusicPlayingImage = loadImage("MusicPlayingTeal.png");
  PImage preferPurpleButtonImage = loadImage("IPreferThisButtonPurple.png");
  PImage preferTealButtonImage = loadImage("IPreferThisButtonTeal.png");
  PImage useThisInSongButtonImage = loadImage("UseThisInSongButton.png");
  PImage img0 = loadImage("HiHat.png");
  PImage img1 = loadImage("Kick.png");
  PImage img2 = loadImage("Snare.png");
  
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
       kickButtons.add(new RectangularButton(-13421259, -2039584, 3.553719, -2039584, (178 + 70*k), 610, 1.5728104, -27.235615, -22.174805, 30.242954, 34.977585));
     }
     snareButtons = new ArrayList<RectangularButton>();
     for (int m = 0; m < 17; m++) {
       snareButtons.add(new RectangularButton(-13421259, -2039584, 3.553719, -2039584, (178 + 70*m), 680, 1.5728104, -27.235615, -22.174805, 30.242954, 34.977585));
     }
     hatButtons = new ArrayList<RectangularButton>();
     for (int n = 0; n < 17; n++) {
       hatButtons.add(new RectangularButton(-13421259, -2039584, 3.553719, -2039584, (178 + 70*n), 750, 1.5728104, -27.235615, -22.174805, 30.242954, 34.977585));
     }
    
   playGA1 = new GButton(pa, 302, 150, 80, 30, "PLAY");
   playGA1.addEventHandler(pa, "playGA1Handler");
   playGA1.setLocalColor(2, color(41,41,41)); //text color
   playGA1.setLocalColor(3, color(3, 218, 198)); //border colour
   playGA1.setLocalColor(4, color(3, 218, 198)); //background color
   playGA1.setVisible(false);
   
   playGA2 = new GButton(pa, 942, 150, 80, 30, "PLAY");
   playGA2.addEventHandler(pa, "playGA2Handler");
   playGA2.setLocalColor(2, color(41,41,41)); //text color
   playGA2.setLocalColor(3, color(187, 134, 252)); //border colour
   playGA2.setLocalColor(4, color(187, 134, 252)); //background color
   playGA2.setVisible(false);
   
   preferThisBeatGA1 = new GButton(pa, 250, 310, 200, 60, "Generate Again");
   preferThisBeatGA1.addEventHandler(pa, "preferThisBeatHandler1");
   preferThisBeatGA1.setLocalColor(2, color(41,41,41)); //text color
   preferThisBeatGA1.setLocalColor(3, color(3, 218, 198)); //border colour
   preferThisBeatGA1.setLocalColor(4, color(3, 218, 198)); //background color
   preferThisBeatGA1.setFont(new Font("Gothic A1", Font.PLAIN, 18));
   preferThisBeatGA1.setVisible(false);
   
   preferThisBeatGA2 = new GButton(pa, 870, 310, 200, 60, "Generate Again");
   preferThisBeatGA2.addEventHandler(pa, "preferThisBeatHandler2");
   preferThisBeatGA2.setLocalColor(2, color(41,41,41)); //text color
   preferThisBeatGA2.setLocalColor(3, color(66,65,62)); //border colour
   preferThisBeatGA2.setLocalColor(4, color(187, 134, 252)); //background color
   preferThisBeatGA2.setFont(new Font("Gothic A1", Font.PLAIN, 18));
   preferThisBeatGA2.setVisible(false);
   
   useThisInSongGA1 = new GButton(pa, 230, 420, 250, 60, "Use as my Beat");
   useThisInSongGA1.addEventHandler(pa, "useThisInSongBeatHandler1");
   useThisInSongGA1.setLocalColor(2, color(41,41,41)); //text color
   useThisInSongGA1.setLocalColor(3, color(66,65,62)); //border colour
   useThisInSongGA1.setLocalColor(4, color(3, 218, 198)); //background color
   useThisInSongGA1.setFont(new Font("Gothic A1", Font.PLAIN, 18));
   useThisInSongGA1.setVisible(false);
   
   useThisInSongGA2 = new GButton(pa, 850, 420, 250, 60, "Use this in my Beat");
   useThisInSongGA2.addEventHandler(pa, "useThisInSongBeatHandler2");
   useThisInSongGA2.setLocalColor(2, color(41,41,41)); //text color
   useThisInSongGA2.setLocalColor(3, color(66,65,62)); //border colour
   useThisInSongGA2.setLocalColor(4, color(187, 134, 252)); //background color
   useThisInSongGA2.setFont(new Font("Gothic A1", Font.PLAIN, 18));
   useThisInSongGA2.setVisible(false);
   
   closeButton = new GButton(pa, 10, 10, 60, 60, "X");
   closeButton.addEventHandler(pa, "closeButtonPressedHandler");
   closeButton.setLocalColor(2, color(255,255,255)); //text color
   closeButton.setLocalColor(3, color(66,65,62)); //border colour
   closeButton.setLocalColor(4, color(66,65,62)); //background color
   closeButton.setFont(new Font("Gothic A1", Font.PLAIN, 25));
   closeButton.setVisible(false);
   
  }

  void update() {
      // Run the GA upon initialization without user input to get the first pair of beats.
      if (!firstPairCreated) {
        population.run(null, null, originalBeat.beats, target_beats, 100);
        beats1.beats = population.getBestBeat();
        beats2.beats = population.getSecondBestBeat();
        firstPairCreated = true;
        
       //set the beat display
       for (int k = 0; k < 16; k++) {
         if (beats1.getBeat(0,k) > 0) {
         kickButtons.get(k).setSelected(true);
         }
       }
     
       for (int m = 0; m < 16; m++) {
         if (beats1.getBeat(1,m) > 0) {
           snareButtons.get(m).setSelected(true);
         }
       }
     
       for (int n = 0; n < 16; n++) {
         if (beats1.getBeat(2,n) > 0) {
           hatButtons.get(n).setSelected(true);
         }
        }
       }
      
      if (mousePressed == true && mouseButton == LEFT){
        
        // See if user has clicked within the card region 
        if ((mouseX >= leftCardLeftBound && mouseX <= leftCardRightBound) && (mouseY >= leftCardTopBound && mouseY <= leftCardBottomBound)) {
          cardSelected = "left";
          
          //change the display
           for (int k = 0; k < 16; k++) {
             if (beats1.getBeat(0,k) > 0) {
             kickButtons.get(k).setSelected(true);
             }
           }
         
           for (int m = 0; m < 16; m++) {
             if (beats1.getBeat(1,m) > 0) {
               snareButtons.get(m).setSelected(true);
             }
           }
         
           for (int n = 0; n < 16; n++) {
             if (beats1.getBeat(2,n) > 0) {
               hatButtons.get(n).setSelected(true);
             }
            }
        }
        else if ((mouseX >= rightCardLeftBound && mouseX <= rightCardRightBound) && (mouseY >= rightCardTopBound && mouseY <= rightCardBottomBound)) {
          cardSelected = "right";
          
          //change the display
           for (int k = 0; k < 16; k++) {
             if (beats2.getBeat(0,k) > 0) {
             kickButtons.get(k).setSelected(true);
             }
           }
         
           for (int m = 0; m < 16; m++) {
             if (beats2.getBeat(1,m) > 0) {
               snareButtons.get(m).setSelected(true);
             }
           }
         
           for (int n = 0; n < 16; n++) {
             if (beats2.getBeat(2,n) > 0) {
               hatButtons.get(n).setSelected(true);
             }
            }
        }
        
       // See if a beat has been clicked on a beat
       if (cardSelected == "left") {
        //kick buttons check
        for(int i = 0; i < kickButtons.size() - 1; ++i) {
          kickButtons.get(i).pressed();
          beats1.updateBeats(0, i, int(kickButtons.get(i).getSelected() ? true : false));
        }
        //snare buttons check 
        for(int j = 0; j < snareButtons.size() - 1; ++j) {
          snareButtons.get(j).pressed();
          beats1.updateBeats(1, j, int(snareButtons.get(j).getSelected() ? true : false));
        }
        //hat buttons check
        for(int k = 0; k < hatButtons.size() - 1; ++k) {
          hatButtons.get(k).pressed();
          beats1.updateBeats(2, k, int(hatButtons.get(k).getSelected() ? true : false));
        }
      }
      else if (cardSelected == "right") {
        //kick buttons check
        for(int i = 0; i < kickButtons.size() - 1; ++i) {
          kickButtons.get(i).pressed();
          beats2.updateBeats(0, i, int(kickButtons.get(i).getSelected() ? true : false));
        }
        //snare buttons check 
        for(int j = 0; j < snareButtons.size() - 1; ++j) {
          snareButtons.get(j).pressed();
          beats2.updateBeats(1, j, int(snareButtons.get(j).getSelected() ? true : false));
        }
        //hat buttons check
        for(int k = 0; k < hatButtons.size() - 1; ++k) {
          hatButtons.get(k).pressed();
          beats2.updateBeats(2, k, int(hatButtons.get(k).getSelected() ? true : false));
        }
      }
  }
    
    renderBeatSelector();
  }
  
  void render() {
    playGA1.setVisible(true); 
    playGA2.setVisible(true);
    preferThisBeatGA1.setVisible(true);
    preferThisBeatGA2.setVisible(true);
    useThisInSongGA1.setVisible(true);
    useThisInSongGA2.setVisible(true);
    closeButton.setVisible(true);
    
    // Background 
    size(1300, 800);
    background(41, 41, 41);
    
    //Beat Selector
    renderBeatSelector();
    
    //pancake stacked cards
    fill(-13421259);
    strokeWeight(5.0);
    stroke(-2039584);
    pushMatrix();
    translate(933.0593, 111.410065);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-145.79027, -84.24513, 329.0509, 360.1768);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(5.0);
    stroke(-2039584);
    pushMatrix();
    translate(901.96814, 134.72845);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-145.79027, -84.24513, 329.0509, 360.1768);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(5.0);
    stroke(-4487428);
    pushMatrix();
    translate(872.1724, 158.04684);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-145.79027, -84.24513, 329.0509, 360.1768);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(5.0);
    stroke(-2039584);
    pushMatrix();
    translate(316.41754, 111.410065);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-145.79027, -84.24513, 329.0509, 360.1768);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(5.0);
    stroke(-2039584);
    pushMatrix();
    translate(285.32635, 134.72845);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-145.79027, -84.24513, 329.0509, 360.1768);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(5.0);
    stroke(-16524602);
    pushMatrix();
    translate(245.16692, 156.75137);
    rotate(-0.0012458563);
    rectMode(CORNERS);
    rect(-145.79027, -84.24513, 329.0509, 360.1768);
    popMatrix();
  
    //grey circle
    fill(-4342339);
    strokeWeight(5.0);
    stroke(-4342339);
    pushMatrix();
    translate(338.44046, 165.81964);
    rotate(0.0023088455);
    ellipse(0,0,148.67973, 148.67973);
    popMatrix();
  
    //grey circle
    fill(-4342339);
    strokeWeight(5.0);
    stroke(-4342339);
    pushMatrix();
    translate(974.5142, 165.81964);
    rotate(0.0);
    ellipse(0,0,148.67973, 148.67973);
    popMatrix();
    
    //Play Buttons
    noFill();
    pushMatrix();
    translate(940, 120);
    rotate(0.0);
    image(purplePlayButtonImage, 0, 0, 90, 90);
    popMatrix();
    
    noFill();
    pushMatrix();
    translate(300, 120);
    rotate(0.0);
    image(tealPlayButtonImage, 0, 0, 90, 90);
    popMatrix();
  
   //colour changing bar  //<>//
    strokeWeight(15.0);
    if (cardSelected == "right") {
      stroke(-4487428);
    }
    else if (cardSelected == "left") {
      stroke(-16524602);
    }
    line(1.6193323, 563.52765, 1302.2676, 558.3458);

    // Left buttons context sentances
    String generateAgainLabel1 = "I like where this is going... \n";
    fill(-4342339);
    textSize(20);
    text(generateAgainLabel1, 240, 300);  // Text wraps within text box
    
    String useThisLabel1 = "I like this! \n";
    fill(-4342339);
    textSize(20);
    text(useThisLabel1, 170, 420);  // Text wraps within text box
    
    // Right buttons context sentances
    String generateAgainLabel2 = "I like where this is going... \n";
    fill(-4342339);
    textSize(20);
    text(generateAgainLabel2, 860, 300);  // Text wraps within text box
    
    String useThisLabel2 = "I like this! \n";
    fill(-4342339);
    textSize(20);
    text(useThisLabel2, 790, 420);  // Text wraps within text box
  } 
  
  void renderBeatSelector() {
    
    //Kick selector
    noFill();
    pushMatrix();
    translate(40, 580);
    rotate(0.0);
    image(img1, 0, 0, 60, 75);
    popMatrix();
    
    for (int i = 0; i < kickButtons.size() - 1; i++){
      kickButtons.get(i).renderWithoutText();
    }
    
    //Snare buttons
    noFill();
    pushMatrix();
    translate(40, 660);
    rotate(0.0);
    image(img2, 0, 0, 50, 60);
    popMatrix();

    for (int i = 0; i < snareButtons.size() - 1; i++){
      snareButtons.get(i).renderWithoutText();
    }
    
    //Hat buttons
    noFill();
    pushMatrix();
    translate(30, 720);
    rotate(0.0);
    image(img0, 0, 0, 75, 65);
    popMatrix();

    for (int i = 0; i < hatButtons.size() - 1; i++){
      hatButtons.get(i).renderWithoutText();
    }
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
 }

  public void preferThisBeatHandler1(GButton button, GEvent event) {  
   // user prefers left beat (teal)
   population.run(beats1.beats, beats2.beats, originalBeat.beats, target_beats, 100);
   beats1.beats = gaBeatPopulation1.getBestBeat();
   beats2.beats = gaBeatPopulation1.getSecondBestBeat();
   
   //render loading bar
   showLoadingBar();
   
   //set the beat display
       for (int k = 0; k < 16; k++) {
         if (beats1.getBeat(0,k) > 0) {
         kickButtons.get(k).setSelected(true);
         }
       }
     
       for (int m = 0; m < 16; m++) {
         if (beats1.getBeat(1,m) > 0) {
           snareButtons.get(m).setSelected(true);
         }
       }
     
       for (int n = 0; n < 16; n++) {
         if (beats1.getBeat(2,n) > 0) {
           hatButtons.get(n).setSelected(true);
         }
        }
  }

  public void preferThisBeatHandler2(GButton button, GEvent event) {  
     // user prefers left beat (purple)
     population.run(beats2.beats, beats1.beats, originalBeat.beats, target_beats, 100);
     beats1.beats = gaBeatPopulation1.getBestBeat();
     beats2.beats = gaBeatPopulation1.getSecondBestBeat();
     
     //render loading bar
     showLoadingBar();
     
     //set the beat display
       for (int k = 0; k < 16; k++) {
         if (beats2.getBeat(0,k) > 0) {
         kickButtons.get(k).setSelected(true);
         }
       }
     
       for (int m = 0; m < 16; m++) {
         if (beats2.getBeat(1,m) > 0) {
           snareButtons.get(m).setSelected(true);
         }
       }
     
       for (int n = 0; n < 16; n++) {
         if (beats2.getBeat(2,n) > 0) {
           hatButtons.get(n).setSelected(true);
         }
        }
  }
  
  public void useThisInSongBeatHandler1(GButton button, GEvent event) {  
    // user wants to use left beat (teal)
    playGA1.setVisible(false); 
    playGA2.setVisible(false);
    preferThisBeatGA1.setVisible(false);
    preferThisBeatGA2.setVisible(false);
    useThisInSongGA1.setVisible(false);
    useThisInSongGA2.setVisible(false);
    closeButton.setVisible(false);
    useBeatInSong(beats1);
    xButtonOnThisThatPressed();
  }
  
  public void useThisInSongBeatHandler2(GButton button, GEvent event) {  
    // user wants to use right beat (purple)
    playGA1.setVisible(false); 
    playGA2.setVisible(false);
    preferThisBeatGA1.setVisible(false);
    preferThisBeatGA2.setVisible(false);
    useThisInSongGA1.setVisible(false);
    useThisInSongGA2.setVisible(false);
    closeButton.setVisible(false);
    useBeatInSong(beats2);
    xButtonOnThisThatPressed();
  }
  
  public void closeButtonPressedHandler(GButton button, GEvent event) {  
    // user wants to close what they were doing - stop generating 
    xButtonOnThisThatPressed();
    playGA1.setVisible(false); 
    playGA2.setVisible(false);
    preferThisBeatGA1.setVisible(false);
    preferThisBeatGA2.setVisible(false);
    useThisInSongGA1.setVisible(false);
    useThisInSongGA2.setVisible(false);
    closeButton.setVisible(false);
  }
