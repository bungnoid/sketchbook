import processing.serial.*

final int WIDTH = 1000;
final int HEIGHT = 1000;
final int X_CENTER = WIDTH/2;
final int Y_CENTER = HEIGHT/2;
final int LINE_FEED = 10;

Serial arduinoPort;
Serial sensorData;

int degrees = 0;
int radius = 0;

void setup(){

  size(WIDTH,HEIGHT);
  println(Serial.list());
  String arduinoPortName = Serial.list()[0];
  arduinoPort = new Serial(this, arduinoPortName, 9600);
  arduinoPort.bufferUntil(LINE_FEED);

}

void serialEvent(Serial port){

  

}

SensorData getSensorData(){

}

SensorData parseArduinoData(final String arduinoOutput){

}
