PImage img, imgOut;
color remove = color(255, 255, 255);

void setup(){
  //background(0);
  img = loadImage("youtube_PNG.png");  
  size(800, 600);
  imgOut = createImage(img.pixelWidth, img.pixelHeight, ARGB);
  img.loadPixels();
  imgOut.loadPixels();
  color temp;
  for(int y=0; y<img.pixelHeight; y++){
    for(int x=0; x<img.pixelWidth; x++){
      temp = img.pixels[y*img.pixelWidth+x];
      //if(temp==remove){
      //  imgOut.pixels[y*height+x] = color(0, 0, 0, 255);     
      //}else{
      //  imgOut.pixels[y*height+x] = temp;        
      //}
      if(temp==color(0,0,0)) {
        imgOut.pixels[y*img.pixelWidth+x] = color(0, 0, 0, 255);        
      }else{
        imgOut.pixels[y*img.pixelWidth+x] = color(0, 0, 0, 0);        
      }
    }
  }
  imgOut.updatePixels();
}

void draw(){
  imgOut.save("!youtube_PNG.png");
  println("Image saved!");
  exit();
}
