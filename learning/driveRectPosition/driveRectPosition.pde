MotileRect mov = new MotileRect(new PVector(40, 94), 5, 5, 0, 0, 255, new PVector(0, 0));

boolean[] keys = new boolean[526];
boolean checkKey(String k) {
  for (int i = 0; i < keys.length; i++) {
    if (KeyEvent.getKeyText(i).toLowerCase().equals(k.toLowerCase())) {
      return keys[i];
    }
  }
  return false;
}
void keyPressed()
{
  keys[keyCode] = true;
}
 
void keyReleased()
{
  keys[keyCode] = false;
}
void setup() {
  size(1300, 600);
}
void draw() {
  background(150);
  mov.update();
  mov.render();
  if (checkKey("W")) {
    mov.speed.y -= .1;
  }
  if (checkKey("S")) {
    mov.speed.y += .1;
  }
  if (checkKey("A")) {
    mov.speed.x -= .1;
  }
  if (checkKey("D")) {
    mov.speed.x += .1;
  }
  if (checkKey("T")) {
    mov.pos = new PVector(50,50);
  }
}

class Rectangle {
  PVector pos;

  int h;
  int w;

  int r;
  int g;
  int b;

  /*Rectangle (float c1x, float c1y) { //constructor
x = c1x;
y = c1y;
h = 20;
w = 20;
r = round(random(255));
g = round(random(255));
b = round(random(255));
}*/

  Rectangle (PVector inpos, int inw, int inh, int inr, int ing, int inb) { //define with a vector
    pos = inpos;
    h = inh;
    w = inw;
    r = inr;
    g = ing;
    b = inb;
  }

  void render () {
    fill(r, g, b);
    noStroke();
    rect(pos.x, pos.y, w, h);
  }
}

class MotileRect extends Rectangle {
  PVector speed; //in pixels per 1/10th second.
  Trigger timer;
  MotileRect(PVector inpos, int inw, int inh, int inr, int ing, int inb, PVector inspd) {
    super(inpos, inw, inh, inr, ing, inb);
    speed = inspd;
    timer = new Trigger(10);
  }
  void update() {
    while (timer.fires ()) {
      pos.add(speed);
    }
  }
}

// The trigger class, by kritzikratzi
class Trigger {
  long start = millis();
  int rate;

  public Trigger( int rate ) {
    this( rate, false );
  }
  /**
* additional boolean parameter to indicate whether the trigger
* should fire immediately
*/
  public Trigger( int rate, boolean immediately) {
    setRate( rate );
    if ( immediately ) start -= rate;
  }

  /**
* changes the rate at which the trigger fires in milliseconds
*/
  public void setRate( int rate ) {
    this.rate = rate;
  }
  public int getRate() {
    return rate;
  }
  /**
* returns true if the trigger has fired, false otherwise
*/
  public boolean fires() {
    if ( millis() - start >= rate ) {
      start += rate;
      return true;
    }
    else {
      return false;
    }
  }
  /**
* resets the timer,
* next trigger will occur in _rate_ milliseconds.
*/
  public void reset() {
    start = millis();
  }
}

