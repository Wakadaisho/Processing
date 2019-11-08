PVector graphCenter;
PShape graph;
float radius;
color back; 

void setup(){
    size(500, 500);
    graphCenter = new PVector();
    graphCenter.x = width/5;
    graphCenter.y = height/5;
    
    //radius = graphCenter.y < graphCenter.x ? graphCenter.y/2 : graphCenter.x/2;    
    radius = (graphCenter.x + graphCenter.y)/2;
    back = color(255);    
    ellipseMode(CORNER);
    noStroke();
    println(radius);
    println(graphCenter.x);
    println(graphCenter.y);
}

void draw(){
  background(back);
    
  fill(255,0,0);
  arc(width-radius, 0, radius, radius, 1.0/6*PI, 5.0/6*PI, PIE);
  fill(0,255,0);
  arc(width-radius, 0, radius, radius, 5.0/6*PI, 9.0/6*PI, PIE);
  fill(0,0,255);
  arc(width-radius, 0, radius, radius, 9.0/6*PI, 13.0/6*PI, PIE);
   
}

void mousePressed(){    
  if(dist(width - graphCenter.x/2, graphCenter.y/2, mouseX, mouseY) < radius/2 ){    
    back = get(mouseX, mouseY);
  }
}
