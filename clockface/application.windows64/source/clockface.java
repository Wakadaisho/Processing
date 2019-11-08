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

public class clockface extends PApplet {

float clock_radius;
int body_color, stick_color, highlight_color, tick_color;
int startHour;
PFont font;

public void setup() {
    
  
  setStickColor();
  
  strokeCap(ROUND);
  ellipseMode(CENTER);  
  
  clock_radius = width/2;
  startHour = hour();
}

public void draw() {
  if(startHour!=hour()){
    setStickColor();
    startHour = hour();
  }
  drawClock();
}

public void keyPressed(){
  exit();
}

public void mousePressed(){
  exit();
}

public void setStickColor(){
  if((hour() > 17 || hour() < 6)){
    stick_color = 0xffFFFFFF;
    tick_color = 0xffFFFFFF;
    highlight_color = 0xff16FF00;
    body_color = 0xff000000;
    background(body_color);
  }
  else{
    stick_color = 0xff000000;
    tick_color = 0xff000000;
    highlight_color = 0xff16FF00;
    body_color = 0xffDDDDDD;
    background(body_color);
  }
}

//void mouseMoved(){
//  if(frameCount > 10)
//    exit();
//}

public void drawClock() {
  drawOuterCircle();
  drawTickPoints();
  highlightTick();

  //drawDisplayFrame();
  //displayDigitalTime();
  //flashColon();

  drawHourHand();
  drawMinuteHand();
  drawSecondHand();
  drawInnerCircle();
}

public void drawDigital() {
  drawOuterCircle();
  drawDisplayFrame();  
  displayDigitalTime();
  flashColon();
}

public void drawAnalog() {  
  drawOuterCircle();
  drawTickPoints();
  highlightTick();

  drawHourHand();
  drawMinuteHand();
  drawSecondHand();
  drawInnerCircle();
}

public void displayDigitalTime() {
  pushMatrix();

  font = createFont("LCD", clock_radius*.165f);
  textFont(font);
  textAlign(CORNER);
  translate(width/2-clock_radius*.255f, height/2+clock_radius*.2f+clock_radius*.075f);  
  String hr = "" + hour(), min = "" + minute(), sec = "" + second();

  if (PApplet.parseInt(hr)<10) {
    hr = "0" + hr;
  }
  if (PApplet.parseInt(min)<10) {
    min = "0" + min;
  }
  if (PApplet.parseInt(sec)<10) {
    sec = "0" + sec;
  }

  fill(highlight_color);

  text(hr, 0, 0);
  text(min, clock_radius*.185f, 0);
  text(sec, clock_radius*.365f, 0);
  popMatrix();
}

public void flashColon() {    
  pushMatrix();
  textSize(clock_radius*.3f);
  translate(width/2-clock_radius*.22f, height/2+clock_radius*.2f+clock_radius*.075f-clock_radius*.01f);

  if (second()%2==0) {
    fill(stick_color);
  } else {
    fill(highlight_color);
  }

  text(":", clock_radius*.115f, 0);
  text(":", clock_radius*.295f, 0);
  popMatrix();
}

public void drawDisplayFrame() {
  pushMatrix();

  rectMode(CENTER);    
  translate(width/2, height/2+clock_radius*.215f);
  noStroke();
  fill(0, 150);
  rect(0, 0, clock_radius*.55f, clock_radius*.15f);
  popMatrix();
}

public void drawOuterCircle() {
  //strokeWeight(10);
  noStroke();
  fill(body_color);
  //stroke(frame_color);

  ellipse(width/2, height/2, clock_radius, clock_radius);
}

public void drawInnerCircle() {
  noStroke();
  fill(stick_color);

  ellipse(width/2, height/2, clock_radius/20, clock_radius/20);
}

public void highlightTick() {
  float angle = PApplet.parseFloat(second())/60*360;
  float strokeMajor = width*.05f;
  float strokeMinor = width*.03f;
  float strokeMicro = width*.01f;
  float strokeSize;

  stroke(highlight_color);

  pushMatrix();

  translate(width/2, height/2);
  if (angle%90==0)
    strokeSize = strokeMajor;
  else if (angle%30==0)
    strokeSize = strokeMinor;
  else
    strokeSize = strokeMicro;

  strokeWeight(strokeSize/5);    

  rotate(radians(angle));
  translate(0, -clock_radius*.47f);    

  line(0, 0, 0, strokeSize); 

  popMatrix();
}

public void drawTickPoints() {
  float strokeMajor = width*.05f;
  float strokeMinor = width*.03f;
  float strokeMicro = width*.01f;
  float strokeSize;

  stroke(tick_color);

  pushMatrix();

  translate(width/2, height/2);
  for (int i=6; i<=360; i+=6) {    
    if (i%90==0)
      strokeSize = strokeMajor;
    else if (i%30==0)
      strokeSize = strokeMinor;
    else
      strokeSize = strokeMicro;

    strokeWeight(strokeSize/5);    

    rotate(radians(6));
    pushMatrix();

    translate(0, -clock_radius*.47f);        
    line(0, 0, 0, strokeSize); 

    popMatrix();
  }

  popMatrix();
}

public void drawSecondHand() {  
  float angle = (PApplet.parseFloat(second())/60)*360;  
  strokeWeight(2);
  stroke(255, 0, 0);
  pushMatrix();  
  translate(width/2, height/2);
  rotate(radians(angle));
  line(0, 0, 0, -clock_radius*.45f);
  popMatrix();
}

public void drawMinuteHand() {  
  float angle = (PApplet.parseFloat(minute())/60)*360;
  angle+= (PApplet.parseFloat(second())/60)*(360/60);
  strokeWeight(5);
  stroke(stick_color);
  pushMatrix();  
  translate(width/2, height/2);
  //println(radians(angle));
  rotate(radians(angle));
  line(0, 0, 0, -clock_radius*.4f);
  popMatrix();
}

public void drawHourHand() {
  float angle = (PApplet.parseFloat(hour())/12)*360;
  angle+= (PApplet.parseFloat(minute())/60)*(360/12);
  strokeWeight(10);
  stroke(stick_color);
  pushMatrix();  
  translate(width/2, height/2);
  rotate(radians(angle));
  line(0, 0, 0, -clock_radius*.25f);
  popMatrix();
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#000000", "--hide-stop", "clockface" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
