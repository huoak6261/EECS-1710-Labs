PImage basement;

int numBgs = 100;
float xOffset = 40;
float yOffset = 0.3;
float startingSpeed = 2;
float speedIncrement = 0.5;

PVector[] positions = new PVector[numBgs];
float[] speeds = new float[numBgs];

void setup() {
  size(800, 600, P2D);
  basement = loadImage("basement.jpeg");
  basement.resize(basement.width * (height / basement.height), height);
  imageMode(CENTER);
  
}

void draw() {
  background(0);
    
    if (positions[0].x > width || positions[0].x < 0) {
      speeds[numBgs] *= -1;
    }
  }
