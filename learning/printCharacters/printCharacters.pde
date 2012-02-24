PFont f;
String message = "this text is spinning";
float theta;

void setup() {
  size(500, 200);
  f = createFont("Arial",20,true);
}

void draw() {
  smooth();
  background(0);
  String message = "Each character is written individually.";

  // The first character is at pixel 10.
  int x = 10; 
  for (int i = 0; i < message.length(); i++) {
    textSize(random(12,36));
    // Each character is displayed one at a time with the charAt() function.
    text(message.charAt(i),x,height/2);
    // All characters are spaced 10 pixels apart.
    x += textWidth(message.charAt(i)); 
  }
  noLoop();
}


