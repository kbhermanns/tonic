import g4p_controls.*;
// TODO: Implement adding in a beat from beat creation


class Dashboard{

  Dashboard(PApplet papp, Boolean _fillBeat){
    
    Boolean fillBeat = _fillBeat;
  }
  
  void render(){
    PImage dashFillImg;
    dashFillImg = loadImage("DashboardToFill.PNG");
    image(dashFillImg, 0, 0, 1300, 800);
  }

}
