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

public class imageBlocksSmear extends PApplet {

PImage img;
PixelBlock [] pBlocks;

int samplesX = 150;
int samplesY = 150;

public void setup(){
  
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

public void draw(){
  
  background(0);
  
  for(int y=0;y<samplesY;y++){
    for(int x=0;x<samplesX;x++){
      int ind = x+(samplesX*y);
        pBlocks[ind].update();
        pBlocks[ind].display();
    }
  }
}
class PixelBlock {
  int x, y;
  int x0, y0;
  int w,h;
  int wMin,hMin;
  int wMax,hMax;
  int c;
  PixelBlock(int x_,int y_,int c_){
    x = x_;
    y = y_;
    x0 = x_;
    y0 = y_;
    c= c_;
    randomSeed(x*x*y*y);
    w = floor(random(10,20));
    h = floor(random(10,20));
    wMin = w;
    hMin = h;
    wMax = w + floor(random(10,20));
    hMax = h + floor(random(10,20));
  }
  public void update(){
    float mdist = dist(x,y,mouseX,mouseY);
    if(mdist>200){
      mdist = 200;
    }
    float d = pow(map(mdist,0,200,1,0),2);
    w = floor(map(d,0,1,wMin,wMax));
    h = floor(map(d,0,1,hMin,hMax));
    
    if(mousePressed && (mouseButton == LEFT)){
      int xSm = mouseX - pmouseX;
      int ySm = mouseY - pmouseY;
      x += (xSm * d);
      y += (ySm * d);
    }
    
    if(abs(x-x0)>1){
      x -= ((x-x0)*.25f);
    } else {
      x = x0;
    }
    
    if(abs(y-y0)>1){
      y -= ((y-y0)*.25f);
    } else {
      y = y0;
    }
  }
  public void display(){
    rectMode(CENTER);
    fill(c);
    rect(x,y,w,h);
  }
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#D4D0C8", "imageBlocksSmear" });
  }
}
