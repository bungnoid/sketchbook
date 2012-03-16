// Declaring a variable of type PImage
PImage img;

int frame = 0;	

void setup() {
  background(0);
  img = loadImage("bungnoid.jpg");
  size(img.width,img.height);
}

void draw() {
  
  // Draw the image to the screen at coordinate (0,0)
  //tint(100);
  //image(img,0,0,320,240);
  
  loadPixels();
  img.loadPixels();
  
  for(int y=0;y<img.height;y++){
    for(int x=0;x<img.width;x++){
      
      int loc = x + y*img.width;
      //int locAnim = ((x + frame) + y*img.width) % img.pixels.length;
      //int locAnim = ((x+frame+(img.width-mouseX)) + (y+x+frame+(img.height-mouseY))*img.width) % img.pixels.length;
      //int locAnim = (loc + frame) % img.pixels.length;
      int locAnim = ((x+frame+y)%img.width) + y*img.width;
      
      float r = red(img.pixels[locAnim]);
      float g = green(img.pixels[locAnim]);
      float b = blue(img.pixels[locAnim]);
      
      pixels[loc] = color(r,g,b);
    }
  }
  updatePixels();
  
  frame += 1;
}
