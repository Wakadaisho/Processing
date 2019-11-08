class X{
  float x;
  float y;
  float r;
  color c;
  PShape X;
  
  X(float x, float y, float r){
    this.x = x;
    this.y = y;
    this.r = r/2;
    this.c = color(0, 0, 255);
    //X(x, y, r, new color(0, 0, 255));
   
    //makeX();
  }

  X(float x, float y, float r, color c){
    this.x = x;
    this.y = y;
    this.r = r/2;
    this.c = c;
   
    //makeX();
  }
  
  void makeX(){
    X = createShape(GROUP);
    PShape diagonal_1, diagonal_2;
    diagonal_1 = createShape(LINE, x-r, y-r, x+r, y+r);
    diagonal_2 = createShape(LINE, x-r, y+r, x+r, y-r);
    diagonal_1.setStroke(c);
    diagonal_2.setStroke(c);
    X.addChild(diagonal_1);
    X.addChild(diagonal_2);
    //pushMatrix();
    //translate(x, y);
    //rotate(QUARTER_PI);
    shape(X);
    //popMatrix();
  }
  
   void display(){
    makeX();    
  }
  
  void setColor(color c){
    this.c = c;
  }
  
}
