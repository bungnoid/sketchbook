// Capture trail test
// Requires input video source and QT for Java

import processing.video.*;

Capture video;

float a;

void setup(){
  
  frameRate(12);
  size(720,576,P2D);
  video = new Capture(this,width,height,30);
  
  if (video.available()) {
    video.read();
  }
  
  pushMatrix();
  scale(-1,1);
  translate(-width, 0);
  
  image(video,0,0);
  
  popMatrix();
  
}

void draw(){

  if (video.available()) {
    video.read();
  }
  
  a = 20; // random(20,3);
  tint(255,a);
  
  pushMatrix();
  scale(-1,1);
  translate(-width, 0);
  
  image(video,0,0);
  
  popMatrix();
  //blend(video, 0, 0, width, height, 0, 0, width, height, EXCLUSION);
  //filter(INVERT);

}
