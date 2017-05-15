import geomerative.*;

RShape shape;

void setup() {
  size(1280, 720, P2D); 
  smooth(8);

  RG.init(this);
  shape = RG.getText("Type & Design", "Merriweather-BlackItalic.ttf", 175, CENTER);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  fill(0);
  stroke(0);
  shape.draw();
}

void keyPressed() {
}