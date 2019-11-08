Ellipse[] ellipses;

void setup() {
  //size(500, 500);
  fullScreen();
  ellipses = new Ellipse[100];
  for(int i=0; i<ellipses.length; i++){
    ellipses[i] = new Ellipse();
  }
}

void draw() {
  background(0); 
  for(Ellipse i: ellipses){
    i.display();
  }
}
