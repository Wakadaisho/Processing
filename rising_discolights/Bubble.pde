class Bubble{
  float sizeX, sizeY;
  float posX, posY;
  boolean active;
  PShape shapeObj; 
  int shapeIndex;
  boolean ascend;
  
  Bubble(int n, int size){
    this(n, size, ELLIPSE, false);
  }
  
  Bubble(int n, int size, int shapeIndex){    
    this(n, size, shapeIndex, false);
  }
  
  Bubble(int n, int size, int shapeIndex, boolean ascend){
    this.posX = (n%(horizontal))*size;
    this.posY = (n/horizontal)*size;
    this.sizeX = size;
    this.sizeY = size;
    this.shapeIndex = shapeIndex;
    this.ascend = ascend;
    active = true;
    display();
  }
  
  void display(){    
    if(active){
      shapeObj = createShape(shapeIndex, posX, posY, sizeX, sizeY);
      shapeObj.setFill(color(random(256), random(256), random(256)));               
      shape(shapeObj);
      
      if(ascend)
        ascend();
      }
  }
  
  void displayN(){    
    if(active){
      shapeObj = createShape(shapeIndex, posX, posY, sizeX, sizeY);
      shapeObj.setFill(color(random(256), random(256), random(256)));               
      shape(shapeObj);
   }
  }
  void activate(){   
    active = true;
  }
  
  void deactivate(){
    active = false;
  }
  
  void ascend(){
     if(posY<-sizeY){
       posY = height+posY;
     }else{
       posY-=1;
     }
   }
  
  boolean isActive(){
    return active;
  }
  
  void toggleActive(){
    active = !active;
  }
}
