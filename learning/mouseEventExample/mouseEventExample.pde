void setup() {
  size(200,200);  
}

void draw() {
    
}

void mousePressed() {
  println( mouseEvent.getPoint() );
  // it seems that any other mouse event resets the Click counter...
  println( "number of clicks: " + mouseEvent.getClickCount() );
  println("button: " + mouseEvent.getButton() );
  println("--------------------------------------");
}

void mouseReleased() {
  println("--------------------------------------");
}

// Try moving the sketch window around your screen 
// and then dragging inside it to the see the relevance of this.
void mouseDragged() {
    println("x: " + mouseEvent.getLocationOnScreen().x + "   y: " +   mouseEvent.getLocationOnScreen().y);  
}

// There's an interesting disparity between values returned by getPoint and mouseX/Y,
// specifically on mouseEntered...
void mouseEntered(MouseEvent mouseEvent) {
  println("entered at: " + mouseEvent.getPoint().x + "," + mouseEvent.getPoint().y);
  println("           " + mouseX + "," + mouseY);
  println("--------------------------------------");  
}

void mouseExited(MouseEvent mouseEvent) {
  println("exited at: "+ mouseEvent.getPoint().x + "," + mouseEvent.getPoint().y);  
  println("           " + mouseX + "," + mouseY);
  println("--------------------------------------");  
} 


