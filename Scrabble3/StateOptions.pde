
// tab for state show Options

TextBox[] tboxes;
int idx; // index for current tbox

Button[] buttonsOptionsScreen = new Button[1];   

void instantiateBoxes() {

  tboxes = new TextBox[players.length]; 

  for (int i = 0; i < players.length; i++) {

    tboxes[i] = new TextBox(
      "Player "+str(i+1) + ", please enter your name: ", 
      330 + i * 66, i*129+264, // x, y
      300, 33, // w, h
      215, // lim
      0300 << 030, color(-1, 040), // textC, baseC
      color(-1, 0100), color(#FF00FF, 0200), // bordC, slctC 
      players[i].name);
  }
}

void defineButtons() {  
  // define 
  buttonsOptionsScreen[0] = new Button(width-150, height-240, 144, 30, "Done") {
    public void pressed() {
      //what to do when button is pressed
      for (int i = 0; i < players.length; i++) {
        players[i].name=tboxes[i].txt;
      }//for
      state=normalGame;
    }//func
  }; // new
} // func 

void showOptions() {

  background(0);

  fill(RED);
  text ( "Options ", width/2, 29 );

  for (int i = 0; i < players.length; i++) {
    tboxes[i].display();
  }

  // display 
  for (Button currentBtn : buttonsOptionsScreen) {
    currentBtn.visible=true; 
    currentBtn.draw();
  }
}
//