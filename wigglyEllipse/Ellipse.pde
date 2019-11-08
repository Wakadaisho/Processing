class Ellipse {
  float max_radius;
  float min_radius;
  float width_;
  float height_;
  PVector pos;
  boolean horizontal = true;
  color c;

  Ellipse() {
    this(random(30, 70), random(10, 30));
  }

  Ellipse(float max, float min) {
    max_radius = max;
    min_radius = min;
    width_ = (max+min)/2;
    height_ = width_;
    pos = new PVector(random(0, width), random(0, height));
    c = color(random(0, 256), random(0, 256), random(0, 256));
    
  }

  void display() {
    fill(c);
    if (horizontal) {
      ellipse(pos.x, pos.y, width_++, height_--);
    } else {
      ellipse(pos.x, pos.y, width_--, height_++);
    }
    if (width_>=max_radius || width_<=min_radius) {
      horizontal = !horizontal;
    }
  }
}
