
// tab for Inputs 

void mousePressed() {
  // mouse 
  if (state==startScreen) {
    for (Button currentBtn : buttonsStartScreen)
      currentBtn.mousePressed();
    return;
  }//if

  if (state==options) {
    for (Button currentBtn : buttonsOptionsScreen)
      currentBtn.mousePressed();
    return;
  }//if

  for (int i = 0; i < letters.size(); letters.get(i++).mousePressed());
}

void mouseReleased() {
  for (int i = 0; i < letters.size(); letters.get(i++).mouseReleased());

  //for (int i = 0; i < 15; i++) {
  //  for (int j = 0; j < 15; j++) {
  //    if (grid[i][j].empty==false) {
  //      println(i + " " + j + " " + grid[i][j].cur);
  //    }
  //  }
  //}
}

void mouseClicked() {

  if (state!=options)
    return; 

  int i = idx = -1;
  while (++i != tboxes.length)
    if (tboxes[i].checkFocus())  
      idx = i;
}
// 