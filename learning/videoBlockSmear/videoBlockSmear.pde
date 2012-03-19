import processing.video.*;
Capture video;

PixelBlock [] pBlocks;

int samplesX = 150;
int samplesY = 150;

void setup(){
  
  size(640,480,P2D);
  video = new Capture(this,width,height,30);
  
  if (video.available()) {
    video.read();
  }
  
  video.loadPixels();
  
  pBlocks = new PixelBlock[(samplesX*samplesY)];
  
  for(int y=0;y<samplesY;y++){
    for(int x=0;x<samplesX;x++){
      
      randomSeed(x*x*y*y);
      int posX = floor(random(width));
      int posY = floor(random(height));
      int loc = posX + posY*width;
      int ind = x+(samplesX*y);
      pBlocks[ind] = new PixelBlock(posX,posY,video.pixels[loc]);
    }
  }
  
}

void draw(){
  
  background(0);
  
  // Read image from the camera
  if (video.available()) {
    video.read();
  }
  video.loadPixels();
  
  int loc;
  
//  pushMatrix();
//  scale(-1,1);
//  translate(-width, 0);
  
  for(int y=0;y<samplesY;y++){
    for(int x=0;x<samplesX;x++){
      int ind = x+(samplesX*y);
        loc = pBlocks[ind].x + pBlocks[ind].y*width;
        pBlocks[ind].update(video.pixels[loc]);
        pBlocks[ind].display();
    }
  }
  
//  popMatrix();
  
}
