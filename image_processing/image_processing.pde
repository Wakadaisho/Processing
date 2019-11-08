PImage tori;

color col;

void setup() {
  tori = loadImage("tori.png");
  size(128, 128);
  
  col = color(127);
}


void draw() {
  background(200);
  loadPixels();
  tori.loadPixels();

  for (int y = 0; y<height; ++y) {
    for (int x = 0; x<width; ++x) {
      int loc = y*width+x;
      
      float r = red(tori.pixels[loc]);
      float g = green(tori.pixels[loc]);
      float b = blue(tori.pixels[loc]);
      
      if(alpha(tori.pixels[loc])==0){
        pixels[loc] = color(col);
        continue;
      }
      
        //if(r>100 || b>100){
        //    pixels[loc] = color(b, g, r);
        //    continue;
        //}
      
      pixels[loc] = tori.pixels[loc];
  }}

  updatePixels();
  
}

void mousePressed(){  
  col = get(mouseX, mouseY);
}

void mouseMoved(){
  int val = get(mouseX, mouseY);
  col = color(255-red(val), 255-green(val), 255-blue(val));
}
