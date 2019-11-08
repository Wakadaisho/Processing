int horizontal, vertical, count;
int max;
int size;
boolean disco = false;

Bubble[] bubbles;

void setup() {
  //fullScreen();
  size(800, 600);
  noStroke();
  
  //Change values here
  int shapeObj = ELLIPSE;
  boolean ascend = true;
  int size = 20;
  //
   
  horizontal = width/size;
  vertical = height/size;
  count = horizontal * vertical;

  max = count;

  bubbles = new Bubble[max];
  
  ellipseMode(CORNER);
  rectMode(CORNER);
  background(0);

  for (int i=0; i<max; i++) {
    bubbles[i] = new Bubble(i, size, shapeObj, ascend);
  }
}

void draw() {
  if (disco) {
    bobRossAscend();
  }
  
}

void mousePressed() {
  disableEllipse(mouseX, mouseY);
}

void keyPressed() {
  if (keyCode == 'D') {
    if (count<max) {
      bubbles[count++].activate();
      
      bobRoss();
    }
  } 
  else if (keyCode == 'A') {    
    while(count-1>=0 && !bubbles[--count].isActive()){}
    bubbles[count].deactivate();    
    bobRoss();
    } 
    
  else if (keyCode == 'X') { 
    bobRoss();
    disco=false;
  } 
  else if (keyCode == 'Y') {
    disco=!disco;
  } 
  else if(keyCode == 'Q'){
    for(int i=0; i<max; i++){
      bubbles[i].deactivate();
    }
    bobRoss();
  }
  else if(keyCode == 'W'){
    for(int i=0; i<max; i++){
      bubbles[i].toggleActive();
    }
    bobRoss();
  }
  else if(keyCode == 'E'){
    for(int i=0; i<max; i++){
      bubbles[i].activate();
    }
    bobRoss();
  }
  else {
  }
}

void disableEllipse(float posX, float posY) {
  int x = (int)(posX/width*horizontal);
  int y = (int)(posY/height*vertical);

  int n = y*horizontal+x;

  bubbles[n].toggleActive();  
  bobRoss();
}

void bobRoss() {
  background(0);
  for (int i=0; i<count; i++) {
    bubbles[i].displayN();
  }
}

void bobRossAscend() {
  background(0);
  for (int i=0; i<count; i++) {
    bubbles[i].display();
  }
}
