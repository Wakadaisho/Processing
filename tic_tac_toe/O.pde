class O {
  float x;
  float y;
  float r;
  color c;
  PShape o;
  
  O(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = color(255, 0, 0);
    shapeMode(CENTER);
    o = createShape(ELLIPSE, x, y, r, r);
    //display();
    //O(x, y, r, int(color(255, 0, 0)));
  }
  
  O(float x, float y, float r, color c) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
    shapeMode(CENTER);
    o = createShape(ELLIPSE, x, y, r, r);
    //display();
  }

  void display() {
    o.setStroke(c);
    shape(o);
  }

  void setColor(color c) {
    this.c = c;
  }
}
