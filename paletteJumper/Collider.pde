class Collider {
  PVector position;
  PVector velocity;
  //PVector acceleration;
  color c;
  color stroke_c;
  //int shade;
  PShape collider;
  float radius;  
  float maxVelocity = 1.5;

  float max_radius;
  float min_radius;

  float width_;
  float height_;  
  boolean horizontal = true;

  Collider() {    
    radius = random(20, 50);        
    position = new PVector(random(radius, width-radius), random(radius, height-radius));

    velocity = new PVector(random(-maxVelocity, maxVelocity), random(-maxVelocity, maxVelocity));
    if (abs(velocity.x)<1) {
      velocity.x *=maxVelocity;
    }
    if (abs(velocity.y)<1) {
      velocity.y *=maxVelocity;
    }
    //shade = 255;
    max_radius = radius*1.5;
    min_radius = radius*.5;
    width_ = radius;
    height_ = radius;

    c = color(255);
    stroke_c = color(0);
  }

  void display() {
    move();

    //collider = createShape(ELLIPSE, position.x, position.y, radius, radius);    
    if (horizontal) {
      collider = createShape(ELLIPSE, position.x, position.y, width_++, height_--);
    } else {
      collider = createShape(ELLIPSE, position.x, position.y, width_--, height_++);
    }
    if (width_>=max_radius || width_<=min_radius) {
      horizontal = !horizontal;
    }

    collider.setFill(c);
    collider.setStroke(stroke_c);
    //noStroke();
    //if(c != color(255))
    shape(collider);
  }

  void move() {
    if (random(1) < .001) {
      velocity.x = random(-maxVelocity, maxVelocity);
      velocity.y = random(-maxVelocity, maxVelocity);
      if (abs(velocity.x)<1) {
        velocity.x *=maxVelocity;
      }
      if (abs(velocity.y)<1) {
        velocity.y *=maxVelocity;
      }
    } else {
    }

    position.add(velocity);

    if (position.x+radius/1.9>width || position.x-radius/1.9<0) {
      velocity.x *= -1;
    } else {
    }

    if (position.y+radius/1.9>height || position.y-radius/1.9<0) {
      velocity.y *= -1;
    } else {
    }
  }

  void collided(color last) {
    stroke_c = color(255-red(last), 255-green(last), 255-blue(last));
    c = color(red(last), green(last), blue(last));
  }
}
