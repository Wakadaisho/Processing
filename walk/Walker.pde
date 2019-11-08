class Walker{
  float x;
  float y;
  color c; 
  
  Walker(){
    x = width/2;
    y = height/2;
    c = color(random(256), random(256), random(256));    
  }
  
  Walker(float _x, float _y){
    x = random(width);
    y = random(height);
    c = color(random(256), random(256), random(256));
  }
  
  Walker(color _c){
    x = width/2;
    y = height/2;
    c = _c;
  }
  
  Walker(float _x, float _y, color _c){
    x = _x;
    y = _y;
    c = _c;
  }
  
  void display(){
    stroke(c);
    point(x, y);
    step();
  }
  
  void step(){
    if(x>width || x==0){
      x = 0;
    }
    if(y>height || y==0){
      y = 0;
    }
    float r = random(1);
    if (r < .9) { 
      
      if(x<mouseX){
        x++;
      }
      else{
        x--;
      }
      if(y<mouseY){
        y++;
      }
      else{
        y--;
      }
    } 
    else {
      x += random(-1, 1.5);
      y += random(-1, 1.5);
    }
    //x += random(-1, 1.5);
    //y += random(-1, 1.5);
  }
}
