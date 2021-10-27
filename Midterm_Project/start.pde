class start
{
  int showornot;
  float x, y;
  
  start() {
    showornot=0; 
    x = width/2; 
    y = height/2;
  }
  
  void display(){
    if (showornot == 0 ) {
      
      background (206, 235, 255);
      
      textAlign(CENTER);
      textSize(120);
      fill(155, 135, 71);
      text("EAT FOOD", width/2+3, height/2+3);
      fill(255, 243, 181);
      text("EAT FOOD", width/2, height/2);
      
      fill(255, 181, 198);
      noStroke();
      rect(250, 500, 200, 100, 7);
      
      fill(255, 255, 255);
      textSize(60);
      text("Play", 350, 570);
      if (mousePressed && (mouseX > 250 && mouseX < 450)&&(mouseY > 500 && mouseY< 600)){
        showornot = 1;
      }
    }
  }
}
