class CircularBeatCreation {
  int[] Beat;
  PImage img17;
  PImage toggle = loadImage("CircularToggle.png");
  Boolean Pressed = false; 
  Boolean Clicked = false;
  boolean accentMode = false;
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
  Boolean algorithmButtonSelected = false;
  float algorithmButtonX = 970;
  float algorithmButtonY = 450;
  boolean renderCircular = false;
  
  DrumBeats Beats;
  int[] inst1Filled;
  int[] inst2Filled;
  int[] inst3Filled;
  
  RectangularButton algorithmButton;
  RectangularButton inst1Button;
  RectangularButton inst2Button; 
  RectangularButton inst3Button; 
  
  String name;
  GTextArea area;

  String inst1 = "Kick";
  String inst2 = "Snare";
  String inst3 = "HiHat";
  ArrayList<String> instruments;

  Boolean showNameTooltip = true;
  Boolean showInstrumentTooltip = false;
  Boolean showBeatTooltip = false;
  
  boolean beginnerSelected;
  
  CircularBeatCreation(DrumBeats beats, PApplet papp) {
    //Setup the name input for the song
    area = new GTextArea(papp,15, 15, 350, 50, G4P.SCROLLBARS_NONE);
    beginnerSelected = true;
    name = "";
    area.setVisible(false);
   inst1Filled = new int[16];
   inst2Filled = new int[16];
   inst3Filled = new int[16];
   Beats = beats;
   for (int i = 0; i < 16; i++) {
     inst1Filled[i] = 0;
   }
   for (int j = 0; j < 16; j++) {
    inst2Filled[j] = 0;
   }
   for (int k = 0; k < 16; k++) {
    inst3Filled[k] = 0;
   }
   instruments = new ArrayList<String>();
  }
  
  DrumBeats update() {
    //println("ABBY - CIRCLE on this screen - x " + mouseX);
    //println("ABBY - CIRCLE on this screen - y " + mouseY);
    if (mousePressed == true && mouseButton == LEFT && Pressed == false) {
      Pressed = true;
      if (instruments.size() >= 1 && mouseX >= inst1X && mouseX <= inst1X + 100 && mouseY >= inst1Y && mouseY <= inst1Y + 100 && inst1Selected == false) {
        Clicked = true;
        inst1Selected = true; 
        if (showInstrumentTooltip) {
          showInstrumentTooltip = false;
          showBeatTooltip = true;
        }
      } else if (instruments.size() >= 3 && mouseX >= inst3X && mouseX <= inst3X + 100 && mouseY >= inst3Y && mouseY <= inst3Y + 100 && inst3Selected == false) {
        Clicked = true;
        inst3Selected = true; 
        if (showInstrumentTooltip) {
          showInstrumentTooltip = false;
          showBeatTooltip = true;
        }
      } else if (instruments.size() >= 2 && mouseX >= inst2X && mouseX <= inst2X + 100 && mouseY >= inst2Y && mouseY <= inst2Y + 100 && inst2Selected == false) {
        Clicked = true;
        inst2Selected = true;
        if (showInstrumentTooltip) {
          showInstrumentTooltip = false;
          showBeatTooltip = true;
        }
      }else if (instruments.size() >= 1 && mouseX >= inst1X && mouseX <= inst1X + 100 && mouseY >= inst1Y && mouseY <= inst1Y + 100 && inst1Selected == true) {
        Clicked = true;
        inst1Selected = false; 
        for (int i=0; i<16; i++) {
           Beats.updateBeats(0, i, 0);
         }
      } else if (instruments.size() >= 3 && mouseX >= inst3X && mouseX <= inst3X + 100 && mouseY >= inst3Y && mouseY <= inst3Y + 100 && inst3Selected == true) {
        Clicked = true;
        inst3Selected = false; 
        for (int i=0; i<16; i++) {
           Beats.updateBeats(2, i, 0);
         }
      } else if (instruments.size() >= 2 && mouseX >= inst2X && mouseX <= inst2X + 100 && mouseY >= inst2Y && mouseY <= inst2Y + 100 && inst2Selected == true) {
        Clicked = true;
        inst2Selected = false;
        for (int i=0; i<16; i++) {
           Beats.updateBeats(1, i, 0);
         }
      }
      // layout toggle check
      else if (mouseX >= 1200 && mouseX <= 1275 && mouseY >= 25 && mouseY <= 76){
        renderCircular = false;
        area.setVisible(false);
      }
      else if (mouseX >= 613 && mouseX <= 640 && mouseY >= 198 && mouseY <= 263) {
        updateCircleUI(0,0);
        showBeatTooltip = false;
      }
      else if (mouseX >= 645 && mouseX <= 680 && mouseY >= 209 && mouseY <= 276) {
        updateCircleUI(0,1);
        showBeatTooltip = false;
      }
      else if (mouseX >= 648 && mouseX <= 724 && mouseY >= 255 && mouseY <= 285) {
        updateCircleUI(0,2);
        showBeatTooltip = false;
      }
      else if (mouseX >= 658 && mouseX <= 727 && mouseY >= 275 && mouseY <= 313) {
        updateCircleUI(0,3);
        showBeatTooltip = false;
      }
      else if (mouseX >= 653 && mouseX <= 729 && mouseY >= 312 && mouseY <= 360) {
        updateCircleUI(0,4);
        showBeatTooltip = false;
      }
      else if (mouseX >= 642 && mouseX <= 718 && mouseY >= 334 && mouseY <= 380) {
        updateCircleUI(0,5);
        showBeatTooltip = false;
      }
      else if (mouseX >= 635 && mouseX <= 664 && mouseY >= 343 && mouseY <= 411) {
        updateCircleUI(0,6);
        showBeatTooltip = false;
      }
      else if (mouseX >= 618 && mouseX <= 654 && mouseY >= 358 && mouseY <= 422) {
        updateCircleUI(0,7);
        showBeatTooltip = false;
      }
      else if (mouseX >= 600 && mouseX <= 644 && mouseY >= 352 && mouseY <= 425) {
        updateCircleUI(0,8);
        showBeatTooltip = false;
      }
      else if (mouseX >= 536 && mouseX <= 593 && mouseY >= 344 && mouseY <= 417) {
        updateCircleUI(0,9);
        showBeatTooltip = false;
      }
      else if (mouseX >= 509 && mouseX <= 580 && mouseY >= 327 && mouseY <= 392) {
        updateCircleUI(0,10);
        showBeatTooltip = false;
      }
      else if (mouseX >= 496 && mouseX <= 567 && mouseY >= 316 && mouseY <= 361) {
        updateCircleUI(0,11);
        showBeatTooltip = false;
      }
      else if (mouseX >= 496 && mouseX <= 567 && mouseY >= 275 && mouseY <= 313) {
        updateCircleUI(0,12);
        showBeatTooltip = false;
      }
      else if (mouseX >= 504 && mouseX <= 571 && mouseY >= 230 && mouseY <= 294) {
        updateCircleUI(0,13);
        showBeatTooltip = false;
      }
      else if (mouseX >= 535 && mouseX <= 584 && mouseY >= 205 && mouseY <= 278) {
        updateCircleUI(0,14);
        showBeatTooltip = false;
      }
      else if (mouseX >= 570 && mouseX <= 610 && mouseY >= 196 && mouseY <= 266) {
        updateCircleUI(0,15);
        showBeatTooltip = false;
      }
      else if (mouseX >= 612.5 && mouseX <= 690 && mouseY >= 139 && mouseY <= 202) {
        updateCircleUI(1,0);
        showBeatTooltip = false;
      }
      else if (mouseX >= 672 && mouseX <= 748 && mouseY >= 158 && mouseY <= 229) {
        updateCircleUI(1,1);
        showBeatTooltip = false;
      }
      else if (mouseX >= 706 && mouseX <= 779 && mouseY >= 200 && mouseY <= 270) {
        updateCircleUI(1,2);
        showBeatTooltip = false;
      }
      else if (mouseX >= 734 && mouseX <= 796 && mouseY >= 269 && mouseY <= 312) {
        updateCircleUI(1,3);
        showBeatTooltip = false;
      }
      else if (mouseX >= 728 && mouseX <= 791 && mouseY >= 319 && mouseY <= 374) {
        updateCircleUI(1,4);
        showBeatTooltip = false;
      }
      else if (mouseX >= 702 && mouseX <= 773 && mouseY >= 362 && mouseY <= 425) {
        updateCircleUI(1,5);
        showBeatTooltip = false;
      }
      else if (mouseX >= 667 && mouseX <= 731 && mouseY >= 399 && mouseY <= 460) {
        updateCircleUI(1,6);
        showBeatTooltip = false;
      }
      else if (mouseX >= 617 && mouseX <= 673 && mouseY >= 425 && mouseY <= 480) {
        updateCircleUI(1,7);
        showBeatTooltip = false;
      }
      else if (mouseX >= 558 && mouseX <= 614 && mouseY >= 428 && mouseY <= 484) {
        updateCircleUI(1,8);
        showBeatTooltip = false;
      }
      else if (mouseX >= 505 && mouseX <= 566 && mouseY >= 408 && mouseY <= 467) {
        updateCircleUI(1,9);
        showBeatTooltip = false;
      }
      else if (mouseX >= 457 && mouseX <= 526 && mouseY >= 370 && mouseY <= 436) {
        updateCircleUI(1,10);
        showBeatTooltip = false;
      }
      else if (mouseX >= 435 && mouseX <= 501 && mouseY >= 318 && mouseY <= 378) {
        updateCircleUI(1,11);
        showBeatTooltip = false;
      }
      else if (mouseX >= 434 && mouseX <= 495 && mouseY >= 262 && mouseY <= 316) {
        updateCircleUI(1,12);
        showBeatTooltip = false;
      }
      else if (mouseX >= 452 && mouseX <= 522 && mouseY >= 195 && mouseY <= 261) {
        updateCircleUI(1,13);
        showBeatTooltip = false;
      }
      else if (mouseX >= 487 && mouseX <= 558 && mouseY >= 156 && mouseY <= 221) {
        updateCircleUI(1,14);
        showBeatTooltip = false;
      }
      else if (mouseX >= 552 && mouseX <= 605 && mouseY >= 138 && mouseY <= 191) {
        updateCircleUI(1,15);
        showBeatTooltip = false;
      }
      else if (mouseX >= 615 && mouseX <= 719 && mouseY >= 66 && mouseY <= 134) {
        updateCircleUI(2,0);
        showBeatTooltip = false;
      }
      else if (mouseX >= 703 && mouseX <= 799 && mouseY >= 98 && mouseY <= 174) {
        updateCircleUI(2,1);
        showBeatTooltip = false;
      }
      else if (mouseX >= 764 && mouseX <= 851 && mouseY >= 155 && mouseY <= 247) {
        updateCircleUI(2,2);
        showBeatTooltip = false;
      }
      else if (mouseX >= 798 && mouseX <= 860 && mouseY >= 244 && mouseY <= 314) {
        updateCircleUI(2,3);
        showBeatTooltip = false;
      }
      else if (mouseX >= 791 && mouseX <= 863 && mouseY >= 321 && mouseY <= 400) {
        updateCircleUI(2,4);
        showBeatTooltip = false;
      }
      else if (mouseX >= 755 && mouseX <= 837 && mouseY >= 386 && mouseY <= 470) {
        updateCircleUI(2,5);
        showBeatTooltip = false;
      }
      else if (mouseX >= 693 && mouseX <= 784 && mouseY >= 444 && mouseY <= 519) {
        updateCircleUI(2,6);
        showBeatTooltip = false;
      }
      else if (mouseX >= 615 && mouseX <= 699 && mouseY >= 485 && mouseY <= 544) {
        updateCircleUI(2,7);
        showBeatTooltip = false;
      }
      else if (mouseX >= 540 && mouseX <= 611 && mouseY >= 485 && mouseY <= 544) {
        updateCircleUI(2,8);
        showBeatTooltip = false;
      }
      else if (mouseX >= 466 && mouseX <= 547 && mouseY >= 462 && mouseY <= 522) {
        updateCircleUI(2,9);
        showBeatTooltip = false;
      }
      else if (mouseX >= 396 && mouseX <= 493 && mouseY >= 399 && mouseY <= 484) {
        updateCircleUI(2,10);
        showBeatTooltip = false;
      }
      else if (mouseX >= 369 && mouseX <= 435 && mouseY >= 322 && mouseY <= 411) {
        updateCircleUI(2,11);
        showBeatTooltip = false;
      }
      else if (mouseX >= 369 && mouseX <= 434 && mouseY >= 229 && mouseY <= 312) {
        updateCircleUI(2,12);
        showBeatTooltip = false;
      }
      else if (mouseX >= 385 && mouseX <= 474 && mouseY >= 148 && mouseY <= 242) {
        updateCircleUI(2,13);
        showBeatTooltip = false;
      }
      else if (mouseX >= 436 && mouseX <= 535 && mouseY >= 88 && mouseY <= 176) {
        updateCircleUI(2,14);
        showBeatTooltip = false;
      }
      else if (mouseX >= 521 && mouseX <= 605 && mouseY >= 69 && mouseY <= 133) {
        updateCircleUI(2,15);
        showBeatTooltip = false;
      } 
      else {
      Clicked = false;
    }
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
  
  void setInst1Selected(boolean s) {
    inst1Selected = s;
  }
  
  void setInst3Selected(boolean s) {
    inst3Selected = s;
  }
  
  void setInst2Selected(boolean s) {
    inst2Selected = s;
  }
  
  Boolean isAlgorithmButtonSelected() {
    return algorithmButtonSelected;
  }
  
  void setIsAlgorithmButtonSelected(boolean s) {
    algorithmButtonSelected = s;
  }
  
  void render(DrumBeats beats) {
    if (renderCircular && !algorithmButtonSelected){
    Beats = beats;
    inst1Filled = Beats.getRow(0);
    inst2Filled = Beats.getRow(1);
    inst3Filled = Beats.getRow(2);
    
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
      text("Click on beats to add and remove accents",830,70);
    }

    //tempo text
    textSize(24); 
    textAlign(CENTER);
    textFont(createFont("Gothic A1", 30));
    fill(-1);
    if (beginnerSelected) text("Tempo (Speed)", 800, 620);
    else text("Tempo (BPM)", 800, 620);
    
    text("Add Accent", 790, 750);
    
    // Text Input for Name of Song
    area.setVisible(true);
    area.setOpaque(true);
    area.setLocalColor(2, color(252,252,252)); //text color
    area.setLocalColor(6, color(66,65,62)); //border colour
    area.setLocalColor(7, color(66,65,62)); //background color
    area.setFont(new Font("Gothic A1", Font.PLAIN, 30));
    
    if ((area.getText().trim()).equals("")){
      area.setText(name);
    }
    
    // Show tooltips
    if (showNameTooltip) {
      Tooltip nameTooltip = new Tooltip("Add a name for your beat","T",25,80,300,30);   
      nameTooltip.drawTooltip();
    } else if (showInstrumentTooltip && !inst1Selected && !inst3Selected && !inst2Selected) {
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
      Tooltip beatTooltip = new Tooltip("Click on a segment to add the instruments to the beat", "R", 60,y,300,30);
      beatTooltip.drawTooltip();
    }   
    
    algorithmButton = new RectangularButton(-16524602, 7.933884, -16524602, 1078.1515, 497.4589, 1.5648444, -34.9776, -189.1425, 24.9776, 100.195866, "Get Help From Algorithm", 1123.74, 490.98, 24);
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
            inst2Button = new RectangularButton(inst2Fill,7.933884, -10241491, 290.50824, 642.5511, 1.5700793, -34.9776, -114.26565, 34.9776, 34.9776, inst2, 328, 638.66, 24);
            inst2Button.renderWithText();
          }
          if (instruments.size() == 3) {
            inst3Button = new RectangularButton(inst3Fill, 7.933884, -1157409, 500.3737, 642.5511, 1.5707964, -34.9776, -110.122215, 34.9776, 34.9776, inst3, 539.23, 638.66, 24);
          inst3Button.renderWithText();
          }
    }
    
    if (algorithmButtonSelected) {
      save.setVisible(false);
      cancel.setVisible(false);
    }
  
  } 
  
  void renderInst1Circle() {

    noFill();
    strokeWeight(6.0);
    stroke(-3355444);
    pushMatrix();
    translate(613.0792, 309.61633);
    rotate(0.019890904);
    ellipse(0,0,82.90979, 80.36069);
    popMatrix();
  
    noFill();
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(613.0792, 310.9118);
    rotate(0.0);
    ellipse(0,0,233.08308, 233.08308);
    popMatrix();
  
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(611.78375, 195.61536, 611.78375, 265.5705);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(615.67017, 354.95764, 615.67017, 423.61734);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(659.716, 314.79822, 727.0802, 314.79822);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(570.32886, 317.38913, 500.3737, 317.38913);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(648.0568, 281.1161, 699.8754, 240.95665);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(579.3971, 282.41156, 528.87396, 234.47932);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(583.2835, 339.41205, 535.35126, 395.1171);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(642.87494, 342.003, 694.6936, 388.63977);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(505.55557, 275.93423, 567.7379, 299.25262);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(661.0115, 208.57, 632.5112, 273.3433);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(653.23865, 299.25262, 721.8984, 277.2297);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(596.23816, 270.75238, 567.7379, 204.68361);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(597.5336, 349.7758, 575.51074, 419.73096);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(574.2153, 323.8665, 510.73743, 364.0259);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(651.94324, 331.63928, 715.421, 356.2531);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(627.32935, 349.7758, 658.42053, 417.14);
  
  
  if(inst1Filled[0] > 0) {
    if (inst1Filled[0] == 1)
      fill(211, 187, 240);
    else
      fill(187,134,252);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(610.4883, 196.91081);
    rotate(0.0);
    beginShape();
    vertex(4.7963867, -1.0486603);
    vertex(49.227722, 9.068268);
    vertex(20.727478, 71.250626);
    vertex(5.181885, 69.955154);
    endShape(CLOSE);
    popMatrix();
  }
  
  if(inst1Filled[1] > 0) {
    if (inst1Filled[1] == 1)
      fill(211, 187, 240);
    else
      fill(187,134,252);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(610.4883, 196.91081);
    rotate(0.0);
    beginShape();
    vertex(89.387146, 38.863983);
    vertex(55.70508, 10.363724);
    vertex(24.613892, 76.43248);
    vertex(37.568542, 81.614365);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst1Filled[2] > 0) {
    if (inst1Filled[2] == 1)
      fill(211, 187, 240);
    else
      fill(187,134,252);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(610.4883, 196.91081);
    rotate(0.0);
    beginShape();
    vertex(112.70557, 77.72795);
    vertex(93.27356, 44.045837);
    vertex(40.159485, 86.79622);
    vertex(47.93225, 99.75087);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst1Filled[3] > 0) {
    if (inst1Filled[3] == 1)
      fill(211, 187, 240);
    else
      fill(187,134,252);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(610.4883, 196.91081);
    rotate(0.0);
    beginShape();
    vertex(116.59192, 117.887405);
    vertex(112.70557, 81.614365);
    vertex(47.93225, 101.04634);
    vertex(49.227722, 115.29646);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst1Filled[4] > 0) {
    if (inst1Filled[4] == 1)
      fill(211, 187, 240);
    else
      fill(187,134,252);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(610.4883, 196.91081);
    rotate(0.0);
    beginShape();
    vertex(107.52368, 159.3423);
    vertex(116.59192, 120.47832);
    vertex(47.93225, 117.887405);
    vertex(44.045837, 133.433);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst1Filled[5] > 0) {
    if (inst1Filled[5] == 1)
      fill(211, 187, 240);
    else
      fill(187,134,252);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(657.12506, 224.1156);
    rotate(0.066411495);
    beginShape();
    vertex(53.574394, 161.32445);
    vertex(68.40101, 130.4768);
    vertex(-0.44813156, 110.38768);
    vertex(-3.9820962, 115.816025);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst1Filled[6] > 0) {
    if (inst1Filled[6] == 1)
      fill(211, 187, 240);
    else
      fill(187,134,252);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(657.12506, 224.1156);
    rotate(0.38815963);
    beginShape();
    vertex(77.36303, 175.50443);
    vertex(99.713776, 141.17255);
    vertex(24.942915, 115.76335);
    vertex(20.908697, 123.01132);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst1Filled[7] > 0) {
    if (inst1Filled[7] == 1)
      fill(211, 187, 240);
    else
      fill(187,134,252);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(657.12506, 224.1156);
    rotate(0.6149584);
    beginShape();
    vertex(84.84825, 187.49036);
    vertex(110.30239, 158.40924);
    vertex(45.73236, 123.1291);
    vertex(42.24725, 127.176765);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst1Filled[8] > 0) {
    if (inst1Filled[8] == 1)
      fill(211, 187, 240);
    else
      fill(187,134,252);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(657.12506, 224.1156);
    rotate(0.6719583);
    beginShape();
    vertex(60.9442, 201.47658);
    vertex(91.54362, 183.75766);
    vertex(47.396095, 126.176346);
    vertex(33.409744, 135.64641);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst1Filled[9] > 0) {
    if (inst1Filled[9] == 1)
      fill(211, 187, 240);
    else
      fill(187,134,252);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(657.12506, 224.1156);
    rotate(0.6719583);
    beginShape();
    vertex(14.584328, 211.8681);
    vertex(56.082428, 203.6885);
    vertex(28.755314, 136.0381);
    vertex(15.59853, 138.22699);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst1Filled[10] > 0) {
    if (inst1Filled[10] == 1)
      fill(211, 187, 240);
    else
      fill(187,134,252);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(657.12506, 224.1156);
    rotate(0.6719583);
    beginShape();
    vertex(-23.019577, 202.05219);
    vertex(10.344681, 208.61923);
    vertex(11.957939, 137.81223);
    vertex(-1.3831329, 133.5264);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst1Filled[11] > 0) {
    if (inst1Filled[11] == 1)
      fill(211, 187, 240);
    else
      fill(187,134,252);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(620.85205, 228.002);
    rotate(0.6719583);
    beginShape();
    vertex(-39.86281, 147.58163);
    vertex(-4.125313, 173.7802);
    vertex(20.345264, 104.655334);
    vertex(14.077919, 103.01933);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst1Filled[12] > 0) {
    if (inst1Filled[12] == 1)
      fill(211, 187, 240);
    else
      fill(187,134,252);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(620.85205, 228.002);
    rotate(0.6719583);
    beginShape();
    vertex(-63.43425, 111.70567);
    vertex(-43.088615, 143.5263);
    vertex(15.506546, 98.57231);
    vertex(6.4281807, 89.2404);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst1Filled[13] > 0)  {
    if (inst1Filled[13] == 1)
      fill(211, 187, 240);
    else
      fill(187,134,252);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(620.85205, 228.002);
    rotate(0.6719583);
    beginShape();
    vertex(-70.7843, 62.926434);
    vertex(-63.825924, 107.05126);
    vertex(6.842949, 85.59981);
    vertex(3.0411224, 70.41536);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst1Filled[14] > 0) {
    if (inst1Filled[14] == 1)
      fill(211, 187, 240);
    else
      fill(187,134,252);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(620.85205, 228.002);
    rotate(0.6719583);
    beginShape();
    vertex(-57.09734, 15.621988);
    vertex(-70.36953, 59.28585);
    vertex(1.6355934, 66.567375);
    vertex(7.7416935, 53.43367);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst1Filled[15] > 0) {
    if (inst1Filled[15] == 1)
      fill(211, 187, 240);
    else
      fill(187,134,252);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(620.85205, 228.002);
    rotate(0.6719583);
    beginShape();
    vertex(-30.299736, -17.281353);
    vertex(-53.041977, 12.396164);
    vertex(9.377708, 47.166344);
    vertex(17.0967, 36.060295);
    endShape(CLOSE);
    popMatrix();
  }
}

  void renderInst2Circle() {
    
    noFill();
    strokeWeight(6.0);
    stroke(-3355444);
    pushMatrix();
    translate(614.3747, 308.3209);
    rotate(0.0);
    ellipse(0,0,370.51233, 352.4048);
    popMatrix();
  
    noFill();
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(613.0792, 310.9118);
    rotate(0.0);
    ellipse(0,0,233.08308, 233.08308);
    popMatrix();
  
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(611.78375, 195.61536, 611.78375, 130.84206);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(615.67017, 481.9133, 615.67017, 428.7992);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(799.62634, 316.0937, 732.2621, 316.0937);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(430.41855, 318.6846, 495.19183, 318.6846);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(751.6941, 194.31989, 705.0573, 237.07025);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(483.53265, 189.13802, 526.283, 231.8884);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(500.3737, 441.75388, 534.0558, 399.00348);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(738.73944, 433.98108, 695.9891, 395.1171);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(500.3737, 272.04785, 443.3732, 248.72945);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(664.574, 202.95633, 693.3621, 151.13768);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(788.9387, 255.92648, 729.0594, 275.5024);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(542.5123, 149.98616, 567.66925, 201.83635);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(556.154, 470.52588, 572.7872, 421.90588);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(453.73694, 387.3443, 505.55557, 364.0259);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(776.3079, 382.16245, 723.19385, 357.54858);
    strokeWeight(3.9338844);
    stroke(-3355444);
    line(684.32983, 466.3677, 660.83, 419.16156);
    
   if(inst2Filled[0] > 0) {
     if (inst2Filled[0] == 1)
      fill(183,224,157);
    else
      fill(99,186,45);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(662.5164, 156.14258);
    rotate(0.6719583);
    beginShape();
    vertex(16.633448, -24.13669);
    vertex(-53.041977, 12.396164);
    vertex(-14.443375, 58.227493);
    vertex(28.083492, 35.305313);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst2Filled[1] > 0) {
    if (inst2Filled[1] == 1)
      fill(183,224,157);
    else
      fill(99,186,45);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(662.5164, 154.92331);
    rotate(0.6719583);
    beginShape();
    vertex(93.576195, -29.254248);
    vertex(25.394684, -24.87397);
    vertex(33.418293, 34.177673);
    vertex(81.973755, 34.503197);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst2Filled[2] > 0) {
    if (inst2Filled[2] == 1)
      fill(183,224,157);
    else
      fill(99,186,45);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(662.5164, 154.92331);
    rotate(0.6719583);
    beginShape();
    vertex(161.67084, -2.4063797);
    vertex(95.853226, -26.391659);
    vertex(86.15921, 35.84776);
    vertex(125.150986, 51.57047);
    endShape(CLOSE);
    popMatrix();
  }
    if(inst2Filled[3] > 0) {
      if (inst2Filled[3] == 1)
      fill(183,224,157);
    else
      fill(99,186,45);
      strokeWeight(3.9338844);
      stroke(-3355444);
      pushMatrix();
      translate(662.5164, 154.92331);
      rotate(0.6719583);
      beginShape();
      vertex(206.4961, 38.27719);
      vertex(165.66107, 0.65140533);
      vertex(127.23284, 56.146244);
      vertex(155.5332, 81.931335);
      endShape(CLOSE);
      popMatrix();
  }
  if(inst2Filled[4] > 0) {
    if (inst2Filled[4] == 1)
      fill(183,224,157);
    else
      fill(99,186,45);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(662.5164, 154.92331);
    rotate(0.6719583);
    beginShape();
    vertex(206.66956, 44.371025);
    vertex(235.64206, 102.33845);
    vertex(173.14227, 117.77875);
    vertex(155.5332, 81.931335);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst2Filled[5] > 0) {
    if (inst2Filled[5] == 1)
      fill(183,224,157);
    else
      fill(99,186,45);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(662.5164, 154.92331);
    rotate(0.6719583);
    beginShape();
    vertex(236.57455, 109.38648);
    vertex(238.69952, 166.89838);
    vertex(178.34676, 163.49333);
    vertex(174.26993, 123.113594);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst2Filled[6] > 0) {
    if (inst2Filled[6] == 1)
      fill(183,224,157);
    else
      fill(99,186,45);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(662.5164, 154.92331);
    rotate(0.6719583);
    beginShape();
    vertex(235.25137, 174.31505);
    vertex(215.10455, 229.28954);
    vertex(163.38304, 203.43932);
    vertex(178.52022, 169.58716);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst2Filled[7] > 0) {
    if (inst2Filled[7] == 1)
      fill(183,224,157);
    else
      fill(99,186,45);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(662.5164, 154.92331);
    rotate(0.6719583);
    beginShape();
    vertex(214.32384, 236.14238);
    vertex(169.62827, 285.71692);
    vertex(136.99068, 244.6864);
    vertex(165.26971, 209.72835);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst2Filled[8] > 0) {
    if (inst2Filled[8] == 1)
      fill(183,224,157);
    else
      fill(99,186,45);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(662.5164, 154.92331);
    rotate(0.6719583);
    beginShape();
    vertex(166.00665, 287.03976);
    vertex(116.04144, 314.3208);
    vertex(96.37227, 266.0905);
    vertex(132.4149, 246.76826);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst2Filled[9] > 0) {
    if (inst2Filled[9] == 1)
      fill(183,224,157);
    else
      fill(99,186,45);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(662.5164, 154.92331);
    rotate(0.6719583);
    beginShape();
    vertex(111.075294, 319.82904);
    vertex(53.736862, 328.04785);
    vertex(52.370888, 271.49017);
    vertex(94.46386, 267.60855);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst2Filled[10] > 0) {
    if (inst2Filled[10] == 1)
      fill(183,224,157);
    else
      fill(99,186,45);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(662.5164, 154.92331);
    rotate(0.6719583);
    beginShape();
    vertex(49.161057, 330.1297);
    vertex(-15.9192505, 314.90567);
    vertex(9.930977, 263.18414);
    vertex(48.749275, 272.81302);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst2Filled[11] > 0) {
    if (inst2Filled[11] == 1)
      fill(183,224,157);
    else
      fill(99,186,45);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(662.5164, 154.92331);
    rotate(0.6719583);
    beginShape();
    vertex(-23.566833, 314.07495);
    vertex(-78.29057, 276.49377);
    vertex(-27.391342, 234.3508);
    vertex(3.8991165, 259.12076);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst2Filled[12] > 0) {
    if (inst2Filled[12] == 1)
      fill(183,224,157);
    else
      fill(99,186,45);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(662.5164, 154.92331);
    rotate(0.6719583);
    beginShape();
    vertex(-81.101616, 268.79782);
    vertex(-112.71452, 214.4885);
    vertex(-53.38214, 195.4333);
    vertex(-30.61715, 230.29547);
    endShape(CLOSE);
    popMatrix();
  }
  
  if(inst2Filled[13] > 0) {
    if (inst2Filled[13] == 1)
      fill(183,224,157);
    else
      fill(99,186,45);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(662.5164, 154.92331);
    rotate(0.6719583);
    beginShape();
    vertex(-117.345856, 206.58517);
    vertex(-123.42851, 138.5892);
    vertex(-62.75989, 148.267);
    vertex(-54.58029, 189.76508);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst2Filled[14] > 0) {
    if (inst2Filled[14] == 1)
      fill(183,224,157);
    else
      fill(99,186,45);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(662.5164, 154.92331);
    rotate(0.6719583);
    beginShape();
    vertex(-123.8202, 133.93478);
    vertex(-99.97179, 70.27079);
    vertex(-46.031414, 98.54318);
    vertex(-58.289757, 141.40059);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst2Filled[15] > 0) {
    if (inst2Filled[15] == 1)
      fill(183,224,157);
    else
      fill(99,186,45);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(662.5164, 154.92331);
    rotate(0.6719583);
    beginShape();
    vertex(-98.54316, 65.823746);
    vertex(-55.915874, 15.362753);
    vertex(-19.625484, 60.985413);
    vertex(-45.40925, 93.0823);
    endShape(CLOSE);
    popMatrix();
  }
}
  
  void renderInst3Circle() {
    
    noFill();
  strokeWeight(6.0);
  stroke(-3355444);
  pushMatrix();
  translate(614.3747, 308.3209);
  rotate(0.0);
  ellipse(0,0,370.51233, 352.4048);
  popMatrix();

  noFill();
  strokeWeight(3.9338844);
  stroke(-3355444);
  pushMatrix();
  translate(616.96564, 304.43448);
  rotate(0.0);
  ellipse(0,0,505.29144, 487.34314);
  popMatrix();

  strokeWeight(3.9338844);
  stroke(-3355444);
  line(611.78375, 63.47783, 611.78375, 130.84206);
  strokeWeight(3.9338844);
  stroke(-3355444);
  line(614.3747, 485.7997, 614.3747, 544.0957);
  strokeWeight(3.9338844);
  stroke(-3355444);
  line(799.62634, 316.0937, 866.99054, 317.38913);
  strokeWeight(3.9338844);
  stroke(-3355444);
  line(430.41855, 318.6846, 365.64523, 319.98007);
  strokeWeight(3.9338844);
  stroke(-3355444);
  line(756.8759, 191.72896, 807.3991, 150.27405);
  strokeWeight(3.9338844);
  stroke(-3355444);
  line(480.9417, 183.95616, 433.00946, 143.7967);
  strokeWeight(3.9338844);
  stroke(-3355444);
  line(496.4873, 444.3448, 458.9188, 488.39062);
  strokeWeight(3.9338844);
  stroke(-3355444);
  line(742.6258, 437.86746, 790.55804, 478.02692);
  strokeWeight(3.9338844);
  stroke(-3355444);
  line(385.07724, 218.93373, 436.89587, 243.54759);
  strokeWeight(3.9338844);
  stroke(-3355444);
  line(727.0802, 90.68261, 693.3621, 151.13768);
  strokeWeight(3.9338844);
  stroke(-3355444);
  line(788.9387, 255.92648, 857.9223, 231.8884);
  strokeWeight(3.9338844);
  stroke(-3355444);
  line(540.53314, 142.50125, 515.9193, 85.50075);
  strokeWeight(3.9338844);
  stroke(-3355444);
  line(553.4878, 475.43597, 534.0558, 529.8455);
  strokeWeight(3.9338844);
  stroke(-3355444);
  line(447.2596, 391.2307, 396.73642, 415.84454);
  strokeWeight(3.9338844);
  stroke(-3355444);
  line(785.3762, 382.16245, 841.08124, 408.07175);
  strokeWeight(3.9338844);
  stroke(-3355444);
  line(686.9208, 472.84506, 712.8301, 524.6637);
  
  if(inst3Filled[0] > 0) {
    if (inst3Filled[0] == 1)
      fill(245,186,239);
    else
      fill(238,86,223);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(734.853, 145.09218);
    rotate(0.6719583);
    beginShape();
    vertex(-148.3192, 7.0730667);
    vertex(-42.16605, -42.604214);
    vertex(-29.608633, 25.207422);
    vertex(-103.15782, 63.847942);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst3Filled[1] > 0) {
    if (inst3Filled[1] == 1)
      fill(245,186,239);
    else
      fill(238,86,223);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(734.853, 145.09218);
    rotate(0.6719583);
    beginShape();
    vertex(-39.331917, -43.203293);
    vertex(61.429287, -45.55307);
    vertex(42.834366, 20.553358);
    vertex(-26.567158, 22.78809);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst3Filled[2] > 0) {
    if (inst3Filled[2] == 1)
      fill(245,186,239);
    else
      fill(238,86,223);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(734.853, 145.09218);
    rotate(0.66543645);
    beginShape();
    vertex(64.26343, -46.15214);
    vertex(146.98178, -9.962654);
    vertex(112.463005, 46.772243);
    vertex(51.129333, 20.576454);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst3Filled[3] > 0) {
    if (inst3Filled[3] == 1)
      fill(245,186,239);
    else
      fill(238,86,223);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(734.853, 145.09218);
    rotate(0.66543645);
    beginShape();
    vertex(153.81888, -5.4478607);
    vertex(209.52238, 52.935852);
    vertex(157.7688, 91.90799);
    vertex(115.44304, 52.66743);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst3Filled[4] > 0) {
    if (inst3Filled[4] == 1)
      fill(245,186,239);
    else
      fill(238,86,223);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(734.853, 145.09218);
    rotate(0.67361563);
    beginShape();
    vertex(215.20587, 53.6541);
    vertex(252.13823, 135.22977);
    vertex(187.7885, 149.04105);
    vertex(162.15652, 91.023224);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst3Filled[5] > 0) {
    if (inst3Filled[5] == 1)
      fill(245,186,239);
    else
      fill(238,86,223);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(734.853, 145.09218);
    rotate(0.67361563);
    beginShape();
    vertex(250.51266, 141.49979);
    vertex(254.66432, 227.69188);
    vertex(190.13412, 219.5266);
    vertex(186.36319, 154.57828);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst3Filled[6] > 0) {
    if (inst3Filled[6] == 1)
      fill(245,186,239);
    else
      fill(238,86,223);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(734.853, 145.09218);
    rotate(0.67361563);
    beginShape();
    vertex(253.25247, 223.8463);
    vertex(226.0447, 310.20544);
    vertex(172.66129, 284.8556);
    vertex(191.13725, 227.01347);
    endShape(CLOSE);
    popMatrix();
  }
  if(inst3Filled[7] > 0) {
      if (inst3Filled[7] == 1)
        fill(245,186,239);
      else
        fill(238,86,223);
      strokeWeight(3.9338844);
      stroke(-3355444);
      pushMatrix();
      translate(734.853, 145.09218);
      rotate(0.67361563);
      beginShape();
      vertex(222.59846, 316.27103);
      vertex(160.20425, 387.61908);
      vertex(122.4264, 338.21097);
      vertex(166.58627, 289.7044);
      endShape(CLOSE);
      popMatrix();
  }
  if(inst3Filled[8] > 0) {
    if (inst3Filled[8] == 1)
      fill(245,186,239);
    else
      fill(238,86,223);
    strokeWeight(3.9338844);
    stroke(-3355444);
    pushMatrix();
    translate(734.853, 145.09218);
    rotate(0.67361563);
    beginShape();
    vertex(156.96237, 391.8641);
    vertex(87.52733, 427.39392);
    vertex(67.965164, 371.7345);
    vertex(119.78829, 345.28915);
    endShape(CLOSE);
    popMatrix();
  }
    if(inst3Filled[9] > 0) {
      if (inst3Filled[9] == 1)
      fill(245,186,239);
    else
      fill(238,86,223);
      strokeWeight(3.9338844);
      stroke(-3355444);
      pushMatrix();
      translate(734.853, 145.09218);
      rotate(0.67361563);
      beginShape();
      vertex(80.8486, 429.40955);
      vertex(-0.0953064, 444.29004);
      vertex(4.62381, 385.82547);
      vertex(61.082016, 375.5708);
      endShape(CLOSE);
      popMatrix();
  }
   if(inst3Filled[10] > 0) {
      if (inst3Filled[10] == 1)
      fill(245,186,239);
    else
      fill(238,86,223);
      strokeWeight(3.9338844);
      stroke(-3355444);
      pushMatrix();
      translate(734.853, 145.09218);
      rotate(0.67361563);
      beginShape();
      vertex(-6.365341, 442.66443);
      vertex(-94.75879, 425.36795);
      vertex(-67.79274, 374.00952);
      vertex(-4.8881073, 388.4449);
      endShape(CLOSE);
      popMatrix();
  }
   if(inst3Filled[11] > 0) {
      if (inst3Filled[11] == 1)
      fill(245,186,239);
    else
      fill(238,86,223);
      strokeWeight(3.9338844);
      stroke(-3355444);
      pushMatrix();
      translate(734.853, 145.09218);
      rotate(0.6736157);
      beginShape();
      vertex(-101.233185, 425.563);
      vertex(-177.84807, 369.0301);
      vertex(-131.27313, 331.856);
      vertex(-71.83339, 368.94705);
      endShape(CLOSE);
      popMatrix();
  }
   if(inst3Filled[12] > 0) {
      if (inst3Filled[12] == 1)
      fill(245,186,239);
    else
      fill(238,86,223);
      strokeWeight(3.9338844);
      stroke(-3355444);
      pushMatrix();
      translate(734.853, 145.09218);
      rotate(0.6736157);
      beginShape();
      vertex(-182.09308, 365.78818);
      vertex(-232.37366, 279.94882);
      vertex(-170.0448, 266.666);
      vertex(-135.1094, 324.97284);
      endShape(CLOSE);
      popMatrix();
  }
   if(inst3Filled[13] > 0) {
      if (inst3Filled[13] == 1)
      fill(245,186,239);
    else
      fill(238,86,223);
      strokeWeight(3.9338844);
      stroke(-3355444);
      pushMatrix();
      translate(734.853, 145.09218);
      rotate(0.6736157);
      beginShape();
      vertex(-232.5687, 273.47443);
      vertex(-239.75787, 189.70673);
      vertex(-171.78142, 191.80641);
      vertex(-169.02298, 257.56284);
      endShape(CLOSE);
      popMatrix();
  }
   if(inst3Filled[14] > 0) {
      if (inst3Filled[14] == 1)
      fill(245,186,239);
    else
      fill(238,86,223);
      strokeWeight(3.9338844);
      stroke(-3355444);
      pushMatrix();
      translate(734.853, 145.09218);
      rotate(0.6736157);
      beginShape();
      vertex(-240.96541, 184.04047);
      vertex(-213.14453, 92.21944);
      vertex(-152.88734, 122.02798);
      vertex(-175.82208, 186.7439);
      endShape(CLOSE);
      popMatrix();
  }
   if(inst3Filled[15] > 0) {
      if (inst3Filled[15] == 1)
      fill(245,186,239);
    else
      fill(238,86,223);
      strokeWeight(3.9338844);
      stroke(-3355444);
      pushMatrix();
      translate(734.853, 145.09218);
      rotate(0.6736157);
      beginShape();
      vertex(-210.50641, 85.141266);
      vertex(-151.54915, 11.563919);
      vertex(-108.92251, 67.047);
      vertex(-149.44109, 115.96231);
      endShape(CLOSE);
      popMatrix();
   }
 }

  void updateName(String n) {
    name = n;
    showNameTooltip = false;
    if (!inst1Selected && !inst3Selected && !inst2Selected)
    showInstrumentTooltip = true;
  }
  
  void setRenderCircular(boolean b) {
    renderCircular = b;
  }
  
  boolean getRenderCircular() {
    return renderCircular;
  }
  
  void setAlgorithmSelected(boolean s) {
    algorithmButtonSelected = s;
  }
  
  void setBeginner(boolean begin) {
    beginnerSelected = begin;
  }
  
  void hideTextArea() {
    area.setVisible(false);
    area.setOpaque(false);
  }
  void setInstrumentNames(ArrayList<String> instrumentNames) {
    instruments = instrumentNames;
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

  void updateCircleUI(int instrumentNum, int beatNum) {
    if (instrumentNum == 0) {
        if (accentMode && (inst1Filled[beatNum] == 1 || inst1Filled[beatNum] == 0)) {
            inst1Filled[beatNum] = 2;
        } else if (accentMode && inst1Filled[beatNum] == 2) {
            inst1Filled[beatNum] = 1;
        } else {
            inst1Filled[beatNum] = inst1Filled[beatNum] > 0 ? 0 : 1; 
        }
        Beats.updateBeats(instrumentNum, beatNum, inst1Filled[beatNum]);
    } else if (instrumentNum == 1) {
        if (accentMode && (inst2Filled[beatNum] == 1 || inst2Filled[beatNum] == 0)) {
            inst2Filled[beatNum] = 2;
        } else if (accentMode && inst2Filled[beatNum] == 2) {
            inst2Filled[beatNum] = 1;
        } else {
            inst2Filled[beatNum] = inst2Filled[beatNum] > 0 ? 0 : 1; 
        }
        Beats.updateBeats(instrumentNum, beatNum, inst2Filled[beatNum]);
    } else if (instrumentNum == 2) {
        if (accentMode && (inst3Filled[beatNum] == 1 || inst3Filled[beatNum] == 0)) {
            inst3Filled[beatNum] = 2;
        } else if (accentMode && inst3Filled[beatNum] == 2) {
            inst3Filled[beatNum] = 1;
        } else {
            inst3Filled[beatNum] = inst3Filled[beatNum] > 0 ? 0 : 1; 
        }
        Beats.updateBeats(instrumentNum, beatNum, inst3Filled[beatNum]);
    }
}
}
