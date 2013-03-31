color c = color(0);
float x = 0;
float y = 100;
float speed = 1;

void setup() {
  size(300, 200); // make a window that is 300 pixels wide and 200 pixels tall
}

void draw() {
  background(255); //background color (white)
  move();
  display();
}

void move() {
  x = x + speed;
  if (x > width) {
    x = 0;
  }
}

void display() {
  fill(c);
  rect(x,y,30,10);
}

