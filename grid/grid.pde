int X = 5;
int Y = 5;
int xStep;
int yStep;

boolean xPress = false;
boolean yPress = false;

void setup(){
  size(800, 600);  
}

void draw(){
  background(255);
  
  if(Y<1){
    Y=1;
  }
  if(X<1){
    X=1;
  }
  
  xStep = width/X;
  yStep = height/Y;
  
  for(int i=1; i<X; ++i){
    line(i*xStep, 0, i*xStep, height);
  }
  
  for(int i=1; i<Y; ++i){
    line(0, i*yStep, width, i*yStep);
  } 
}

void keyPressed(){
  switch(keyCode){
    case UP:
      ++Y;
      break;
    case DOWN:
      --Y;
      break;
    case RIGHT:
      ++X;
      break;
    case LEFT:
      --X;
      break;
    case 'X':
      xPress = true;
      break;
    case 'Y':
      yPress = true;
      break;
    case '1':
    case '2':
    case '3':
    case '4':
    case '5':
    case '6':
    case '7':
    case '8':
    case '9':
      setCount(keyCode-48);
      break;
    case '0':
      setCount(10);
      break;
    default:
      break;
  }
}

void setCount(int num){
  if(xPress){
    X = num;
  }else if(yPress){
    Y = num;
  }else{}
  
  xPress = false;
  yPress = false;
}
  
