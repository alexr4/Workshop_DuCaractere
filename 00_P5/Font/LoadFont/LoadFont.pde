PFont font;

void setup() {
  size(640, 360, P2D); 
  smooth(8);
  font = loadFont("ACaslonPro-SemiboldItalic-175.vlw");
}

void draw() {
  background(255);
  stroke(255, 0, 0);
  line(0, height/2, width, height/2);

  textMode(SHAPE);
  textFont(font);
  textSize(175);
  textAlign(CENTER, BOTTOM);

  fill(0); 
  text("Type", width/2, height/2);
}