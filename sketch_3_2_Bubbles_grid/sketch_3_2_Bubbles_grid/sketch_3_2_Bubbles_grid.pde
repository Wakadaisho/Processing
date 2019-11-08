Bubble[] bubbles;
int i;
int max = 100;
int drawSize;

void setup(){
  size(800,600);
  background(0);
  int x_size = width/max;
  int y_size = height/max;
  i = max;
  bubbles = new Bubble[i];
  drawSize = (y_size < x_size) ? y_size : x_size;
  for(int i=0;i<max;i+=drawSize){
    for(int j=0;j<max;j+=drawSize){
      bubbles[(i)+j] = new Bubble(drawSize,i,j);
    }
  }
}

void draw(){
  background(0);
  for(int i=0;i<bubbles.length;i++){
    bubbles[i].display();
    bubbles[i].ascend();
  }
}

void keyPressed(){
  if(keyCode=='X'){
    if(i!=0){
      bubbles[--i].pop();
    }
  }
  
  if(keyCode=='Y'){
    if(i<max)
      bubbles[i++] = new Bubble(random(50,64));
  }
}
