PImage img;
int x = 100;

void setup() {
  size (720, 480);
  background (0);
  img = loadImage("moon.png");  
}

void draw() {
  fill(0, 20);
  rect(0,0,width,height);
  
  fill(255, 200);
  ellipse(random(width), random(height), random(5), random(5));
  
  image(img, x, 190, 100, 100);
  x = x + 2;
  if (x >= width){
    x = -100;
  }
}
