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
  loadPixels();
  img.loadPixels();
  
  for (int x = 1; x < width; x++) {
    for (int y = 0; y < height; y++ ) {
      // Pixel location and color
      int loc = x + y*img.width;
      color pix = img.pixels[loc];
  
      // Pixel to the left location and color
      int leftLoc = (x-1) + y*img.width;
      color leftPix = img.pixels[leftLoc];
  
      // New color is difference between pixel and left neighbor
      float diff = abs(brightness(pix) - brightness(leftPix));
      pixels[loc] = color(diff);
    }
  }
  
  updatePixels();
  
  frame += 1;
}
