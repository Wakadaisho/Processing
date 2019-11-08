class State{
  float radius;
  PVector center;
  PVector nextState;
  boolean acceptState;
  String label;
  boolean active;
  boolean hasNext;
  color fillColor;
  
  State(float radius, PVector center, String label){
    this.radius = radius;
    this.center = center.copy();
    this.label = label;
    this.acceptState = false;
    this.active = false;
    this.hasNext = true;
    fillColor = color(0);
  }
  
  void setLabel(String label){
    this.label = label;
  }
  
  void setAccept(){
    this.acceptState = true;
  }
  
  void removeAccept(){
    this.acceptState = false;
  }
  
  void activate(){
    this.active = true;
    fillColor = color(0, 255, 0);
  }
  
  void deactivate(){
    this.active = false;
    fillColor = color(0);
  }
    
  void setLineTerminal(PVector terminal){
    nextState = terminal.copy();
  }
  
  void displayState(){    
   stroke(fillColor);
   
    ellipse(center.x, center.y, radius, radius);    
    if(acceptState){
      ellipse(center.x, center.y, radius*.9, radius*.9);
    }
    pushStyle();
    fill(fillColor);
    text(label, center.x-18, center.y*1.035);
    popStyle();
  }
  
  void displayLine(){
    stroke(0);    
    
    line(center.x, center.y, nextState.x, nextState.y);
  }
  
}
