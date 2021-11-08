PImage img;
float angle1 = 0;
float angle2 = 0;
float angle3 = 0;
float angle4 = 0;

void setup(){
  size(750, 750);
  img = loadImage("mozart.png");
  noStroke();
}

void draw(){
  background (30, 0, 0); 
    pushMatrix();
    translate(150, 150);
    scale(0.5);
    rotate(angle2);
    imageMode(CENTER);
    image(img, 0, 0, 300, 300);
    angle2 += 0.01;
    popMatrix();
      
    pushMatrix();
    translate(550, 200);
    scale(1.0);
    rotate(angle3);
    imageMode(CENTER);
    image(img, 0, 0, 300, 300);
    angle3 += 0.05;
    popMatrix();
    
    pushMatrix();
    translate(300, 550);
    scale(1.5);
    rotate(angle4);
    imageMode(CENTER);
    image(img, 0, 0, 300, 300);
    angle4 += 0.1;
    popMatrix();
      
 for(int y = 0, j = 0; y <= height; y += 10, j++){
   for(int x = 0, i = 0; x <= width; x += 10, i++){
     pushMatrix();
     translate(x, y);
      
     if(mouseX < 300){
     rotate (angle1);
     } else if(mouseX < 600){
       rotate(angle1 + i);
     } else {
       rotate(angle1 + i + j);
     }
      
     color c = img.get(x, y);
     fill(c);
     rect(0, 0, 5, 5);
     popMatrix();
    }
  }
  angle1 += 0.05;
}
