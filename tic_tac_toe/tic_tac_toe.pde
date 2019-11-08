/*
 *Program: 2 player Tic-tac-toe
 *Author: Paul Wahome
 *Github: http://github.com/wakadaisho
 */

boolean xTurn = true; //alternates turns (Game 1 - X, Game 2 - O, Game 3 - X, ...) 
boolean gameOver = false;
int xWins = 0, oWins = 0;
float A, B, C, D;     //grid boundary markers
float d_x, d_y;       //difference between centers of grids of the x and y planes
float radius;         //size of pieces(X,O)
int board[];     
Object pieces[];
int count;

X xRank;
O oRank;

int xVal = 1;
int oVal = 2;
float fraction_size = 0.5;


float backgroundRadius;
float backgroundSpacing;
float displacement;
O[] backgroundOs;
X[] backgroundXs;
int backgroundOsNum = 10;
int backgroundXsNum = 10;

void setup() {
  smooth();
  background(255);
  ellipseMode(CENTER);  //all ellipses(O) drawn from center
  noFill();            
  size(600, 600); 
  textAlign(CENTER);
  textSize(width/10);
  //fullScreen();
  strokeWeight(width/45);      //increase stroke weight for visibility
  board = new int[9];
  pieces = new Object[9];
  
  backgroundOs = new O[backgroundOsNum*backgroundXsNum/2];
  backgroundXs = new X[backgroundOsNum*backgroundXsNum/2];
  
  displacement = 0;
  count = 0;
  
  A = height/3;
  B = A*2;
  C = width/3;
  D = C*2;

  d_x = .5*C;
  d_y = .5*A;

  radius = ((A < C) ? A : C)*fraction_size;

  xRank = new X(C, A, radius);  
  oRank = new O(C, B, radius);
  
  backgroundRadius = radius*fraction_size;
  backgroundSpacing = width/4;
  
  drawGrid();
  
  for(int i = 0; i<backgroundOsNum; i++){
    for(int j = 0; j<backgroundXsNum; j++){
      if((i*j+j)%2==0){
        //backgroundOs[((i*j)+j)/2] = 
        new O((i+1)*backgroundSpacing+displacement, (j+1)*backgroundSpacing+displacement, backgroundRadius, color(255, 0, 0, 20)).display();
      }else{
        //backgroundXs[((i*j)+j)/2] = 
        new X((i+1)*backgroundSpacing+displacement, (j+1)*backgroundSpacing+displacement, backgroundRadius, color(0, 0, 255, 20)).display();        
      }
    }  
  }
  
}

void draw() {
  println(count);
  drawGrid();
  if (gameOver) {
    delay(1000);
    background(255);
    displayRankings();
  }
}

void mousePressed() {
  if (!gameOver) {
    drawByClick(mouseX, mouseY);    
    checkWin();
  } else {
    resetGame();
  }
}

void keyPressed() {
  switch(keyCode) {
  case 32:      //SPACEBAR
    if (!gameOver) {
      break;
    }
  case 82:  //Reset - R
    resetGame();
    break;

  default:    
    if (!gameOver) {
      if (keyCode>48 && keyCode <58) {
        drawByKey(keyCode-49);
      }
      if (keyCode>96 && keyCode <106) {
        drawByKey(numpadConvert(keyCode));
      }
      
      checkWin();
    }

    break;
  }
}

int numpadConvert(int keyValue) {
  int val = 0;
  switch (keyValue) {
  case 97:
    val = 6;
    break;
  case 98:
    val = 7;
    break;
  case 99:
    val = 8;
    break;
  case 100:
    val = 3;
    break;
  case 101:
    val = 4;
    break;
  case 102:
    val = 5;
    break;
  case 103:
    val = 0;
    break;
  case 104:
    val = 1;
    break;
  case 105:
    val = 2;
    break;
  }

  return val;
}


void resetGame() {
  for (int i = 0; i<board.length; i++) {
    board[i] = 0;
    pieces[i] = null;
  }
  background(255);
  gameOver = false;
  drawGrid();
}

void drawByClick(float x, float y) {
  PVector pos = new PVector();

  int index = calculateValues(x, y, pos);

  if (board[index]==0) {
    if (xTurn) {
      board[index] = xVal;
      pieces[index] = new X(pos.x, pos.y, radius);
      X temp = (X) pieces[index];
      temp.display();
    } else {
      board[index] = oVal;
      pieces[index] = new O(pos.x, pos.y, radius);
      O temp = (O) pieces[index];
      temp.display();
    }    
    xTurn = !xTurn;
  }

  drawGrid();
}

void drawByKey(int index) {
  PVector pos = getPosByIndex(index);

  if (board[index]==0) {
    if (xTurn) {
      board[index] = xVal;
      pieces[index] = new X(pos.x, pos.y, radius);
    } else {
      board[index] = oVal;
      pieces[index] = new O(pos.x, pos.y, radius);
    }
    xTurn = !xTurn;
  }

  drawGrid();
}

int calculateValues(float x, float y, PVector pos) {
  int index;

  if (x < C) {
    index = 0;
    pos.x = d_x;
  } else if (x < D) {
    index = 1;
    pos.x = C + d_x;
  } else {
    index = 2;
    pos.x = D + d_x;
  }

  if (y<A) {
    pos.y = d_y;
  } else if (y < B) {
    index +=3;
    pos.y = A + d_y;
  } else {
    index +=6;
    pos.y = B + d_y;
  }

  return index;
}

void drawGrid() {
  drawBackground();
  stroke(0);
  line(C, 0, C, height);
  line(D, 0, D, height);
  line(0, A, width, A);
  line(0, B, width, B);

  PVector pos;

  for (int i=0; i<board.length; i++) {
    if (board[i]!=0) {
      fill(127, 127, 127, 0);
    } else {      
      fill(127, 127, 127, 50);
    }
    pos = getPosByIndex(i);
    text(i+1, pos.x, pos.y);
    noFill();
  }
  for (int i=0; i<pieces.length; i++) {
    if (board[i]!=0) {
      if (pieces[i].getClass().getName()=="tic_tac_toe$O") {
        O temp = (O) pieces[i];
        temp.display();
      } else {
        X temp = (X) pieces[i];
        temp.display();
      }
    }
  }
}

void checkWin() {
  if (board[0]==board[1]&&board[1]==board[2]) {
    presentWinner(0, 1, 2);
  }
  if (board[3]==board[4]&&board[4]==board[5]) {
    presentWinner(3, 4, 5);
  }
  if (board[6]==board[7]&&board[7]==board[8]) {
    presentWinner(6, 7, 8);
  }
  if (board[0]==board[3]&&board[3]==board[6]) {
    presentWinner(0, 3, 6);
  }
  if (board[1]==board[4]&&board[4]==board[7]) {
    presentWinner(1, 4, 7);
  }
  if (board[2]==board[5]&&board[5]==board[8]) {
    presentWinner(2, 5, 8);
  }
  if (board[0]==board[4]&&board[4]==board[8]) {
    presentWinner(0, 4, 8);
  }
  if (board[2]==board[4]&&board[4]==board[6]) {
    presentWinner(2, 4, 6);
  }

  if (gameOver) {
    return;
  }

  for (int i=0; i<board.length; i++) {
    if (board[i]==0) {    //continues game if any single grid is still empty
      return;
    }
  }
  gameOver=true;
}

void presentWinner(int a, int b, int c) {
  PVector posA = getPosByIndex(a);
  PVector posB = getPosByIndex(b);
  PVector posC = getPosByIndex(c);
  color winnerColor = color(0, 255, 0); 


  float xLineBuffer = 0, yLineBuffer = 0;

  if ((b-a)==1 || (b-a)%2==0) {
    xLineBuffer = d_x*.8;
  }
  if ((b-a)==3 || (b-a)%2==0) {
    yLineBuffer = d_y*.8;
  }


  if (xTurn) {        //means O played last, checking if O won
    if (board[a]==oVal) {
      new O(posA.x, posA.y, radius, winnerColor).display();
      new O(posB.x, posB.y, radius, winnerColor).display();
      new O(posC.x, posC.y, radius, winnerColor).display();
      //stroke(color(0, 200, 0));
      strokeWeight(width/90);
      if ((b-a)==2) {
        line(posA.x+xLineBuffer, posA.y-yLineBuffer, posC.x - xLineBuffer, posC.y + yLineBuffer);
      } else {
        line(posA.x-xLineBuffer, posA.y-yLineBuffer, posC.x + xLineBuffer, posC.y + yLineBuffer);
      }
      strokeWeight(width/45);
      oWins++;
      gameOver = true;
    }
  } else {
    if (board[a]==xVal) {
      new X(posA.x, posA.y, radius, winnerColor).display();
      new X(posB.x, posB.y, radius, winnerColor).display();
      new X(posC.x, posC.y, radius, winnerColor).display();
      //stroke(color(0, 200, 0));
      strokeWeight(width/80);
      if ((b-a)==2) {
        line(posA.x+xLineBuffer, posA.y-yLineBuffer, posC.x - xLineBuffer, posC.y + yLineBuffer);
      } else {
        line(posA.x-xLineBuffer, posA.y-yLineBuffer, posC.x + xLineBuffer, posC.y + yLineBuffer);
      }
      strokeWeight(width/45);
      xWins++;
      gameOver = true;
    }
  }

  return;
}

PVector getPosByIndex(int index) {
  PVector pos = new PVector();
  if (index == 0) {
    pos.x = d_x;
    pos.y = d_y;
  } else if (index == 1) {
    pos.x = C + d_x;
    pos.y = d_y;
  } else if (index == 2) {
    pos.x = D + d_x;
    pos.y = d_y;
  } else if (index == 3) {
    pos.x = d_x;
    pos.y = A+d_y;
  } else if (index == 4) {
    pos.x = C + d_x;
    pos.y = A+d_y;
  } else if (index == 5) {
    pos.x = D + d_x;
    pos.y = A+d_y;
  } else if (index == 6) {
    pos.x = d_x;
    pos.y = B + d_y;
  } else if (index == 7) {
    pos.x = C + d_x;
    pos.y = B + d_y;
  } else if (index == 8) {
    pos.x = D + d_x;
    pos.y = B + d_y;
  } else {
  }

  return pos;
}

void displayRankings() {  
  noFill();    
  textAlign(BOTTOM);
  if (oWins>xWins) {
    new X(C, B, radius).display();  
    new O(C, A, radius).display();
  } else {
    new X(C, A, radius).display();  
    new O(C, B, radius).display();
  }

  if (oWins>xWins) {
    fill(0, 0, 255);
    text(xWins, D, B*1.05);

    fill(255, 0, 0);
    text(oWins, D, A*1.05);
  } else {      
    fill(0, 0, 255);
    text(xWins, D, A*1.05);

    fill(255, 0, 0);
    text(oWins, D, B*1.05);
  }

  textAlign(CENTER);
}

void drawBackground(){
  pushStyle();
  fill(127);
  rect(0, 0, width, height);
  popStyle();
  background(160.0, 253.0, 138.0);
   for(int i = 0; i<backgroundOs.length; i++){
    for(int j = 0; j<backgroundXs.length; j++){
      if(((i*j)+j)%2==0){
        new O((i+1)*backgroundSpacing+displacement, (j+1)*backgroundSpacing+displacement, backgroundRadius, color(255, 0, 0, 50)).display();
      }else{
        new X((i+1)*backgroundSpacing+displacement, (j+1)*backgroundSpacing+displacement, backgroundRadius, color(0, 0, 255, 50)).display();
      }
    }  
  }
   displacement += backgroundSpacing/100;
  
}
