class Food {
  PVector position;
  PVector velocity;
  color c, last;
  //int timesEaten;
  PShape food;
  float radius;
  
  int alpha = 255;
  int d_alpha = -50;
  float maxVelocity = 3;
  
  //PVector foodValue;
   
  Food() {
    position = new PVector(random(radius*2, width-radius*2), random(radius*2, height-radius*2));    
    velocity = new PVector(random(-maxVelocity, maxVelocity), random(-maxVelocity, maxVelocity));
    //this.foodValue = foodValue.copy();
    last = color(255);
    radius = 20;            
  }

  void display() {    
    food = createShape(ELLIPSE, position.x, position.y, radius, radius);
    
    //timesEaten%=3;
    
    alpha+=d_alpha;
    
    if(alpha<=0 || alpha>=255){
      d_alpha *= -1;
    }
    
    c = color(random(256),random(256),random(256));
    while(abs(red(c)-green(c))<10 || abs(red(c)-blue(c))<10 || abs(blue(c)-green(c))<10){
      c = color(random(256),random(256),random(256));  
    }
    last = color(red(last), green(last), blue(last), alpha);    
    food.setFill(last);            
    food.setStroke(c);    
    shape(food);
  }
  
   void move() {   
    position.add(velocity);          
    if (position.x+radius/1.95>width || position.x-radius/1.95<0) {
      velocity.x *= -1;
    } else {}

    if (position.y+radius/1.95>height || position.y-radius/1.95<0) {
      velocity.y *= -1;
    } else {}
  }

  boolean checkCollision(Collider other) {
    PVector dist = PVector.sub(other.position, this.position);
    float distance = dist.mag();
    
    if (distance <= (this.radius)) {
      fill(last);
      ellipse(position.x, position.y, radius*4, radius*4);
      position.x =random(radius*2, width-radius*2);
      position.y = random(radius*2, height-radius*2);
      
      //if(timesEaten==0){
      //  num = foodValue.x;
      //}else if(timesEaten==1){
      //  num = foodValue.y;
      //}else {
      //  num = foodValue.z;
      //}
 
      last = color(red(c), green(c), blue(c), alpha);
      other.collided(last);
      
      fill(last);
      ellipse(position.x, position.y, radius*4, radius*4);
      //++timesEaten;         
      //timesEaten%=3;
      
      return true;
    } else {
      return false;
    }
  }
}
