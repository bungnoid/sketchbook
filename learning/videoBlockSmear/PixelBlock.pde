class PixelBlock {
  int x, y;
  int x0, y0;
  int w,h;
  int wMin,hMin;
  int wMax,hMax;
  color c;
  PixelBlock(int x_,int y_,color c_){
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
  void update(color c_){
    float mdist = dist(x,y,mouseX,mouseY);
    if(mdist>200){
      mdist = 200;
    }
    float d = pow(map(mdist,0,200,1,0),2);
    w = floor(map(d,0,1,wMin,wMax));
    h = floor(map(d,0,1,hMin,hMax));
    
    c = c_;
    
    if(mousePressed && (mouseButton == LEFT)){
      int xSm = mouseX - pmouseX;
      int ySm = mouseY - pmouseY;
      x += (xSm * d);
      y += (ySm * d);
      if(x<0) x=0;
      if(x>width) x=width;
      if(y<0) y=0;
      if(y>height) y=height;
    }
    
    if(abs(x-x0)>1){
      x -= ((x-x0)*.25);
    } else {
      x = x0;
    }
    
    if(abs(y-y0)>1){
      y -= ((y-y0)*.25);
    } else {
      y = y0;
    }
  }
  void display(){
    rectMode(CENTER);
    fill(c);
    rect(x,y,w,h);
  }
}
