class Ellipse{
  float x;
  float y;
  float stepX;
  float stepY;
  float size;
  
  Ellipse(int size){
    x = random(width);
    y = random(height);
    stepX = random(-5,5);
    stepY = random(-5,5);
    this.size = size;
  }
  
  void step(){
    if(x<=0 || x>=width){
      stepX*=-1;
    }
    if(y<=0 || y>=height){
      stepY*=-1;
    }
    
    y+=stepY;
    x+=stepX;
  }
  
  void display(color c){
    noStroke();
    color temp = c;
    //c = color(255-red(c), 255-green(c), 255-blue(c));
    fill(c);
    ellipse(x, y, size, size);
   }
}
