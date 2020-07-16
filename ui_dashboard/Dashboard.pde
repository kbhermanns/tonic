import g4p_controls.*;
// TODO: Implement adding in a beat from beat creation


class Dashboard{

  Dashboard(PApplet papp){
    
  }
  
  void render(Boolean fillBeat){
    PImage dashFillImg;
    PImage beatFillImg;
    dashFillImg = loadImage("DashboardToFill.PNG");
    beatFillImg = loadImage("BeatFillDark.PNG");
    image(dashFillImg, 0, 0, 1300, 800);
    if (fillBeat){
      textSize(25);
      fill(225);
      text(createLinearBeat.getName(), 287, 240);
      text(createLinearBeat.getName(),95, 125);
      image(beatFillImg, 380, 213, 1000, 100);
  }
  }
}
