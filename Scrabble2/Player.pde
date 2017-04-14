class Player {

  Letter[] set;
  Button ok, finish, revert;

  int index;

  //We could try adding names, but I leave that to you. Thanks!
  Player(int i) {
    index = i;
    set = new Letter[8];
  }

  void draw() {
    if (activePlayer != index) {
      pushStyle();
      fill(LIGHT_GREEN);//whatever came to my mind :) Please change if you gat a better idea
      stroke(DARK_GREEN);
      strokeWeight(2);
      float y = index*P_H + P_YOFF;
      if(activePlayer < index)y += P_H_A-P_H;
      rect(P_XOFF, y, P_W, P_H, 6);
      popStyle();
    }else{
      pushStyle();
      fill(LIGHT_GREEN);//whatever came to my mind :) Please change if you gat a better idea
      stroke(DARK_GREEN);
      strokeWeight(2);
      float y = index*P_H + P_YOFF;
      rect(P_XOFF, y, P_W, P_H_A, 6);
      popStyle();
    }
  }
  
  void drawLetters(){
    int x = (int)P_XOFF + 40;//stupid, I know
    int y = (int)(P_YOFF + this.index*P_H + (activePlayer<index?P_H_A-P_H:0) + P_H/2);
    for(int i = 0; i < 8; i++){
      int r = (int)random(pile.size());
      set[i] = pile.get(r);
      pile.remove(r);
      set[i].show(x + (int)(S+2)*i, y);
      set[i].player(this, i);
      if(activePlayer == index)set[i].active(true);
    }
  }
}