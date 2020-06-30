class LinearBeatCreation {
  Boolean[] Beat;
  PImage img17;
  Boolean Pressed = false; 
  Boolean Clicked = false;
  Boolean kickSelected = false;
  int kickFill;
  float kickX = 127.28;
  float kickY = 638.66;
  Boolean tomSelected = false;
  int tomFill;
  float tomX = 539.23;
  float tomY = 638.66;
  Boolean rimSelected = false;
  int rimFill;  
  float rimX = 328; 
  float rimY = 638.66; 
  
  RectangularButton algorithmButton;
  RectangularButton saveButton;
  RectangularButton cancelButton; 
  RectangularButton kickButton;
  RectangularButton rimButton; 
  RectangularButton tomButton; 
   
  PImage img1 = loadImage("/Users/katrinahermanns/Desktop/Snare.png");
  PImage img0 = loadImage("/Users/katrinahermanns/Desktop/Kick.png");
  PImage img2 = loadImage("/Users/katrinahermanns/Desktop/Tom.png");
  
  LinearBeatCreation() {
  }
  
  void update() {
    if (mousePressed == true && mouseButton == LEFT && Pressed == false) {
      Pressed = true;
      if (mouseX >= kickX && mouseX <= kickX + 100 && mouseY >= kickY && mouseY <= kickY + 100) {
        Clicked = true;
        kickSelected = true; 
      } else if (mouseX >= tomX && mouseX <= tomX + 100 && mouseY >= tomY && mouseY <= tomY + 100) {
        Clicked = true;
        tomSelected = true; 
      } else if (mouseX >= rimX && mouseX <= rimX + 100 && mouseY >= rimY && mouseY <= rimY + 100) {
        Clicked = true;
        rimSelected = true;
      }
    } else {
      Clicked = false;
    }
    if(mousePressed != true) {
      Pressed = false;
    }
  }
  
  Boolean isKickSelected() {
    return kickSelected;
  }
  
  Boolean isTomSelected() {
    return tomSelected;
  }
  
  Boolean isRimSelected() {
    return rimSelected;
  }
  
  void render() {
    background(-14079703);
    algorithmButton = new RectangularButton(-16524602, 7.933884, -16524602, 1078.1515, 497.4589, 1.5648444, -34.9776, -189.1425, 24.9776, 100.195866, "Get Help From Algorithm", 1123.74, 490.98, 24);
    saveButton = new RectangularButton(-10241491, 7.933884, -10241491, 949.9004, 737.1201, 1.5707965, -34.9776, -110.114624, 34.9776, 34.9776, "Save", 983.582, 737.30, 24);
    cancelButton = new RectangularButton(-1094570, 7.933884, -1094570, 1159.7659, 737.1201, 1.5707965, -34.9776, -110.114624, 34.9776, 34.9776, "Cancel", 1196.04, 737.30, 24);
    if (tomSelected) {
      tomFill = -1157409;
    } else {
      tomFill = -1;
    }
    tomButton = new RectangularButton(tomFill, 7.933884, -1157409, 500.3737, 646.4375, 1.5707964, -34.9776, -110.122215, 34.9776, 34.9776, "Tom", 539.23, 638.66, 24);
    
    if (tomSelected) {
      rimFill = -10241491;
    } else {
      rimFill = -1;
    }
    rimButton = new RectangularButton(rimFill, 7.933884, -10241491, 290.50824, 642.5511, 1.5700793, -34.9776, -114.26565, 34.9776, 34.9776, "Rim", 328, 638.66, 24);
    
    if (tomSelected) {
      kickFill = -4487428;
    } else {
      kickFill = -1;
    }
    kickButton = new RectangularButton(kickFill, 7.933884, -4487428, 85.824615, 642.5511, 1.5707964, -34.9776, -116.59913, 34.9776, 34.9776, "Kick", 127.28, 638.66, 24);
    
    kickButton.renderWithText();
    rimButton.renderWithText();
    tomButton.renderWithText();
    cancelButton.renderWithText();
    saveButton.renderWithText();
    algorithmButton.renderWithText();
  
  }
  
  void renderKickSelector() {
    
    noFill();
    strokeWeight(3.553719);
    stroke(-3361793);
    pushMatrix();
    translate(22.346786, 90.68261);
    rotate(0.0);
    rectMode(CORNERS);
    rect(0, 0, 99.75087, 128.25113);
    image(img0, 0, 0, 99.75087, 128.25113);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(442.61743, 151.81633);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(369.82468, 146.88123);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(313.07098, 150.58255);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(247.68088, 149.34877);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(173.65434, 144.41367);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(506.85104, 152.86497);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(1247.8575, 154.16045);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(1040.583, 152.86497);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(1109.2427, 154.16045);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(1177.9023, 154.16045);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(572.9198, 152.86497);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(638.9885, 151.5695);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(706.3528, 151.5695);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(772.4215, 151.5695);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(838.4903, 151.5695);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(898.0817, 147.6831);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(964.1505, 147.6831);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
 
    noFill();
    noStroke();
    pushMatrix();
    translate(28.068806, 88.89377);
    rotate(0.0012106895);
    rectMode(CORNERS);
    rect(0, 0, 97.46828, 125.84512);
    popMatrix();

  }
  
  void renderRimSelector() {
    
    noFill();
    strokeWeight(3.553719);
    stroke(-3361793);
    pushMatrix();
    translate(15.869457, 358.84406);
    rotate(0.0);
    rectMode(CORNERS);
    rect(0, 0, 112.70553, 99.750885);
    image(img1, 0, 0, 117.88739, 107.52368);
    popMatrix();

    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(1249.153, 260.38864);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-34.977585, -31.33314, 24.918821, 28.764015);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(370.82712, 252.61584);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(311.2357, 257.7977);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(246.46239, 257.7977);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(172.62083, 252.61584);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(445.96414, 257.7977);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(1183.0842, 257.7977);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(1115.72, 257.7977);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(1047.0603, 256.50226);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(979.6961, 256.50226);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(904.5591, 252.61584);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(843.6722, 257.7977);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(512.0329, 257.7977);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(776.3079, 257.7977);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(710.2392, 257.7977);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(635.1022, 253.91132);
    rotate(0.0061781406);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(569.0334, 252.61584);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  }
  
  void renderTomSelector() {
    
    noFill();
    strokeWeight(3.553719);
    stroke(-3361793);
    pushMatrix();
    translate(14.573991, 233.18385);
    rotate(0.0);
    rectMode(CORNERS);
    rect(0, 0, 117.88739, 107.52368);
    image(img2, 0, 0, 112.70553, 99.750885);
    popMatrix();

    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(1246.562, 357.54858);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-34.977585, -31.33314, 24.918821, 28.764015);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(363.05432, 351.07126);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(306.0538, 356.2531);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(241.28052, 356.2531);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(167.43896, 351.07126);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(435.6004, 357.54858);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(1180.4933, 354.95764);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(1106.6517, 351.07126);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(1047.0603, 356.2531);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(980.9915, 354.95764);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(907.14996, 351.07126);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(848.854, 356.2531);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(500.3737, 356.2531);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(778.54956, 354.72687);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 29.646908, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(709.8001, 355.75296);
    rotate(1.5728104);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(629.7634, 351.64853);
    rotate(0.0061781406);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  
    fill(-13421259);
    strokeWeight(3.553719);
    stroke(-2039584);
    pushMatrix();
    translate(560.4814, 350.77234);
    rotate(0.0);
    rectMode(CORNERS);
    rect(-27.235615, -22.174805, 30.242954, 34.977585);
    popMatrix();
  }
}
