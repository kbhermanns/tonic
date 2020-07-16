class AddInstrument {
    PApplet papp;
    GButton kick;
    GButton snare;
    GButton hat;
    GButton add;
    ArrayList<String> instruments;
    Boolean firstRender = true;
    
    GButton go;

    // String[] includedInstruments = {"Kick", "Snare", "Hat"};

    AddInstrument(PApplet pa, ArrayList<String> inst) {
        papp =pa;
        kick = new GButton(papp, 550, 200, 200, 50, "Kick");
        kick.addEventHandler(papp, "kickHandler");
        kick.setVisible(false);
        kick.setLocalColor(3, color(255)); //border colour
        kick.setLocalColor(4, color(255)); //background colour
        
        snare = new GButton(papp, 550, 275, 200, 50, "Snare");
        snare.addEventHandler(papp, "snareHandler");
        snare.setVisible(false);
        snare.setLocalColor(3, color(255)); //border colour
        snare.setLocalColor(4, color(255)); //background colour
        
        hat = new GButton(papp, 550,350, 200, 50, "HiHat");
        hat.addEventHandler(papp, "hatHandler");
        hat.setVisible(false);
        hat.setLocalColor(3, color(255)); //border colour
        hat.setLocalColor(4, color(255)); //background colour
        add = new GButton(papp, 550, 425, 200, 50, "Add my own via MIDI");
        add.setVisible(false);
        kick.setFont(new Font("Gothic A1", Font.PLAIN, 30));
        snare.setFont(new Font("Gothic A1", Font.PLAIN, 30));
        hat.setFont(new Font("Gothic A1", Font.PLAIN, 30));
        
        //go button setup
        go = new GButton(papp, 600, 600, 100,50,"Go >");
        go.setVisible(false);
        go.setFont(new Font("Gothic A1", Font.PLAIN, 30));
        go.addEventHandler(papp, "goInstrHandler");
        go.setLocalColor(2, color(41,41,41)); //text color
        go.setLocalColor(3, color(3,218,198)); //border colour
        go.setLocalColor(4, color(3,218,198)); //background colour

        instruments = inst;
    }

    void render(boolean kickSelected, boolean snareSelected, boolean hatSelected) {
        background(-14079703);
        textSize(32);
        //textAlign(CENTER);
        fill(-1);
        text("Select one of the predefined instruments or add your own", 650, 100); 
        textSize(24);
        text("To preview a sound, click on the icon beside the instrument",650,140);

        //display buttons
        go.setVisible(true);
        kick.setVisible(true);
        hat.setVisible(true);
        snare.setVisible(true);
        add.setVisible(true);
        if (firstRender){
            if (instruments.contains("Kick")){
                kickSelected = true;
            }
            if (instruments.contains("Snare")){
                snareSelected = true;
            }
            if (instruments.contains("Hi Hat")){
                hatSelected = true;
            }
            firstRender = false;
        }
        
        
        if (kickSelected) {
            kick.setLocalColor(3, color(-4487428)); //border colour
            kick.setLocalColor(4, color(-4487428)); //background colour
        } else {
            kick.setLocalColor(3, color(255)); //border colour
            kick.setLocalColor(4, color(255)); //background colour
        }
        if (snareSelected) {
            snare.setLocalColor(3, color(-10241491)); //border colour
            snare.setLocalColor(4, color(-10241491)); //background colour
        }else {
            snare.setLocalColor(3, color(255)); //border colour
            snare.setLocalColor(4, color(255)); //background colour
        }
        if (hatSelected) {
            hat.setLocalColor(3, color(-1157409)); //border colour
            hat.setLocalColor(4, color(-1157409)); //background colour
        } else {
            hat.setLocalColor(3, color(255)); //border colour
            hat.setLocalColor(4, color(255)); //background colour
        }
    }

    void clearButtons() {
        kick.setVisible(false);
        hat.setVisible(false);
        snare.setVisible(false);
        go.setVisible(false);
        add.setVisible(false);

    }
}

public void kickHandler(GButton button, GEvent event) {
  kickSelected = !kickSelected;
  if (!instruments.contains("Kick") && instruments.size() <3) instruments.add("Kick");
  else if (instruments.contains("Kick")) {
      int index = instruments.indexOf("Kick");
      instruments.remove(index);
  }
}
public void snareHandler(GButton button, GEvent event) {
  snareSelected = !snareSelected;  
  if (!instruments.contains("Snare") && instruments.size() <3) instruments.add("Snare");
    else if (instruments.contains("Snare")) {
      int index = instruments.indexOf("Snare");
      instruments.remove(index);
  }
}
public void hatHandler(GButton button, GEvent event) {
  hatSelected = !hatSelected;  
  if (!instruments.contains("Hi Hat") && instruments.size() <3) instruments.add("Hi Hat");
    else if (instruments.contains("Hi Hat")) {
      int index = instruments.indexOf("Hi Hat");
      instruments.remove(index);
  }
}
public void goInstrHandler(GButton button, GEvent event) {
  add.clearButtons();
  add.firstRender = true;
  renderAddInstrument = false;
  String instr1 = "";
  String instr2 = "";
  String instr3 = "";
  
  if (kickSelected) {
    instr1 = "Kick";
  }
  if (snareSelected) {
    instr1 = "Snare";
  }
  if (hatSelected) {
      instr3 = "Hi Hat";
  }
  addInstrument1.setVisible(false);
  instruments = add.instruments;
  numInst++;
  createLinearBeat.setInstrumentNames(instruments);
  createCircularBeat.setInstrumentNames(instruments);
  println("Inst size" + instruments.size());
}
