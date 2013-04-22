int paddleWidth = 80;

ball b1 = new ball();

void setup(){
  size(600,600);
  smooth();
  frameRate(80);
}

void draw(){
  background(100,255,200);
  rect(width-20,mouseY,10,80);
  b1.update();
  ellipse(b1.ballX,b1.ballY,20,20);
}

class ball{
  float ballX;
  float ballY;
  float ballSpeedX;
  float ballSpeedY;
  
  //constructor
  void ball(){
    ballX = 50;
    ballY = 300;
    ballSpeedX = 3;
    ballSpeedY = 0;
  }
  
  void update(){
    if(ballX < 0){ //does it hit the left side of the screen?
      ballSpeedX = -ballSpeedX;
    }
  
    //if ball hits top edge
    if(ballY < 0){
      ballSpeedY = -ballSpeedX;
    }
  
    // if ball hits top edge
    if(ballY>height){
      ballSpeedY = -ballSpeedX;
    }
    
    if(ballX>(width-20) && ballY > mouseY && ballY<(mouseY + paddleWidth)){
      float angle = random(-60,60);
      ballSpeedX = 3*cos(angle);
      ballSpeedY = 3*sin(angle);
      print(sin(angle));
    }
    
    ballX += ballSpeedX;
    ballY += ballSpeedY;
  }
}
