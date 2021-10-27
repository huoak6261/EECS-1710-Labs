class doll {
  int gameover;
  float x, y, w, s, vx, vy;
  doll(float xx, float yy, float vxx, float vyy, float ss){
    x = xx; y = yy; vx = vxx; vy = vyy; s = ss;
    gameover = 0;
  }
  
  void update() {
    x = mouseX;
    y = mouseY;
    if (x + 10 > width)x -= 10;
    if (x - 10 < 0) x += 10;
    if (y + 10 > height) y -= 10;
    if (y - 10 < height) y += 10;
  }
  void collide (heart hh){
    float dx = x-hh.x;
    float dy = y-hh.y;
    if ((dx * dx + dy * dy < ((50+s/2)*(50+s/2))) && gameover == 0){
      score++;
      hh.y+=1000;
      s+=5;
    }
  }

  void collide (die bb){
    float dx = x-bb.x;
    float dy = y-bb.y;
    if (dx * dx + dy * dy < ((50+s/2)*(50+s/2))) gameover = 1;
  }

  void display(){
    noStroke();
    if (score < 10) {fill(255, 256, 102);}
    else if (score < 20) {fill(249, 199, 99);}
    else if (score < 30) {fill(247, 178, 98);}
    else if (score < 40) {fill(244, 171, 97);}
    else if (score < 50) {fill(244, 161, 97);}
    else if (score < 60) {fill(244, 151, 97);}
    else if (score < 70) {fill(244, 141, 97);}
    else {fill (242, 123, 96);}
    circle (x, y, 60+s);
  
    if (score < 30) {fill (247, 116, 98);}
    else if (score < 50) {fill(244, 91,70);}
    else {fill(244, 65, 41);}
    ellipse(x,y+10+s/6, 30+s/2, 25+s/3*1.25);
  
    fill(84, 41, 33);
    circle (x-12-s/5, y-10-s/6, 10+s/6);
    circle(x+12+s/5, y-10-s/6, 10+s/6);
    }
  }
  
