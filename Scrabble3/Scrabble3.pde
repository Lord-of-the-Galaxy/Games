
// main tab 

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

// program states
final int startScreen = 0; // constants must be unique numbers 
final int options     = 1; 
final int normalGame  = 2; 
final int gameOver    = 3; 
int state = startScreen;   // current 

HashMap<Character, Integer> values = new HashMap<Character, Integer>();

ArrayList<Letter> letters = new ArrayList<Letter>();
ArrayList<Letter> pile = new ArrayList<Letter>();

Cell[][] grid = new Cell[15][15];//harcoded becuse we're using official scrabble pattern of double/triple words/letters

Player[] players;
int activePlayer = 0;

// ---------------------------------------------------------------

void setup() {

  size(1280, 720);

  initLetters();
  initGrid();

  initWelcomeScreen(); 

  background(0);
}

void draw() {
  switch(state) {

  case startScreen:
    // start screen
    showWelcomeScreen();
    break; 

  case options: 
    // enter names 
    showOptions(); 
    break;

  case normalGame:
    // Game 
    normalGame();
    break; 

  case gameOver:
    // display message
    showGameOver(); 
    break;   

  default:
    // error
    println ("Error 974: unknown state "+state+". +++++++++++++++++++++++++"); 
    exit(); 
    break;
  } // switch 
  //
}//func
//