abstract class Button {

  float x, y, w, h;
  String text;
  boolean visible = false;//i have my reasons

  Button(float x_, float y_, float w_, float h_, String t) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    text = t;
  }


  void draw() {
    pushStyle();
    fill(LIGHT_BLUE);//whatever came to my mind :) Please change if you gat a better idea
    stroke(DARK_BLUE);
    rect(x, y, w, h, 4);
    fill(0);
    textSize(h * 0.8);
    text(text, x + w/2 - textWidth(text), y + 0.9*h);
    popStyle();
  }

  void setVisible(boolean b) {
    visible = b;
  }

  void mousePressed() {
    if (visible &&  
      mouseX > x && mouseX < (x + w) &&
      mouseY > y && mouseY < (y + h)) {
        pressed();
    }
  }
  
  abstract void pressed();
}