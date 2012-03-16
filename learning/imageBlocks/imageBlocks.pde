PImage img;

int samplesX = 150;
int samplesY = 150;

int incX, incY;

void setup(){
  
  img = loadImage("helmet_head.JPG");
  size(650,650);
  
  incX = img.width / samplesX;
  incY = img.height / samplesY;
}

void draw(){
  background(0);
  
  // Load source image pixels
  img.loadPixels();
  
  // Set rectangle draw mode
  rectMode(CENTER);
  
  for(int y=0;y<samplesY;y++){
    for(int x=0;x<samplesX;x++){
      
      // Generate random seed
      randomSeed(x*x*y*y);
      
      // Get random pixel index
      int posX = floor(random(img.width));
      int posY = floor(random(img.height));
      int loc = posX + posY*img.width;
      
      // Get pixel colour
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      fill(r,g,b);
      
      // Get distance to cursor
      float mouseDist = dist(mouseX,mouseY,posX,posY)/sqrt(sq(img.width)+sq(img.height));
      
      // Create pixel block
      float w = random(1,20) + 20*pow(1-mouseDist,15);
      float h = random(1,20) + 20*pow(1-mouseDist,15);
      rect(posX,posY,w,h);
      
    }
  }
}
