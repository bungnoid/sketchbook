import processing.video.*;
 
Capture cam;
 
void setup () {
  size (640, 480);
  String[] cameras = Capture.list();
  cam = new Capture(this, cameras[0]);
  cam.start();
  background(0);
}
 
void draw () {
  if (cam.available ()) {
    cam.read ();
  } else {
    return;
  }
  for (int i=0; i < cam.pixels.length; i += 10) {
    if (i % cam.width == 0) {
      if (i%2 == 0) {
        i += cam.width * 10;
      }
    }
    if (i > cam.pixels.length){
      break;
    }
    int x = i % cam.width;
    int y = (int) floor (i / cam.width);
     
    fill (cam.pixels[i]);
    //strokeWeight(random(1,2));
    strokeWeight(1);
    ellipse (x, y, random(10,30), random(10,30));
  }
}
