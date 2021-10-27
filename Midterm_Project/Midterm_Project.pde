int score = 0;
int hnum = 25;
int dnum = 5;

die mydie[] = new die[dnum];
heart myheart[] = new heart[hnum];
start mystart[] = new start[1];
doll mydoll[] = new doll[1];

PImage img;

void setup ()
{
  size(700, 900);
  for (int i = 0; i < hnum; i++) myheart[i] = new heart();
  for (int i = 0; i < dnum; i++) mydie[i] = new die();
    mydoll[0] = new doll(width/2, 4.3*height/5, 10, 10, 1);
    mystart[0] = new start();
  img = loadImage ("yummy.png");
}

void draw(){
    background(204, 212, 249);
    mystart[0].display();
    if (mystart[0].showornot == 1){
 
    textAlign(LEFT);
    fill(255);
    textSize(50);
    text("Score : " + (int)score, 50, 50);
  
     for (int i = 0; i < hnum; i++){
        myheart[i].display();
        myheart[i].move();
  }
  
     for (int i =0; i <dnum; i++){
        mydie[i].display();
        mydie[i].move();
  }
  
      mydoll[0].display();
      mydoll[0].update();
  
      for (int j = 0; j < hnum; j++)
        mydoll[0].collide(myheart[j]);
      
      for (int i = 0; i < dnum; i++){
        mydoll[0].collide(mydie[i]);
  
      if (mydoll[0].gameover == 1){
        fill(125, 125, 125, 10);
        noStroke();
        rect(0, 0, 1000, 1000);
    
        image(img, 300, 310, 100, 100);
    
        textAlign(CENTER);
        textSize(100);
        fill(229, 133, 211);
        text("\"Game Over!\"", width/2+3, 500+3);
        fill(255, 255, 255);
        text ("\"Game Over!\"", width/2, 500);
    
        textSize(50);
        fill(173, 244, 217);
        text("You ate "+score+" foods.", width/2, 580);
      
        fill(255, 181, 198);
        noStroke();
        rect(250, 700, 200, 100, 7);
        fill(255, 255, 255);
        textSize(60);
        text("Exit", 250, 770);
        if (mousePressed && (mouseX > 250 && mouseX < 450)&&(mouseY > 700 && mouseY < 900)){
          exit();
        }
      }
    }
  }
}
