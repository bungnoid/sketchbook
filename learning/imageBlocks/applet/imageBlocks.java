import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class imageBlocks extends PApplet {

PImage img;

int samplesX = 150;
int samplesY = 150;

int incX, incY;

public void setup(){
  background(0);
  img = loadImage("helmet_head.JPG");
  size(650,650);
  
  incX = img.width / samplesX;
  incY = img.height / samplesY;
}

public void draw(){
  background(0);
  
  // Load source image pixels
  img.loadPixels();
  
  // Set rectangle draw mode
  rectMode(CENTER);
  ellipseMode(CENTER);
  //noStroke();
  
  for(int y=0;y<samplesY;y++){
    for(int x=0;x<samplesX;x++){
      
      randomSeed(x*x*y*y);
      
      //int posX = incX*x;
      //int posY = incY*y;
      
      int posX = floor(random(img.width));
      int posY = floor(random(img.height));
      
      float mouseDist = dist(mouseX,mouseY,posX,posY)/sqrt(sq(img.width)+sq(img.height));
      mouseDist = norm(mouseDist,0,1);
      //println("Mouse dist = "+mouseDist);
      
      int loc = posX + posY*img.width;
      
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      
      //fill(r,g,b,100);
      fill(r,g,b);
      
      
      float w = random(1,20) + 20*pow(1-mouseDist,15);
      float h = random(1,20) + 20*pow(1-mouseDist,15);
      rect(posX,posY,w,h);
      //rect(posX,posY,posX+w,posY+h);
      //ellipse(posX,posY,w,h);
      
    }
  }

}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#D4D0C8", "imageBlocks" });
  }
}
