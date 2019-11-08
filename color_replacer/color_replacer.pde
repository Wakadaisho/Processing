PImage tori;

color col;
String filename = "activity";
//-8728587

void setup() {
  tori = loadImage(filename + ".png");
  size(1000, 600);
  
  col = color(255);
  noLoop();
}


void draw() {
  background(200);
  image(tori, 0, 0);
  loadPixels();
  tori.loadPixels();

  for (int y = 0; y<tori.height; ++y) {
    for (int x = 0; x<tori.width; ++x) {
      int loc = y*tori.width+x;      
      float r = red(tori.pixels[loc]);
      float g = green(tori.pixels[loc]);
      float b = blue(tori.pixels[loc]);
      
      if(color(tori.pixels[loc])>=-8728587){
        tori.pixels[loc] = -1;
        //continue;
      }else{
        tori.pixels[loc] = 0;
      }
  }}

  tori.updatePixels();
  for (int y = 0; y<tori.height; ++y) {
    for (int x = 0; x<tori.width; ++x) {
      int loc = y*tori.width+x;     
      
      if(color(tori.pixels[loc])==-16777216){
        println(color(tori.pixels[loc]));
        tori.pixels[loc] = 0;
      }
  }}
  tori.updatePixels();
  image(tori, 0, 0);
  //tori.save(filename + "_out.png");
}

void mousePressed(){  
  col = get(mouseX, mouseY);  
  println(col);
  println(green(col));
  println(blue(col));
}

void mouseMoved(){
  int val = get(mouseX, mouseY);
  col = color(255-red(val), 255-green(val), 255-blue(val));
}
