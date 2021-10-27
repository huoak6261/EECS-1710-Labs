class parent {
  float x, y, w, speed;
  
  parent() {
    x = random(width);
    y = random (height);
    speed = random(2, 5);
    w = 60;
  };
  
  PImage imgimg;
  
  void move() {
    y += speed;
    if (y > height) y = -400;
  }
  
  void display(){
    image(imgimg, x, y, w, w);
  }
}
