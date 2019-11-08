class Bubble{
   float r;
   float x;
   float y;
   
   Bubble(float r){
     this.r = r;
     this.x = random(width);
     this.y = random(height);
   }
   
   Bubble(float r, float x, float y){
     this.r = r;
     this.x = x;
     this.y = y;
   }
   
   void display(){
     noFill();
     stroke(255);
     circle(x, y, r);
   }
   
   void ascend(){
     if(y<-r){
       y = height+r;
     }else{
       y-=1;
     }
   }
   
   void pop(){
     this.r = 0;
   }
}
