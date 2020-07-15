 class CircleButton {
   float PositionX; 
   float PositionY;
   float Radius;
   color ButtonColor;
   boolean Clicked = false;
   boolean Pressed = false;
   
   
   CircleButton(float x, float y, float radius, color c) {
     PositionX = x;
     PositionY = y;
     Radius = radius;
     ButtonColor = c;
   }
   
   CircleButton(float x, float y, float radius) {
     PositionX = x;
     PositionY = y;
     Radius = radius;
   }
  
  void render(boolean r) {
    if (r == true) {
      fill(ButtonColor);
      circle(PositionX, PositionY, Radius);
      fill(000000);
      textAlign(CENTER, CENTER);
      textSize(24);
      text("Click Me", PositionX, PositionY);
    }
  }
  
  void renderNoFill(boolean r) {
    if (r == true) {
      noFill();
      stroke(-14079703);
      circle(PositionX, PositionY, Radius);
    }
  }
  
  boolean isClicked() {
    return Clicked;
  }
  
  void reset() {
    Clicked = false;
  }
  
   void update() {
    if (mousePressed == true && mouseButton == LEFT && Pressed == false) {
      Pressed = true;
      if (((mouseX >= PositionX && mouseX <= PositionX + Radius) || (mouseX <= PositionX && mouseX >= PositionX - Radius)) && ((mouseY >= PositionY && mouseY <= PositionY + Radius) || (mouseY <= PositionY && mouseY >= PositionY - Radius))) {
        Clicked = true;
      }
    } else {
      Clicked = false;
    }
    
    if(mousePressed != true) {
      Pressed = false;
    }
  }
   
}
