

void setup(){
  fullScreen();
  background(0);
  frameRate(10);
  smooth();
}

void draw(){
  int guess = (int)random(3);
  float x = random(width);
  float y = random(height);
  
  stroke(color(random(255),random(255),random(255)),random(255));
  fill(color(random(255),random(255),random(255)),random(255));
  
  switch(guess){
    case 0:
      triangle(x,y,x+random(-500,500),y+random(-500,500),x+random(-500,500),y+random(-500,500));
      break;
    case 1:
      ellipse(x,y,random(500),random(500));
      break;
    case 2:
      rect(x,y,random(500),random(500));
      break;
    default:
      break;
      
  }
  
}

void keyPressed(){
  if (keyCode == ESC){
    exit();
  }
}
