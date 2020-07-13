import java.awt.Font;
class LinearBeatCreation {
  boolean[] Beat;
  PImage img17;
  boolean Pressed = false; 
  boolean Clicked = false;
  boolean kickSelected = false;
  int kickFill;
  float kickX = 127.28;
  float kickY = 638.66;
  boolean hatSelected = false;
  int hatFill;
  float hatX = 539.23;
  float hatY = 638.66;
  boolean snareSelected = false;
  int snareFill;  
  float snareX = 328; 
  float snareY = 638.66; 
  float algorithmButtonX = 1078.1515;
  float algorithmButtonY = 497.4589;
  boolean linearLayoutToggle = true;
  boolean circularLayoutToggle = false;
  boolean algorithmButtonSelected = false;
  color circleToggleFill = color(-16524602);
  color linearToggleFill = color(-16524602);
  
  DrumBeats Beats;
  ArrayList<RectangularButton> kickButtons;
  ArrayList<RectangularButton> snareButtons;
  ArrayList<RectangularButton> hatButtons;
  
  RectangularButton algorithmButton;
  RectangularButton kickButton;
  RectangularButton snareButton; 
  RectangularButton hatButton; 
   
  PImage img0 = loadImage("HiHat.png");
  PImage img1 = loadImage("Kick.png");
  PImage img2 = loadImage("Snare.png");
  
  // Vars for setting beat name
  String name;
  GTextArea area;

  boolean showNameTooltip = true;
  boolean showInstrumentTooltip = false;
  boolean showBeatTooltip = false;
    
  
  LinearBeatCreation(DrumBeats beats, PApplet papp) {
    //Setup the name input for the song
    area = new GTextArea(papp,15, 15, 350, 50, G4P.SCROLLBARS_NONE);
    name = "";
    area.setVisible(false);
    
     Beats = beats;
     kickButtons = new ArrayList<RectangularButton>();
     for (int k = 0; k < 17; k++) {
       kickButtons.add(new RectangularButton(-13421259, -2039584, 3.553719, -2039584, (178 + 70*k), 150, 1.5728104, -27.235615, -22.174805, 30.242954, 34.977585));
       //kickButtons.get(k).setSelected(Beats.getBeatValue(1,k));
     }
     snareButtons = new ArrayList<RectangularButton>();
     for (int m = 0; m < 17; m++) {
       snareButtons.add(new RectangularButton(-13421259, -2039584, 3.553719, -2039584, (178 + 70*m), 250, 1.5728104, -27.235615, -22.174805, 30.242954, 34.977585));
       //snareButtons.get(m).setSelected(Beats.getBeatValue(2,m));
     }
     hatButtons = new ArrayList<RectangularButton>();
     for (int n = 0; n < 17; n++) {
       hatButtons.add(new RectangularButton(-13421259, -2039584, 3.553719, -2039584, (178 + 70*n), 350, 1.5728104, -27.235615, -22.174805, 30.242954, 34.977585));
       //hatButtons.get(n).setSelected(Beats.getBeatValue(1,n));
     }
  }
  
  void update() {
    if (mousePressed == true && mouseButton == LEFT && Pressed == false) {
      Pressed = true;
      if (((mouseX >= kickX && mouseX <= kickX + 100) || (mouseX >= kickX - 100 && mouseX <= kickX)) && ((mouseY >= kickY && mouseY <= kickY + 100) || (mouseY >= kickY - 100 && mouseY <= kickY))) {
        Clicked = true;
        kickSelected = !kickSelected; 
        if (showInstrumentTooltip) {
          showInstrumentTooltip = false;
          showBeatTooltip = true;
        }
      } else if (((mouseX >= hatX && mouseX <= hatX + 100) || (mouseX >= hatX - 100 && mouseX <= hatX)) && ((mouseY >= hatY && mouseY <= hatY + 100) || (mouseY >= hatY - 100 && mouseY <= hatY))) {
        Clicked = true;
        hatSelected = !hatSelected; 
        if (showInstrumentTooltip) {
          showInstrumentTooltip = false;
          showBeatTooltip = true;
        }
      } else if (((mouseX >= snareX && mouseX <= snareX + 100) || (mouseX >= snareX - 100 && mouseX <= snareX)) && ((mouseY >= snareY && mouseY <= snareY + 100) || (mouseY >= snareY - 100 && mouseY <= snareY))) {
        Clicked = true;
        snareSelected = !snareSelected;
        if (showInstrumentTooltip) {
          showInstrumentTooltip = false;
          showBeatTooltip = true;
        }
     } else if (mouseX >= algorithmButtonX && mouseX <= algorithmButtonX + 100 && mouseY >= algorithmButtonY && mouseY <= algorithmButtonY + 100) {
        // TODO: Update - this is temp route into LikeOrDislikeBeatPage
        area.setVisible(false);
        area.setOpaque(false);
        Clicked = true;
        circularLayoutToggle = false;
        linearLayoutToggle = false; 
        algorithmButtonSelected = true;
      } else if (mouseX >= 1075 && mouseX <= 1135 && mouseY >= 25 && mouseY <= 70){
        // layout toggle check
        circularLayoutToggle = true;
        linearLayoutToggle = false; 
      }
      //kick buttons check
      for(int i = 0; i < kickButtons.size() - 1; ++i) {
        kickButtons.get(i).pressed();
        if (Beats.getBeat(0,i)) showBeatTooltip = false;
        Beats.updateBeats(0, i, kickButtons.get(i).getSelected());
      }
      //snare buttons check 
      for(int j = 0; j < snareButtons.size() - 1; ++j) {
        snareButtons.get(j).pressed();
        if (Beats.getBeat(1,j)) showBeatTooltip = false;
        Beats.updateBeats(1, j, snareButtons.get(j).getSelected());
      }
      //hat buttons check
      for(int k = 0; k < hatButtons.size() - 1; ++k) {
        hatButtons.get(k).pressed();
        if (Beats.getBeat(2,k)) showBeatTooltip = false;
        Beats.updateBeats(2, k, hatButtons.get(k).getSelected());
      }
    }
      else {
      Clicked = false;
    }
   
    if(mousePressed != true) {
      Pressed = false;
    }
  }
  
  boolean isKickSelected() {
    return kickSelected;
  }
  
  boolean isHatSelected() {
    return hatSelected;
  }
  
  boolean isSnareSelected() {
    return snareSelected;
  }
  
  boolean isCircularLayoutSelected() {
    return circularLayoutToggle;
  }
  
  boolean isAlgorithmButtonSelected() {
    return algorithmButtonSelected;
  }
  
  void setKickSelected(boolean s) {
    kickSelected = s;
  }
  
  void setHatSelected(boolean s) {
    hatSelected = s;
  }
  
  void setSnareSelected(boolean s) {
    snareSelected = s;
  }
  
  void render() {
    if (linearLayoutToggle){
    background(-14079703);
    strokeWeight(5);
    stroke(-1);
    line(1.6193323, 570, 1297.0852, 570);
    
   algorithmButton = new RectangularButton(-16524602, 7.933884, -16524602, 1078.1515, 497.4589, 1.5648444, -34.9776, -189.1425, 24.9776, 100.195866, "Get Help From Algorithm", 1123.74, 490.98, 24);

    // Text Input for Name of Song
    area.setVisible(true);
    area.setOpaque(true);
    area.setLocalColor(2, color(252,252,252)); //text color
    area.setLocalColor(6, color(66,65,62)); //border colour
    area.setLocalColor(7, color(66,65,62)); //background color
    area.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    // Show tooltips
    if (showNameTooltip) {
      Tooltip beatTooltip = new Tooltip("Add a name for your beat","T",25,80,300,30);   
     beatTooltip.drawTooltip();
    } else if (showInstrumentTooltip) {
      Tooltip instrumentTooltip = new Tooltip("Select an instrument to add to your beat","T",25,710,300,30);
      instrumentTooltip.drawTooltip();
    } else if (showBeatTooltip) {
      int y = 200;
      if (snareSelected){
        y = 300;
      }
      else if(hatSelected) {
        y = 400;
      }
      Tooltip beatTooltip = new Tooltip("Click on a segment to add the instruments to the beat", "B", 25,y,300,30);
      beatTooltip.drawTooltip();
    }
    
    if (hatSelected) {
      hatFill = -1157409;
    } else {
      hatFill = -1;
    }
    hatButton = new RectangularButton(hatFill, 7.933884, -1157409, 500.3737, 646.4375, 1.5707964, -34.9776, -110.122215, 34.9776, 34.9776, "Hat", 539.23, 638.66, 24);
    
    if (snareSelected) {
      snareFill = -10241491;
    } else {
      snareFill = -1;
    }
    snareButton = new RectangularButton(snareFill, 7.933884, -10241491, 290.50824, 642.5511, 1.5700793, -34.9776, -114.26565, 34.9776, 34.9776, "Snare", 328, 638.66, 24);
    
    if (kickSelected) {
      kickFill = -4487428;
    } else {
      kickFill = -1;
    }
    kickButton = new RectangularButton(kickFill, 7.933884, -4487428, 85.824615, 642.5511, 1.5707964, -34.9776, -116.59913, 34.9776, 34.9776, "Kick", 127.28, 638.66, 24);
    
    kickButton.renderWithText();
    snareButton.renderWithText();
    hatButton.renderWithText();
    algorithmButton.renderWithText();
  }
  }
  
  void renderKickSelector() {
    
    noFill();
    pushMatrix();
    translate(30, 90);
    rotate(0.0);
    image(img1, 0, 0, 80, 95);
    popMatrix();
    
    for (int i = 0; i < kickButtons.size() - 1; i++){
      kickButtons.get(i).renderWithoutText();
    }

  }
  
  void renderSnareSelector() {
    
    noFill();
    pushMatrix();
    translate(30, 225);
    rotate(0.0);
    image(img2, 0, 0, 80, 70);
    popMatrix();

    for (int j = 0; j < snareButtons.size() - 1; j++){
      snareButtons.get(j).renderWithoutText();
    }
  }
  
  void renderHatSelector() {
    noFill();
    pushMatrix();
    translate(20, 330);
    rotate(0.0);
    image(img0, 0, 0, 100, 80);
    popMatrix();

    for (int k = 0; k < hatButtons.size() - 1; k++){
      hatButtons.get(k).renderWithoutText();
    }
  }
  
 void updateName(String n) {
    name = n;
    showNameTooltip = false;
    showInstrumentTooltip = true;
  }
  
  DrumBeats getBeats() { return Beats;}
}
