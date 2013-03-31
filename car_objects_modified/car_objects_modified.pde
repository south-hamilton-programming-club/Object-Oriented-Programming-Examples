Car test1 = new Car(#00aaaa,100,200,2,1);
Car test2 = new Car(#55aa55,300,150,1,2);

void setup() {
  size(600,400);
}

void draw() {
  background(#999999);
  test1.drive();
  test1.display();
  test2.drive();
  test2.display();
}

class Car {
  color c;
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  
  Car(color colour, float xp, float yp, float xv, float yv) {
    c = colour;
    xpos = xp;
    ypos = yp;
    xvel = xv;
    yvel = yv;
  }
  
  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos,ypos,20,10);
  }
  
  void drive() {
    xpos = xpos + xvel;
    ypos = ypos +yvel;
    if(xpos > width) {
      xpos = 0;
    }
    if(ypos > height) {
      ypos = 0;
    }
  }
}
