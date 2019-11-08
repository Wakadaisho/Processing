Walker[][] walk;
boolean auto = false;
boolean red = true, green = true, blue = true;
void setup() {
  size(300, 300);  
  
  background(255);
  walk = new Walker[width*3][3];
  for (int i=0; i<walk.length; i++) {
    for (int j=0; j<3; j++) {
      if (j==0)
        walk[i][j] = new Walker(color(255, 0, 0));
      else if (j==1)
        walk[i][j] = new Walker(color(0, 255, 0));
      else  
        walk[i][j] = new Walker(color(0, 0, 255));
    }
  }
}
void draw() {
  if (auto || mousePressed) {
    for (int i=0; i<walk.length; i++) {
      if(red)
        walk[i][0].display();
      if(green)
        walk[i][1].display();
      if(blue)
        walk[i][2].display();
    }
  }
}

void keyPressed() {
  switch(keyCode) {
  case 'A':
    auto = !auto;
    break;
  case 'R':
    red = !red;
    break;
  case 'G':
    green = !green;
    break;
  case 'B':
    blue = !blue;
    break;
  }
}
