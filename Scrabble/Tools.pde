
// minor tools 

void checkGameOver() {

  int conditionsCounter = 0; 

  if (allLettersPosition >= allLetters.length()) {
    conditionsCounter++;
  }

  if (isLetterStackEmpty(letterStack1)) {
    conditionsCounter++;
  }

  if (isLetterStackEmpty(letterStack2)) {
    conditionsCounter++;
  }

  if (conditionsCounter>=3) 
    state=gameOver;
}//func 

boolean isLetterStackEmpty (Cell[] letterStack) {
  // 
  for (int i=0; i<8; i++) {
    if (letterStack[i].exist) {
      return false;
    }
  }//for 
  // all were not existing: 
  return true;
}

void showLetterStacks() {

  // letters letterStack left 
  for (int i=0; i<8; i++) {
    letterStack1[i].display();
  }

  // letters letterStack right 
  for (int i=0; i<8; i++) {
    letterStack2[i].display();
  }

  // Lines letterStack
  showLinesAroundLetterStack( letterStack1, 0 ); // 0 says: letterStack Left 

  // Lines letterStack
  showLinesAroundLetterStack( letterStack2, 1 ); // 1 means: letterStack Right
}

void showMinorStuff() {

  // display quantity remaining letters in the Heap  (upper right corner)
  fill(255);
  text(allLetters.length() - allLettersPosition, width-66, 66);

  // display points players 
  fill(255);
  text("Player 1: " + pointsLeft, 1150, height-160); 
  text("Player 2: " + pointsRight, 1150, height-120);

  // display score tables 
  for (int i = 0; i<scoreTables.length; i++) {  
    scoreTables[i].display();
  }//for
}

void showLinesAroundLetterStack( Cell[] c, int leftLine   ) {

  // lines

  if ( whichPlayersMove == leftLine ) 
    stroke (GREEN); 
  else 
  stroke(BLACK); 

  strokeWeight(3); 
  line(
    c[0].xOriginal-3, 
    c[0].yOriginal-3, 
    c[7].xOriginal + c[7].diameter+3, 
    c[7].yOriginal-3); 

  line(
    c[0].xOriginal-3, 
    c[0].yOriginal + c[7].diameter+3, 
    c[7].xOriginal + c[7].diameter+3, 
    c[7].yOriginal + c[7].diameter+3); 

  //reset
  strokeWeight(1);
}

void draggingALetter() {

  // while dragging

  if (hold) {
    if ( whichPlayersMove == 0 ) {
      letterStack1[holding].x=mouseX;
      letterStack1[holding].y=mouseY;
    } else if ( whichPlayersMove == 1 ) {
      letterStack2[holding].x=mouseX;
      letterStack2[holding].y=mouseY;
    }

    if ( whichPlayersMove == 0 ) {
      placeLetterOnMainGridTest(letterStack1);
    }//if
    else if ( whichPlayersMove == 1 ) {
      placeLetterOnMainGridTest(letterStack2);
    }//else
  }// if hold
}
//