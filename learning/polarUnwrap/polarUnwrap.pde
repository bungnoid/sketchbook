// Declaring a variable of type PImage
PImage img;

void setup() {
  
  background(0);
  img = loadImage("spiral.gif");
  float scl = 0.66;
  
  size(int(img.width/2*scl),int(img.height*PI*scl));
  
//}

//void draw() {
  
  loadPixels();
  img.loadPixels();
  
  int w2 = img.width/2;
  int h2 = img.height/2;
  int max = img.width*img.height;
  
  for(int y=0;y<height;y++){
    for(int x=0;x<width;x++){
      float rad = float(x)/width;
      float theta = (2*PI)*(float(y)/height);
      int src_x = int(rad*cos(theta) * w2 + w2);
      int src_y = int(rad*sin(theta) * h2 + h2);
      
      int loc = x + (y * width);
      int locSrc = src_x + src_y*img.width;
      if(locSrc >= max) locSrc = max-1;
      
      float r = red(img.pixels[locSrc]);
      float g = green(img.pixels[locSrc]);
      float b = blue(img.pixels[locSrc]);
      
      pixels[loc] = color(r,g,b);
    }
  }
  updatePixels();
}
