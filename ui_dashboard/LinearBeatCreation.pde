import java.awt.Font;
import java.awt.Rectangle;
import g4p_controls.*;

class LinearBeatCreation {
  int[] Beat;
  PImage img17;
  Boolean Pressed = false; 
  Boolean Clicked = false;
  Boolean inst1Selected = false;
  int inst1Fill;
  float inst1X = 127.28;
  float inst1Y = 638.66;
  Boolean inst3Selected = false;
  int inst3Fill;
  float inst3X = 539.23;
  float inst3Y = 638.66;
  Boolean inst2Selected = false;
  int inst2Fill;  
  float inst2X = 328; 
  float inst2Y = 638.66; 
  boolean renderLinear = true;
  color circleToggleFill = color(-16524602);
  color linearToggleFill = color(-16524602);
  Boolean algorithmButtonSelected = false;
  float algorithmButtonX = 970;
  float algorithmButtonY = 450;
  DrumBeats Beats;
  ArrayList<RectangularButton> inst1Buttons;
  ArrayList<RectangularButton> inst2Buttons;
  ArrayList<RectangularButton> inst3Buttons;
  
  RectangularButton inst1Button;
  RectangularButton inst2Button; 
  RectangularButton inst3Button; 

  String inst1 = "";
  String inst2 = "";
  String inst3 = "";
  ArrayList<String> instruments;

  PImage toggle = loadImage("LinearToggle.png");
  PImage kickImg = loadImage("Kick.png");
  PImage snareImg = loadImage("Snare.png");
  PImage hatImg = loadImage("HiHat.png");
  PImage musicImg = loadImage("MusicNote.png");

  GButton addAccent;
  boolean accentMode = false;
  
  GButton getHelpFromAlgorithm;
  
  // Vars for setting beat name
  String name;
  GTextArea area;

  Boolean showNameTooltip = true;
  Boolean showInstrumentTooltip = false;
  Boolean showBeatTooltip = false;
  PApplet pa;
    
  LinearBeatCreation(DrumBeats beats, PApplet papp) {
    //Setup the name input for the song
    pa = papp;
    area = new GTextArea(papp,15, 15, 350, 50, G4P.SCROLLBARS_NONE);
        //accent button    
    addAccent = new GButton(pa, 700, 700, 180, 50, "Add Accent");
    addAccent.addEventHandler(papp, "accentHandler");
    addAccent.setLocalColor(2, color(41,41,41)); //text color
    addAccent.setLocalColor(3, color(255)); //border colour
    addAccent.setLocalColor(4, color(255)); //background color
    addAccent.setFont(new Font("Gothic A1", Font.PLAIN, 25));
    addAccent.setVisible(false);
    name = "";
    area.setVisible(false);
     Beats = beats;
     inst1Buttons = new ArrayList<RectangularButton>();
     for (int k = 0; k < 17; k++) {
       inst1Buttons.add(new RectangularButton(-13421259, -2039584, 3.553719, -2039584, (178 + 70*k), 150, 1.5728104, -27.235615, -22.174805, 30.242954, 34.977585));
       //inst1Buttons.get(k).setSelected(Beats.getBeatValue(1,k));
     }
     inst2Buttons = new ArrayList<RectangularButton>();
     for (int m = 0; m < 17; m++) {
       inst2Buttons.add(new RectangularButton(-13421259, -2039584, 3.553719, -2039584, (178 + 70*m), 250, 1.5728104, -27.235615, -22.174805, 30.242954, 34.977585));
       //inst2Buttons.get(m).setSelected(Beats.getBeatValue(2,m));
     }
     inst3Buttons = new ArrayList<RectangularButton>();
     for (int n = 0; n < 17; n++) {
       inst3Buttons.add(new RectangularButton(-13421259, -2039584, 3.553719, -2039584, (178 + 70*n), 350, 1.5728104, -27.235615, -22.174805, 30.242954, 34.977585));
       //inst3Buttons.get(n).setSelected(Beats.getBeatValue(1,n));
     }
     instruments = new ArrayList<String>();
  }
  
  DrumBeats update() {
    //update the status of the buttons
    for (int i = 0; i < inst1Buttons.size() - 1; i++){
      if (Beats.getBeat(0,i) > 0) showBeatTooltip = false;
      inst1Buttons.get(i).setSelected(Beats.getBeat(0, i) > 0 ? true : false);
      if (Beats.getBeat(0,i) == 2)
        inst1Buttons.get(i).updateBorderColour(-4487428);
      else
        inst1Buttons.get(i).updateBorderColour(-2039584);
    }
    for (int j = 0; j < inst2Buttons.size() - 1; j++){
      if (Beats.getBeat(0,j) > 0) showBeatTooltip = false;
      inst2Buttons.get(j).setSelected(Beats.getBeat(1, j)  > 0 ? true : false);
      if (Beats.getBeat(1,j) == 2)
        inst2Buttons.get(j).updateBorderColour(-10241491);
      else
        inst2Buttons.get(j).updateBorderColour(-2039584);
    }
    for (int k = 0; k < inst3Buttons.size() - 1; k++){
      if (Beats.getBeat(0,k) > 0) showBeatTooltip = false;
      inst3Buttons.get(k).setSelected(Beats.getBeat(2, k)  > 0 ? true : false);
      if (Beats.getBeat(2,k) == 2)
        inst3Buttons.get(k).updateBorderColour(-1157409);
      else
        inst3Buttons.get(k).updateBorderColour(-2039584);
    }
    
    //hide text area when algorithm button is selected
    if (algorithmButtonSelected) {
      area.setVisible(false);
      area.setOpaque(false);
    }

    if (mousePressed == true && mouseButton == LEFT && Pressed == false) {
      Pressed = true;
      if (instruments.size() >= 1 && ((mouseX >= inst1X && mouseX <= inst1X + 100) || (mouseX >= inst1X - 100 && mouseX <= inst1X)) && ((mouseY >= inst1Y && mouseY <= inst1Y + 100) || (mouseY >= inst1Y - 100 && mouseY <= inst1Y))) {
        Clicked = true;
        inst1Selected = !inst1Selected; 
        if (showInstrumentTooltip) {
          showInstrumentTooltip = false;
          showBeatTooltip = true;
        }
      }else if (instruments.size() >=2 && ((mouseX >= inst2X && mouseX <= inst2X + 100) || (mouseX >= inst2X - 100 && mouseX <= inst2X)) && ((mouseY >= inst2Y && mouseY <= inst2Y + 100) || (mouseY >= inst2Y - 100 && mouseY <= inst2Y))) {
        Clicked = true;
        inst2Selected = !inst2Selected;
        if (showInstrumentTooltip) {
          showInstrumentTooltip = false;
          showBeatTooltip = true;
        }
      } else if (instruments.size() >= 3 && ((mouseX >= inst3X && mouseX <= inst3X + 100) || (mouseX >= inst3X - 100 && mouseX <= inst3X)) && ((mouseY >= inst3Y && mouseY <= inst3Y + 100) || (mouseY >= inst3Y - 100 && mouseY <= inst3Y))) {
        Clicked = true;
        inst3Selected = !inst3Selected; 
        if (showInstrumentTooltip) {
          showInstrumentTooltip = false;
          showBeatTooltip = true;
        }
      } else if (mouseX >= algorithmButtonX && mouseX <= algorithmButtonX + 200 && mouseY >= algorithmButtonY && mouseY <= algorithmButtonY + 200) {
        // TODO: Update - this is temp route into LikeOrDislikeBeatPage
        area.setVisible(false);
        area.setOpaque(false);
        Clicked = true; //<>// //<>//
        algorithmButtonSelected = true;
      }
      // layout toggle check
      else if (mouseX >= 1125 && mouseX <= 1200 && mouseY >= 25 && mouseY <= 76){
        area.setVisible(false);
        renderLinear = false;
      }
      //inst1 buttons check
      for(int i = 0; i < inst1Buttons.size() - 1; ++i) {
        inst1Buttons.get(i).pressed();
        if (inst1Buttons.get(i).isClicked()) {
          int value = inst1Buttons.get(i).getSelected() ? 1 : 0;
          if (inst1Buttons.get(i).isClicked() && accentMode){
            if (Beats.getBeat(0,i) == 2) {
              value = 1;
              inst1Buttons.get(i).updateBorderColour(-2039584);
            } else {
              value = 2;  
              inst1Buttons.get(i).updateBorderColour(-4487428);
            }
          } else if (value == 0 && !accentMode) {
            inst1Buttons.get(i).updateBorderColour(-2039584);
          }
          inst1Buttons.get(i).setClicked(false); 
          Beats.updateBeats(0, i, value);
        }
      }
      //inst2 buttons check 
      for(int j = 0; j < inst2Buttons.size() - 1; ++j) {
        inst2Buttons.get(j).pressed();
        if (inst2Buttons.get(j).isClicked()) {
          int value = inst2Buttons.get(j).getSelected() ? 1 : 0;
          if (inst2Buttons.get(j).isClicked() && accentMode){
              if (Beats.getBeat(1,j) == 2) {
                value = 1;
                inst2Buttons.get(j).updateBorderColour(-2039584);
              } else {
                value = 2;  
                inst2Buttons.get(j).updateBorderColour(-10241491);
              }
            } else if (value == 0 && !accentMode) {
              inst2Buttons.get(j).updateBorderColour(-2039584);
          }
          inst2Buttons.get(j).setClicked(false); 
          Beats.updateBeats(1, j, value);
        }
      }
      //inst3 buttons check
      for(int k = 0; k < inst3Buttons.size() - 1; ++k) {
        inst3Buttons.get(k).pressed();
        if (inst3Buttons.get(k).isClicked()) {
          int value = inst3Buttons.get(k).getSelected() ? 1 : 0;
          if (inst3Buttons.get(k).isClicked() && accentMode){
              if (Beats.getBeat(2,k) == 2) {
                value = 1;
                inst3Buttons.get(k).updateBorderColour(-2039584);
              } else {
                value = 2;
                inst3Buttons.get(k).updateBorderColour(-1157409);
              }
            } else if (value == 0 && !accentMode) {
              inst3Buttons.get(k).updateBorderColour(-2039584);
            }
            inst3Buttons.get(k).setClicked(false); 
          Beats.updateBeats(2, k, value);
        }
      }
    }
      else {
      Clicked = false;
    }
   
    if(mousePressed != true) {
      Pressed = false;
    }
    
    return Beats;
  }
  
  Boolean isInst1Selected() {
    return inst1Selected;
  }
  
  Boolean isInst3Selected() {
    return inst3Selected;
  }
  
  Boolean isInst2Selected() {
    return inst2Selected;
  }
  
  Boolean isAlgorithmButtonSelected() {
    return algorithmButtonSelected;
  }
  
  void setInst1Selected(boolean s) {
    inst1Selected = s;
  }
  
  void setInst3Selected(boolean s) {
    inst3Selected = s;
  }
  
  void setInst2Selected(boolean s) {
    inst2Selected = s;
  }
  
  void render(DrumBeats beats) {
   if (renderLinear && !algorithmButtonSelected){
    Beats = beats;
    setInstrumentNames(instruments);
    background(-14079703);
    strokeWeight(5);
    stroke(-1);
    line(1.6193323, 570, 1297.0852, 570);
    image(toggle, 1125, 25);

    // SHow accent mode status
    if (accentMode) {
      textSize(32);
      textAlign(CENTER);
      fill(-1);
      text("Accent Mode", 800, 50); 
      textSize(24);
      text("Click on beats to add and remove accents",800,70);
    }
  
    // Text Input for Name of Song
    area.setVisible(true);
    area.setOpaque(true);
    area.setLocalColor(2, color(252,252,252)); //text color
    area.setLocalColor(6, color(66,65,62)); //border colour
    area.setLocalColor(7, color(66,65,62)); //background color
    area.setFont(new Font("Gothic A1", Font.PLAIN, 30));

    addAccent.setVisible(true);
    
    //tempo slider
    textSize(24); 
    textFont(createFont("Gothic A1", 30));
    fill(-1);
    text("Tempo", 750, 620);

    if ((area.getText().trim()).equals("")){
      area.setText(name);
    }
    
    // Show tooltips
    if (showNameTooltip) {
      Tooltip beatTooltip = new Tooltip("Add a name for your beat","T",25,80,300,30);   
      beatTooltip.drawTooltip();
    } else if (showInstrumentTooltip) {
      Tooltip instrumentTooltip = new Tooltip("Click to add an instrument to your beat","T",25,710,300,30);
      instrumentTooltip.drawTooltip();
    } else if (showBeatTooltip) {
      int y = 200;
      if (inst2Selected){
        y = 300;
      }
      else if(inst3Selected) {
        y = 400;
      }
      Tooltip beatTooltip = new Tooltip("Click on a segment to add the instruments to the beat", "T", 25,y,300,30);
      beatTooltip.drawTooltip();
    }

    
      if (inst3Selected) {
            inst3Fill = -1157409;
          } else {
            inst3Fill = -1;
          }
          
          
          if (inst2Selected) {
            inst2Fill = -10241491;
          } else {
            inst2Fill = -1;
          }
          
          if (inst1Selected) {
            inst1Fill = -4487428;
          } else {
            inst1Fill = -1;
          }

          if (instruments.size() >= 1) {
            inst1Button = new RectangularButton(inst1Fill, 7.933884, -4487428, 85.824615, 642.5511, 1.5707964, -34.9776, -116.59913, 34.9776, 34.9776, inst1, 127.28, 638.66, 24);
            inst1Button.renderWithText();
          }
          if (instruments.size() >= 2) {
            inst2Button = new RectangularButton(inst2Fill, 7.933884, -10241491, 290.50824, 642.5511, 1.5700793, -34.9776, -116.59913, 34.9776, 34.9776, inst2, 328, 638.66, 24);
            inst2Button.renderWithText(); //<>//
          } //<>//
          if (instruments.size() == 3) {
            inst3Button = new RectangularButton(inst3Fill, 7.933884, -1157409, 500.3737, 642.5511, 1.5707964, -34.9776, -116.59913, 34.9776, 34.9776, inst3, 539.23, 638.66, 24);
          inst3Button.renderWithText();
          }
    }
    
  
    if (algorithmButtonSelected) {
      save.setVisible(false);
      cancel.setVisible(false); //<>//
    } //<>//
  }
 
  void renderInst1Selector() {
    noFill();
    pushMatrix();
    translate(30, 90);
    rotate(0.0);
    if (instruments.get(0).equals("Kick")) image(kickImg, 0, 0, 100, 80);
    else if (instruments.get(0).equals("Snare")) image(snareImg, 0, 0, 100, 80);
    else if (instruments.get(0).equals("Hi Hat")) image(hatImg, 0, 0, 100, 80);
    else image(musicImg, 0, 0, 100, 80);
    popMatrix();
    
    for (int i = 0; i < inst1Buttons.size() - 1; i++){
      inst1Buttons.get(i).renderWithoutText();
    }

  }
  
  void renderInst2Selector() {
    noFill(); //<>//
    pushMatrix(); //<>//
    translate(30, 225);
    rotate(0.0);
    if (instruments.get(1).equals("Kick")) image(kickImg, 0, 0, 100, 80);
    else if (instruments.get(1).equals("Snare")) image(snareImg, 0, 0, 100, 80); //<>//
    else if (instruments.get(1).equals("Hi Hat")) image(hatImg, 0, 0, 100, 80); //<>//
    else image(musicImg, 0, 0, 100, 80);
    popMatrix(); //<>//
 //<>//
    for (int i = 0; i < inst2Buttons.size() - 1; i++){
      inst2Buttons.get(i).renderWithoutText(); //<>//
    } //<>//
  }
   //<>//
  void renderInst3Selector() { //<>//
    noFill(); //<>//
    pushMatrix(); //<>//
    translate(20, 330);
    rotate(0.0); //<>//
    if (instruments.get(2).equals("Kick")) image(kickImg, 0, 0, 100, 80); //<>// //<>//
    else if (instruments.get(2).equals("Snare")) image(snareImg, 0, 0, 100, 80); //<>//
    else if (instruments.get(2).equals("Hi Hat")) image(hatImg, 0, 0, 100, 80);
    else image(musicImg, 0, 0, 100, 80);
    popMatrix();
 //<>//
    for (int i = 0; i < inst3Buttons.size() - 1; i++){ //<>//
      inst3Buttons.get(i).renderWithoutText();
    }
  }
  
  // Set the name of the beat //<>//
  void setName() { //<>//
    name = area.getText();
  }
  
  String getName(){
    if(name != ""){
      return name;
    }
    else{
      return "Beat 1";
    }
    
  }

  void updateName(String n) {
    name = n;
    showNameTooltip = false;
    showInstrumentTooltip = true;
  }
  
  void setRenderLinear(boolean b) {
    renderLinear = b; 
  }
  
  void setAlgorithmSelected(boolean s) {
    algorithmButtonSelected = s;
  }
  
  void hideTextArea() {
    area.setVisible(false);
    area.setOpaque(false);
    addAccent.setVisible(false);
  }
  
  boolean getRenderLinear() {return renderLinear;}
  DrumBeats getBeats() { return Beats;}
  
  void setInstrumentNames(ArrayList<String> instrumentNames) {
    instruments = instrumentNames;
    inst1Selected = false;
    inst2Selected = false;
    inst3Selected = false;

    beats.setInstruments(instrumentNames);
    for (int i =0; i< instrumentNames.size(); i++){
      if (i ==0) {
        inst1 = instrumentNames.get(i);
        inst1Selected = true;
      }else if (i ==1) {
        inst2 = instrumentNames.get(i);
        inst2Selected = true;
      } else if (i ==2) {
        inst3 = instrumentNames.get(i);
        inst3Selected = true;
      }
    }
  }
}

public void accentHandler(GButton button, GEvent event) {
  createLinearBeat.accentMode = !createLinearBeat.accentMode; 
  createCircularBeat.accentMode = !createCircularBeat.accentMode;
  if (createLinearBeat.accentMode) {
    button.setLocalColor(3, color(3, 218, 198));
    button.setLocalColor(4, color(3, 218, 198));
  } else {
    button.setLocalColor(3, color(255));
    button.setLocalColor(4, color(255));
  }
}
