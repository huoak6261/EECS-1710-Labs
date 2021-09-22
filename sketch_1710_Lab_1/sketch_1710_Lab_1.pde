color bgColor = color(255);
float circleSize = 50;

void setup(){
  size(800, 600, P2D);
  background(bgColor);
}

void draw(){
    noStroke();
    fill(0, 10);
    rect(0, 0, width, height);
  
    fill(random(255), random(255), random(255));
    ellipse(random(0,width), random(0,height), mouseX, mouseY);
  
  if(mousePressed==true && mouseButton==LEFT){
      strokeWeight(100);

      fill(0, 0, 0);
      stroke(255, 255, 255);
      line(pmouseX, pmouseY, mouseX, mouseY);
      rect(mouseX, mouseY, circleSize, circleSize);
  }
   if(mousePressed==true && mouseButton==RIGHT){
     strokeWeight(100);
     fill(0, 127, 255);
      stroke(0, 0, 0);
     line(pmouseX, pmouseY, mouseX, mouseY);
     rect(mouseX, mouseY, circleSize, circleSize);
  }

}
void keyPressed(){
   if (key=='r'){
     background(255);
     fill(0,10);
    }
}
