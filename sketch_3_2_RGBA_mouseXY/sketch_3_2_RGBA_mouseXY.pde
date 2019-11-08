int step = 20;
float weight = 2;
int rgb = 0;
int rgb2 = 0;
color backColor = color(0,0);
color backColor2 = color(255);

void setup(){
  fullScreen();
}

void draw(){
  float mousePosition = scaleValue(mouseX,width);
  backColor = color((rgb & 4)/4 * mousePosition, (rgb & 2)/2 * mousePosition,(rgb & 1) * mousePosition);
  
  backColor2 = color((rgb2 & 4)/4 * 255, (rgb2 & 2)/2 * 255,(rgb2 & 1) * 255);
  
  fill(backColor2);
  rect(0,0,width,height);
  
  noStroke();
  if(rgb==0)
    noFill();
  else
    fill(backColor, scaleValue(mouseY,height));
  rect(0,0,width,height);
}

float scaleValue(float val, float max){
  return val*255/max;
}

void keyPressed(){
  calculateRGBs(keyCode);
}

void calculateRGBs(int keyValue){
  switch(keyValue){
    case 'R':
      if((rgb & 4) != 0){
        rgb-=4;  
      }else{
        rgb+=4;
      }
      break;
     case 'G':
      if((rgb & 2) != 0){
        rgb-=2;  
      }else{
        rgb+=2;
      }
      break;
     case 'B':
      if((rgb & 1) != 0){
        rgb-=1;  
      }else{
        rgb+=1;
      }
      break;
     case 'I':
      if((rgb2 & 4) != 0){
        rgb2-=4;  
      }else{
        rgb2+=4;
      }
      break;
     case 'J':
      if((rgb2 & 2) != 0){
        rgb2-=2;  
      }else{
        rgb2+=2;
      }
      break;
     case 'K':
      if((rgb2 & 1) != 0){
        rgb2-=1;  
      }else{
        rgb2+=1;
      }
      break;
     case 'X':
         rgb=0;
         break;
     case 'Y':
         rgb2=0;
         break;
     default:
       break;
  }
}
