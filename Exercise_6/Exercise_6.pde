import processing.video.*;
import gab.opencv.*;
import java.aw.*;

Capture video;
OpenCV opencv;

void setup(){
  size(640, 480);
  String[] cameras = Capture.list();
  video = new CApture(this, cameras[1]);
  opencv = new OpenCV(this, 640, 480);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  video.start();
}

void draw(){
  if(video.available()){
    video.read();
  }
  opencv.loadImage(video);
  image(video,0,0);
  
  noFill();
  stroke(0,255,0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  
  println("detected faces numbers : "+ faces.length);
  for(int i = 0; i < faces.length; i++){
    println("face coordinate : "+faces[i].x + "," + faces[i].y);
      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}
  void captureEvent(Capture c){
    c.read();
  }
