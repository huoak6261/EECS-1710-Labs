float angle = 0;

void setup(){
  size(900, 900, P2D);
  background (255);
}

void draw(){
  pushMatrix();
  translate(width/2, height/2);
  fill(random(255));
  stroke(random(255));
  rotate(angle);
  float d=random(1,15);
  ellipse(10+angle, 10, d, d);
  angle+=0.2;
  popMatrix();
  if(angle>=600){
    background(255);
    angle=0;
  }
  println(angle);
}
