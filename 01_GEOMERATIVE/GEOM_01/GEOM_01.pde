import geomerative.*;

RShape shape;

void setup() {
  size(1280, 720, P2D); 
  smooth(8);

  RG.init(this);
  shape = RG.getText("Type & Design", "Merriweather-BlackItalic.ttf", 100, CENTER);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  fill(0);
  stroke(0);
  
  //gett all letter
  for (int i=0; i<shape.children.length; i++) {
    RShape childShape = shape.children[i];
    float angle =  -0.025 + i%2 * 0.05;
    childShape.rotate(angle, childShape.getCenter());
    //childShape.draw(); //draw child shape
  }
  shape.rotate(0.005, shape.getCenter());
  shape.draw();
}

void keyPressed() {
}