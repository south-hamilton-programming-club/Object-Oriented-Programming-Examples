class planet{
  PVector p, d;
  float r;
  int range = 4000;
  
  planet(){
    p = new PVector(random(150,range),random(150,range),random(150,range));
    d = new PVector(random(-0.5,0.5), random(-0.5,0.5), random(-0.5,2));
    r = random(5, 200);
  }
  
  planet(PVector c, PVector dir){
    p = c.get();
    dir.mult(100);
    p.add(dir);
    r = random(5, 200);
  }
  
  boolean collide(){
    if(dist(c.x,c.y,c.z,p.x,p.y,p.z)<=(r+100)){
      return true;
    }
    else{
      return false;
    }
  }
  
  void drift(){
    p.add(d);
  }
}

