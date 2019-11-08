PImage img;
Ellipse el[];
int sensitivity = 2;

void setup(){
  img = loadImage("img.png");
  size(1280, 720);
  el = new Ellipse[2000];
  ellipseMode(CENTER);
  for(int i=0; i<el.length; i++){
    el[i] = new Ellipse(sensitivity);
  }
}

void draw(){
  //loadPixels();
  img.loadPixels();
  
  for(int i=0; i<el.length; i++){
      
      el[i].display(img.get(int(el[i].x),int(el[i].y)));
      el[i].step();
 
  }
  
  //updatePixels();
}
