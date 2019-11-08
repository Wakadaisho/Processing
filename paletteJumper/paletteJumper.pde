Food food;
Collider[] pets;

int collisions = 0;
int fontSize = 20;    //the larger the smaller the text
//PVector foodValues = new PVector(50, 10, 5);    //rgb

void setup() {
  size(500, 500);
  
  //background(0);
  //fullScreen();
  strokeWeight(2);
  
  pets = new Collider[floor(sqrt(width*height)/10)];
  food = new Food();
  
  textSize(width/fontSize);  
  for (int i=0; i<pets.length; i++) {
    pets[i] = new Collider();
  }
}

void draw() {  
  background(0);
  
  food.display();

  for (Collider pet : pets) {
    pet.display();
    collisions+=food.checkCollision(pet) ? 1 : 0;
  }
    
  printCollisions();
}

void mousePressed() {
  println("["+red(get(mouseX, mouseY)) + ", " + green(get(mouseX, mouseY)) + ", " + blue(get(mouseX, mouseY)) + "]");
}

void printCollisions(){
  fill(color(255 - red(food.last), 255 - green(food.last), 255 - blue(food.last)), 127);  
  stroke(color(255 - red(food.last), 255 - green(food.last), 255 - blue(food.last)));
  rect(width-textWidth(""+collisions), height-(width/fontSize), width, height);
  fill(color(red(food.last), green(food.last), blue(food.last)));
  text(""+collisions, width-textWidth(""+collisions), height-(width/fontSize), width, height);
}
