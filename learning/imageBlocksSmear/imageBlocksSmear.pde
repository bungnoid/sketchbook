PImage img;
PixelBlock [] pBlocks;

int samplesX = 150;
int samplesY = 150;

void setup(){
  
  // Load source image pixels
  img = loadImage("helmet_head.JPG");
  img.loadPixels();
  
  size(650,650);
  
  pBlocks = new PixelBlock[(samplesX*samplesY)];
  
  for(int y=0;y<samplesY;y++){
    for(int x=0;x<samplesX;x++){
      
      randomSeed(x*x*y*y);
      int posX = floor(random(img.width));
      int posY = floor(random(img.height));
      int loc = posX + posY*img.width;
      int ind = x+(samplesX*y);
      pBlocks[ind] = new PixelBlock(posX,posY,img.pixels[loc]);
    }
  }
  
}

void draw(){
  
  background(0);
  
  for(int y=0;y<samplesY;y++){
    for(int x=0;x<samplesX;x++){
      int ind = x+(samplesX*y);
        pBlocks[ind].update();
        pBlocks[ind].display();
    }
  }
}
