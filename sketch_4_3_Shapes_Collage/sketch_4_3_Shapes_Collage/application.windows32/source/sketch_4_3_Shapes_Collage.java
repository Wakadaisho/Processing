import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_4_3_Shapes_Collage extends PApplet {



public void setup(){
  
  background(0);
  frameRate(10);
}

public void draw(){
  int guess = (int)random(3);
  float x = random(width);
  float y = random(height);
  
  stroke(color(random(255),random(255),random(255)),random(255));
  fill(color(random(255),random(255),random(255)),random(255));
  
  switch(guess){
    case 0:
      triangle(x,y,x+random(-500,500),y+random(-500,500),x+random(-500,500),y+random(-500,500));
      break;
    case 1:
      ellipse(x,y,random(500),random(500));
      break;
    case 2:
      rect(x,y,random(500),random(500));
      break;
    default:
      break;
      
  }
  
}

public void keyPressed(){
  if (keyCode == ESC){
    exit();
  }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_4_3_Shapes_Collage" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
