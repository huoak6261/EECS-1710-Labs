import processing.sound.*;                                                           //import processing sound library

SawOsc whiteSound;                                                                   //declare oscillator for white keys
SawOsc blackSound;                                                                    //declare oscillator for black keys

float[] whiteFreq = {32.70, 36.71, 41.20, 43.65, 49.00, 55.00, 61.74, 65.41};        //array of frequencies for white keys
float[] blackFreq = {34.65, 38.89, 46.25, 51.91, 58.27};                             //array of frequiencies for black keys


int keyHeight;
int keyWidth;
int keyLength;

int blackKeyHeight;
int blackKeyWidth;
int  blackKeyLength;
int[] keyLocation;
int[] blackKeyLocation;

color hover= 150;                                                                 //Value of lit of color
color [] keele ={#282549, #E5C93D, #2BB675, #DE412D};
color current;

boolean onBlack;                                                                      //check to see if mouse on black note

int amplitude ;

int slideInit;
int slide;

void setup() {

  size(800, 600);
  whiteSound = new SawOsc(this);                                                       // initialize oscillator for white keys
  blackSound = new SawOsc(this);          // initialize oscillator for black keys
  colorMode(HSB);
}

void draw() {
  println(slideInit, slide, onBlack);
  background(0);
  // draw keyboard
  //white keys
  keyHeight = 348;
  keyWidth = 100;
  keyLength = 250;
  keyLocation = new int[]{0, 100, 200, 300, 400, 500, 600, 700};

  stroke(0);                                                                             // stroke color to black
  for (int i=0; i < keyLocation.length; i++)
  {
    amplitude= 0;

    fill(255);
    //white key activates only when mouse is over white key and not over black key
    if ((mouseX>keyLocation[i]&& mouseX<keyLocation[i]+keyWidth) && (mouseY>keyHeight && mouseY<keyHeight+keyLength)) {

      if (onBlack == false) {                                                                            //checks if black key is false
        blackSound.stop();
        //play sound when key is pressed
        if (mousePressed) {
          fill(slide,slide,255);
          stroke(0);
          whiteSound.play();
          whiteSound.freq(whiteFreq[i]+slide/10);
        } else {
          whiteSound.stop();
          fill(255);
        }
      }
    }
    strokeWeight(1);
    rect(keyLocation[i], keyHeight, keyWidth, keyLength);                                                   // draw keys
    noFill();
    strokeWeight(10);
    stroke(0);
  }
  stringsWhite();
  //black keys highlights
  blackKeyHeight = 348;
  blackKeyWidth = 70;
  blackKeyLength = 150;
  blackKeyLocation = new int[]{65, 165, 365, 465, 565};
  noStroke();

  for (int i=0; i < blackKeyLocation.length; i++)
  {
    amplitude=0;
    fill(30);
    //checks if mouse is on a black key
    if ((mouseX>blackKeyLocation[i]&& mouseX<blackKeyLocation[i]+blackKeyWidth) && (mouseY>blackKeyHeight && mouseY<blackKeyHeight+blackKeyLength)) { //checks current location of mouse
      fill(hover);
      onBlack = true;

      whiteSound.stop();
      // onblack is set to true if mouse on black not
      //pressed = true;
      //Play sound of note if key Pressed
      if (mousePressed) {
            fill(slide,slide,255);
        blackSound.play();
        blackSound.freq(blackFreq[i]+slide/10);
      } else {
        blackSound.stop();
      }
      //set onBlack to false if mouse not on black key.
    }
    if ((!(mouseX>blackKeyLocation[i]&& mouseX<blackKeyLocation[i]+blackKeyWidth)) && !(mouseY>blackKeyHeight && mouseY<blackKeyHeight+blackKeyLength)) {
      onBlack = false;
    }

    rect(blackKeyLocation[i], blackKeyHeight, blackKeyWidth, blackKeyLength);
  }
  stringsBlack();
  //black keys
  noStroke();
  blackKeyHeight = 352;
  blackKeyWidth = 55;
  blackKeyLength = 142;
  blackKeyLocation = new int[]{73, 173, 373, 473, 573};
  fill(0);
  for (int i=0; i < 5; i++)
  {
    rect(blackKeyLocation[i], blackKeyHeight, blackKeyWidth, blackKeyLength);                                                           // draw black keys
  }
}
void stringsWhite() {
  for (int i=0; i < keyLocation.length; i++)
  {
    amplitude= 0;
    stroke(255);
    //white key activates only when mouse is over white key and not over black key
    if ((mouseX>keyLocation[i]&& mouseX<keyLocation[i]+keyWidth) && (mouseY>keyHeight && mouseY<keyHeight+keyLength)) { //checks location of mouse
      if (onBlack == false) {                                                                            //checks if black key is false
        //play sound when key is pressed
        if (mousePressed) {
          //stroke(#9404A8);
          stroke(slide,slide,255);
          amplitude =round(random(-slide, slide));
        }
      }
    }
    strokeWeight(10);
    bezier(keyLocation[i]+keyWidth/2, 0, keyLocation[i]+keyWidth/2+amplitude, 172, keyLocation[i]+keyWidth/2+amplitude, 172, keyLocation[i]+keyWidth/2, 344);   // draw bezier
  }
}
void stringsBlack() {
  for (int i=0; i < blackKeyLocation.length; i++)
  {
    amplitude= 0;
    stroke(255);
    //white key activates only when mouse is over white key and not over black key
    if ((mouseX>blackKeyLocation[i]&& mouseX<blackKeyLocation[i]+blackKeyWidth) && (mouseY>blackKeyHeight && mouseY<blackKeyHeight+blackKeyLength)) { //checks location of mouse
      if (onBlack == true) {                                                                            //checks if black key is false

        //play sound when key is pressed
        if (mousePressed) {
          noFill();
          //stroke(#9404A8);
          stroke(slide,slide,255);
          amplitude =round(random(-slide, slide));
        }
      }
    }
    strokeWeight(2);
    bezier(blackKeyLocation[i]+keyWidth/2, 0, blackKeyLocation[i]+keyWidth/2+amplitude, 172, blackKeyLocation[i]+keyWidth/2+amplitude, 172, blackKeyLocation[i]+keyWidth/2, 344); // draw bezier
  }
}
void mousePressed() {
  if (mousePressed) {
    current = keele[int(random(keele.length))];
  }

  slideInit = mouseY;
}


void mouseDragged() {
  slide = slideInit - mouseY;

  slide =int( map( slide, 0,200, 0,255));
}
