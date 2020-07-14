class Tooltip {
    String instructions;
    String alignment; // TODO: Allow choice of side for triangle placement
    float x;
    float y;
    float w;
    float h;
    
    Tooltip(String ins, String align, int x1,int y1,int w1, int h1) {
      instructions = ins;
      alignment = align;
      x = x1;
      y = y1;
      w = w1;
      h = h1;
    }

    void drawTooltip() {
      fill(255);  
      stroke(255);
      rectMode(CORNER);
      rect(x,y,w,h,4);
      if (alignment.equals("T"))
      triangle(x+(w/2), y,x+(w/2) +10, y-10,x+(w/2) +20, y);
      else if(alignment.equals("R"))
        triangle(x+w, y + (h/2)-5,x+w+10,y + (h/2),x+w,y + (h/2)+5);
        
        PFont font;
        font = createFont("Arial",h);
        textFont(font, h);

        float textSize = h;
        while (textWidth(instructions) > w - 10 && textSize >1) {
            textSize -= 1;
            textSize(textSize);
        }
        fill(0);
        text(instructions, x + ((w-10)/2), y + (h/2));
    }
}
