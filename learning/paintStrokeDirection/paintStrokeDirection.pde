void setup(){
  size(1280,720);
  stroke(255);
  background(0);
}

void draw(){  
  if(mousePressed){
    int i = 0;
    int n = 0;
    for(i=0;i<50;i++){
      stroke(random(255),random(255),random(255),random(255));
      line(mouseX, mouseY, (pmouseX+(random(20)-10)), (pmouseY+(random(20)-10)));
      for(n=0;n<10;n++){
        point((mouseX+(random(40)-20)), (mouseY+(random(40)-20)));
      }
    }
  }
}
