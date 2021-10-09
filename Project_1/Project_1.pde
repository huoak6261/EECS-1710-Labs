PImage Bimg;
PImage[] img = new PImage[5];
float[] x = new float[5];
float[] y = new float[5];
float[] speedX = new float[3];
float[] speedY = new float[3];
int r = 40;
int bgs = 100;
float xbackground = 40;
float ybackground = 0.3;
float backgroundspeed = 2;
float speedIncrease = 0.3;

PVector[] positions = new PVector[bgs];
float[] speeds = new float[bgs];


void setup(){
  
  
  size(1200, 600, P2D);
  noStroke();
  for(int i = 0; i < 3; i++){
    img[i] = loadImage("img" + nf(i, 2)+".png");
    x[i] = width/2;
    y[i] = height/2;
    speedX[i] = random(-10, 10);
    speedY[i] = random(-10, 10);
 
  }
    Bimg = loadImage("space.png");
    Bimg.resize(1200, 600);
  
  for (int i = 0; i<bgs; i++) {
    positions[i] = new PVector(width/2 + (i * xbackground), height/2 + (i * ybackground));
    speeds[i] = backgroundspeed + (i * speedIncrease);
  }
  
  for (int j = 3; j < 5; j++){
    img[j] = loadImage("img" + nf(j, 2)+".png");
    x[j] = width/2;
    y[j] = height/2;
    img[j].resize(0, 300);
    
  } 
}


void draw(){
   for (int j = 0; j<bgs; j++) {
   tint(255, (255 / bgs) * j);
   image(Bimg, positions[j].x, positions[j].y);
   positions[j].x += speeds[j];
    if (positions[0].x > width || positions[0].x < 0) {
        speeds[j] *= -1;
      }
   
   }
  fill(94, 94, 94, 160);
  rect(0, 0, width, height);
  imageMode(CENTER);
  if(!mousePressed){  
    for( int i = 0; i < 3; i++){
      image (img[i], x[i], y[i], r*2, r*2);
      x[i] = x[i] + speedX[i];
      y[i] = y[i] + speedY[i];
      if((x[i] > width - r) || (x[i] < r)){
        speedX[i] = speedX[i] *- 1;
      }
      if((y[i] > height - r) || (y[i] < r)){
        speedY[i] = speedY[i] *- 1;    
      }
    }
    image (img[3], mouseX, mouseY);
  }else{
    image (img[4], mouseX, mouseY);
  }
}
