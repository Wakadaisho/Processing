int colWidth;
color pencilColor;
boolean drawing;

void setup(){
  background(255);
  size(800, 600);
  
  colWidth = 100;  
  pencilColor = color(255);
  drawing = false;

  drawCanvas();
}

void draw(){  
  if(drawing){
    if(mouseX < width - colWidth && pmouseX < width - colWidth){
      stroke(pencilColor);
      line(pmouseX, pmouseY, mouseX, mouseY);
    } 
  }
  //drawCanvas();
}

void keyPressed(){
  switch(keyCode){
    case 'R':
      background(255);
      drawCanvas();
      break;
    case 'X':
      drawing = false;
      break;
    case 'D':
      drawing = true;
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
      strokeWeight(int(keyCode));
      break;
    case '0':
      strokeWeight(10);
      break;
      
  }
}

void drawCanvas(){
  loadPixels();  
  int loc;
  color rand;
  
  for(int i=0; i<height; i+=4){
      
    rand = color(random(256), random(256), random(256));
    
    for(int j=width-colWidth; j<width; j++){        
        pixels[i*width+j] = rand;
        if(i+1<width)
          pixels[(i+1)*width+j] = rand;
        if(i+2<width)
          pixels[(i+2)*width+j] = rand;
        if(i+3<width)
          pixels[(i+3)*width+j] = rand;
    }
    
  }
  updatePixels();
}

void mousePressed(){
  if(mouseX>width-colWidth){
   pushStyle();
   pencilColor = get(mouseX, mouseY);
   fill(pencilColor);
   rect(0, height-30, 30, 30);
   popStyle();
 }else{
   drawing = !drawing;
  }
}
