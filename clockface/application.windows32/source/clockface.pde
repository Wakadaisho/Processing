float clock_radius;
color body_color, stick_color, highlight_color, tick_color;
int startHour;
PFont font;

void setup() {
  fullScreen();  
  
  setStickColor();
  
  strokeCap(ROUND);
  ellipseMode(CENTER);  
  
  clock_radius = width/2;
  startHour = hour();
}

void draw() {
  if(startHour!=hour()){
    setStickColor();
    startHour = hour();
  }
  drawClock();
}

void keyPressed(){
  exit();
}

void mousePressed(){
  exit();
}

void setStickColor(){
  if((hour() > 17 || hour() < 6)){
    stick_color = #FFFFFF;
    tick_color = #FFFFFF;
    highlight_color = #16FF00;
    body_color = #000000;
    background(body_color);
  }
  else{
    stick_color = #000000;
    tick_color = #000000;
    highlight_color = #16FF00;
    body_color = #DDDDDD;
    background(body_color);
  }
}

//void mouseMoved(){
//  if(frameCount > 10)
//    exit();
//}

void drawClock() {
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

void drawDigital() {
  drawOuterCircle();
  drawDisplayFrame();  
  displayDigitalTime();
  flashColon();
}

void drawAnalog() {  
  drawOuterCircle();
  drawTickPoints();
  highlightTick();

  drawHourHand();
  drawMinuteHand();
  drawSecondHand();
  drawInnerCircle();
}

void displayDigitalTime() {
  pushMatrix();

  font = createFont("LCD", clock_radius*.165);
  textFont(font);
  textAlign(CORNER);
  translate(width/2-clock_radius*.255, height/2+clock_radius*.2+clock_radius*.075);  
  String hr = "" + hour(), min = "" + minute(), sec = "" + second();

  if (int(hr)<10) {
    hr = "0" + hr;
  }
  if (int(min)<10) {
    min = "0" + min;
  }
  if (int(sec)<10) {
    sec = "0" + sec;
  }

  fill(highlight_color);

  text(hr, 0, 0);
  text(min, clock_radius*.185, 0);
  text(sec, clock_radius*.365, 0);
  popMatrix();
}

void flashColon() {    
  pushMatrix();
  textSize(clock_radius*.3);
  translate(width/2-clock_radius*.22, height/2+clock_radius*.2+clock_radius*.075-clock_radius*.01);

  if (second()%2==0) {
    fill(stick_color);
  } else {
    fill(highlight_color);
  }

  text(":", clock_radius*.115, 0);
  text(":", clock_radius*.295, 0);
  popMatrix();
}

void drawDisplayFrame() {
  pushMatrix();

  rectMode(CENTER);    
  translate(width/2, height/2+clock_radius*.215);
  noStroke();
  fill(0, 150);
  rect(0, 0, clock_radius*.55, clock_radius*.15);
  popMatrix();
}

void drawOuterCircle() {
  //strokeWeight(10);
  noStroke();
  fill(body_color);
  //stroke(frame_color);

  ellipse(width/2, height/2, clock_radius, clock_radius);
}

void drawInnerCircle() {
  noStroke();
  fill(stick_color);

  ellipse(width/2, height/2, clock_radius/20, clock_radius/20);
}

void highlightTick() {
  float angle = float(second())/60*360;
  float strokeMajor = width*.05;
  float strokeMinor = width*.03;
  float strokeMicro = width*.01;
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
  translate(0, -clock_radius*.47);    

  line(0, 0, 0, strokeSize); 

  popMatrix();
}

void drawTickPoints() {
  float strokeMajor = width*.05;
  float strokeMinor = width*.03;
  float strokeMicro = width*.01;
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

    translate(0, -clock_radius*.47);        
    line(0, 0, 0, strokeSize); 

    popMatrix();
  }

  popMatrix();
}

void drawSecondHand() {  
  float angle = (float(second())/60)*360;  
  strokeWeight(2);
  stroke(255, 0, 0);
  pushMatrix();  
  translate(width/2, height/2);
  rotate(radians(angle));
  line(0, 0, 0, -clock_radius*.45);
  popMatrix();
}

void drawMinuteHand() {  
  float angle = (float(minute())/60)*360;
  angle+= (float(second())/60)*(360/60);
  strokeWeight(5);
  stroke(stick_color);
  pushMatrix();  
  translate(width/2, height/2);
  //println(radians(angle));
  rotate(radians(angle));
  line(0, 0, 0, -clock_radius*.4);
  popMatrix();
}

void drawHourHand() {
  float angle = (float(hour())/12)*360;
  angle+= (float(minute())/60)*(360/12);
  strokeWeight(10);
  stroke(stick_color);
  pushMatrix();  
  translate(width/2, height/2);
  rotate(radians(angle));
  line(0, 0, 0, -clock_radius*.25);
  popMatrix();
}
