// Capture trail test
// Requires input video source and QT for Java

import processing.video.*;

Capture cam;

float alpha = 20;

void setup(){
  
  size(640,480);
  String[] cameras = Capture.list();
  cam = new Capture(this, cameras[0]);
  cam.start();
  
}

void draw(){

  if (cam.available()) {
    cam.read();
  }
  
  tint(255,500,50,alpha);
  
  pushMatrix();
  scale(-1,1);
  translate(-width, 0);
  
  image(cam,0,0);
  
  popMatrix();
  //blend(cam, 0, 0, width, height, 0, 0, width, height, EXCLUSION);
  //filter(INVERT);

}
