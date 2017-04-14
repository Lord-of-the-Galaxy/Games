

final static float S = 40;//size of tile/space
final static float XOFF = 15, YOFF = 15, P_XOFF = 680, P_YOFF = 30, P_W = 400, P_H = 80, P_H_A = 150;

//change these colors at your discretion
public static final color PEACH = #F7CE91;
public static final color GREEN = #00FF00;
public static final color DARK_GREEN = #035A02;
public static final color LIGHT_GREEN = #A1FFA0;
public static final color DEFAULT = #23FF86;
public static final color DARK_BLUE = #0000FF;
public static final color LIGHT_BLUE = #46E8DE;
public static final color ORANGE = #FFC081;
public static final color DARK_ORANGE = #EFA071;
public static final color RED = #FF0000;

HashMap<Character, Integer> values = new HashMap<Character, Integer>();

ArrayList<Letter> letters = new ArrayList<Letter>();
ArrayList<Letter> pile = new ArrayList<Letter>();

Cell[][] grid = new Cell[15][15];//harcoded becuse we're using official scrabble pattern of double/triple words/letters

Player[] players = new Player[4];//this could also be improved upon

int activePlayer = 0;

void setup() {
  size(1280, 720);
  initLetters();
  initGrid();

  //add players
  for (int i = 0; i < 4; i++) {
    players[i] = new Player(i); 
    players[i].drawLetters();
  }

  //Simply, I don't know if it's even required
  smooth();
}

void draw() {
  background(0);

  //first draw the grid
  for (int i = 0; i < 15; i++) {
    for (int j = 0; j < 15; j++) {
      grid[i][j].draw();
    }
  }

  //next the players
  for (int i = 0; i < players.length; i++) {
    players[i].draw();
  }


  //letters are drawn last
  for (int i = 0; i < letters.size(); letters.get(i++).draw());
}

void mousePressed() {
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