/*
This primarily the work of Shawn Cornalley (Solon HS, Solon, IA) and his students.
*/
float R = 600; // multiplier for unit directional vector
PMatrix3D cam;
ArrayList s = new ArrayList();
PVector c, d, du; //camera location, 
int speed;
int t = 15;
boolean up = true;

void setup()
{
  //general settings
  size(1200, 800, P3D);
  frameRate(20);
  sphereDetail(12);
  fill(255);
  smooth();
  
  //set camera at edge
  c = new PVector(2000, 2000, 0);

  //load a bunch of planets
  for (int i = 0; i<1000; i++) {
    s.add(new planet());
  }

  //create camera as 3D Matrix
  cam = new PMatrix3D();
}

void draw()
{
  noStroke();
  if(t==255){
    up = false;
  }
  if(t==10){
    up = true;
  }
  if(up){
    t++;
  }
  else{
    t--;
  }
  background(0);
  fill(255);
  directionalLight(t, t/2, 0, -1, 1, 0);
  directionalLight(0, t, t/4, 1, 0, 1);
  directionalLight(t/5, 0, t, 0, -1, -1);
  
  //get vectors for mouseX and mouseY
  cam.rotateX(-(mouseY - height / 2.0) / height / 10); //how quick to rotate world along X
  cam.rotateY(-(mouseX - width  / 2.0) / width  / 10); //how quich to rotate world along y
  PVector x = cam.mult(new PVector(1, 0, 0), new PVector(0, 0, 0)); // new
  PVector y = cam.mult(new PVector(0, 1, 0), new PVector(0, 0, 0)); 

  //create orthogonal vector to x and y called d and unit direction du
  d = x.cross(y); 
  d.normalize();
  du = d.get();
  d.mult(R);
  du.mult(speed);
  
  //move camera along du
  c.add(du);
  camera(c.x, c.y, c.z, d.x+c.x, d.y+c.y, d.z+c.z, y.x, y.y, y.z);  
  
  //draw planets
  for (int i = 0; i < s.size(); i++)
  {
    planet p = (planet) s.get(i);
    p.drift();
    if(p.collide()){
      speed = 0;
      background(255,0,0);
    }
    pushMatrix();
    translate(p.p.x, p.p.y, p.p.z);
    sphere(p.r);
    popMatrix();
  }

  camera();

  drawCrosshair();

  drawThrottle();
}




void keyPressed() {
  if (key==CODED) {
    if (keyCode == UP) {
      speed++;
    }
    if (keyCode == DOWN) {
      speed--;
    }
  }
  else {
    if (key == ' ') {
      s.add(new planet(c, du)); // add planet 100 pixels infront of camera w/ radius random(5,200)
    }
  }
}



/* HELPER METHODS */



void drawThrottle() {
  stroke(255);
  fill(255, 0, 0);
  if (speed>20) speed = 20; // limits throttle
  rect(15, 15, speed*20, 30);
}

void drawCrosshair() {
  stroke(255);
  line(width / 2 - 9, height / 2 - 0, width / 2 + 8, height / 2 + 0);
  line(width / 2 - 0, height / 2 - 9, width / 2 + 0, height / 2 + 8);
}


