// Learning Processing

import processing.video.*;
int videoScale = 10;
int cols, rows;

Capture cam;

void setup() {
  size(640,480);
  cols = width/videoScale;
  rows = height/videoScale;
  
  String[] cameras = Capture.list();
  cam = new Capture(this,cols,rows,cameras[0]);
  cam.start();
  
}

void draw() {
  if (cam.available()) {
    cam.read();
  }
  cam.loadPixels();
  
  // Begin loop for columns
  for (int i = 0; i < cols; i++) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++) {
      
      // Where are we, pixel-wise?
      int x = i*videoScale;
      int y = j*videoScale;
      
      // Looking up the appropriate color in the pixel array
      color c = cam.pixels[i + j*cam.width];
      fill(c);
      stroke(0);
      rect(x,y,videoScale,videoScale);
    }
  }
}
