//This button class allows for the Art Station drawing tool to be used to create a button. When the code is copied from the tool, the paramaters to this button object can be defined using the generated code. 
class RectangularButton {
  PVector Position = new PVector(0,0); 
  float Width;
  float Height;
  float WidthLeft;
  float HeightUp;
  float WidthRight;
  float HeightDown;
  color ButtonSelectedColor;
  Boolean Pressed = false; 
  Boolean Clicked = false; 
  String ButtonText;
  float StrokeWeight;
  int Stroke;
  float TransX;
  float TransY;
  float Rotate;
  float Rect1;
  float Rect2;
  float Rect3;
  float Rect4;
  float TextX;
  float TextY;
  int Fill;
  int SelectedFill;
  boolean Selected;
  int TextSize;
  
   RectangularButton(int fill, float strokeWeight, int stroke, float transX, float transY, float rotate, float rect1, float rect2, float rect3, float rect4, String text, float textX, float textY, int textSize){
    Fill = fill;
    StrokeWeight = strokeWeight;
    Stroke = stroke;
    TransX = transX;
    TransY = transY;
    Rotate = rotate;
    Rect1 = rect1;
    Rect2 = rect2; 
    Rect3 = rect3;
    Rect4 = rect4; 
    ButtonText = text;
    TextX = textX;
    TextY = textY;
    TextSize = textSize;
    Selected = false;
     Position.x = transX;
    Position.y = transY;
    WidthLeft = rect1;
    WidthRight = rect3;
    HeightUp = rect2;
    HeightDown = rect4;
  }
  
  RectangularButton(int fill, int selectedFill, float strokeWeight, int stroke, float transX, float transY, float rotate, float rect1, float rect2, float rect3, float rect4){
    Fill = fill;
    SelectedFill = selectedFill;
    StrokeWeight = strokeWeight;
    Stroke = stroke;
    TransX = transX;
    TransY = transY;
    Rotate = rotate;
    Rect1 = rect1;
    Rect2 = rect2; 
    Rect3 = rect3;
    Rect4 = rect4;
    Selected = false;
    Position.x = transX;
    Position.y = transY;
    WidthLeft = rect1;
    WidthRight = rect3;
    HeightUp = rect2;
    HeightDown = rect4;
  }
  
  void update() {
       // Works best with one click in the bottom right corner of the button.
    if (mousePressed == true && mouseX >= Position.x && mouseX <= Position.x + WidthRight && mouseY >= Position.y && mouseY <= Position.y + HeightUp) {
        Clicked = true;
    }
    else if (mousePressed == true && mouseX >= Position.x && mouseX <= Position.x + WidthRight && mouseY >= Position.y && mouseY <= Position.y + HeightDown) {
        Clicked = true;
    }
    else if (mousePressed == true && mouseX >= Position.x && mouseX <= Position.x + WidthLeft && mouseY >= Position.y && mouseY <= Position.y + HeightUp) {
        Clicked = true;
    }
    else if (mousePressed == true && mouseX >= Position.x && mouseX <= Position.x + WidthLeft && mouseY >= Position.y && mouseY <= Position.y + HeightDown) {
        Clicked = true;
    }
    else if (mousePressed == true && mouseX >= Position.x && mouseX <= Position.x + WidthRight && mouseY <= Position.y && mouseY >= Position.y - HeightDown) {
        Clicked = true;
    }
    else if (mousePressed == true && mouseX <= Position.x && mouseX >= Position.x + WidthLeft && mouseY <= Position.y && mouseY >= Position.y - HeightDown){
      Clicked = true;
    }
    else if (mousePressed == true && mouseX <= Position.x && mouseX >= Position.x + WidthLeft && mouseY >= Position.y && mouseY <= Position.y + HeightDown){
      Clicked = true;
    }
  }
  
  void renderWithText() {
    fill(Fill);
    strokeWeight(StrokeWeight);
    stroke(Stroke);
    pushMatrix();
    translate(TransX, TransY);
    rotate(Rotate);
    rectMode(CORNERS);
    //the fifth paramater rounds the corners of the button
    rect(Rect1, Rect2, Rect3, Rect4, 7);
    popMatrix();
    
    fill(000000);
    textAlign(CENTER, CENTER);
    textSize(TextSize);
    text(ButtonText, TextX, TextY);
    
  }
  
  void renderWithoutText() {
    if (Selected) {
      fill(SelectedFill);
    }
    else {
      fill(Fill);
    }
    strokeWeight(StrokeWeight);
    stroke(Stroke);
    pushMatrix();
    translate(TransX, TransY);
    rotate(Rotate);
    rectMode(CORNERS);
    //the fifth paramater rounds the corners of the button
    rect(Rect1, Rect2, Rect3, Rect4, 7);
    popMatrix();   
  }
  
  void selectWithoutText() {
    fill(SelectedFill);
    strokeWeight(StrokeWeight);
    stroke(Stroke);
    pushMatrix();
    translate(TransX, TransY);
    rotate(Rotate);
    rectMode(CORNERS);
    //the fifth paramater rounds the corners of the button
    rect(Rect1, Rect2, Rect3, Rect4, 7);
    popMatrix();
  }
  
  void pressed() {
    if (((mouseX >= TransX && mouseX <= TransX + Rect3) || (mouseX >= TransX - Rect3 && mouseX <= TransX))  && ((mouseY >= TransY && mouseY <= TransY + Rect4) || (mouseY >= TransY - Rect4 && mouseY <= TransY))){
      Selected = !Selected;
      Clicked = !Clicked;
    }
  }
  
  boolean isClicked() {
    return Clicked;
  }
  
  boolean getSelected() {
    return Selected;
  }
  
  void setSelected(boolean s){
    Selected = s;
  }
}
