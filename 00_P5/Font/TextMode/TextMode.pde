
void setup() {
  size(640, 360, P2D); 
  smooth(8);
}

void draw() {
  background(255);
  stroke(255, 0, 0);
  line(0, height/2, width, height/2);



  if (mousePressed) {
    textMode(SHAPE); //VECTOR RENDER
  } else {
    textMode(MODEL); //TEXTURE RENDER
  }
  textAlign(CENTER, CENTER);
  textSize(175);
  fill(0); 
  text("Type", width/2, height/2);
}