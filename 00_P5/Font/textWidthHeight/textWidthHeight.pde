
void setup() {
  size(640, 360, P2D); 
  smooth(8);
}

void draw() {
  background(255);
  stroke(255, 0, 0);
  line(0, height/2, width, height/2);


  String txt = "Type";
  if (mousePressed) {
    textMode(SHAPE); //VECTOR RENDER
  } else {
    textMode(MODEL); //TEXTURE RENDER
  }
  textAlign(CENTER, CENTER);
  textSize(175);
  fill(0); 
  text(txt, width/2, height/2);
  
  stroke(255, 0, 0);
  float textWidth = textWidth(txt);
  float textHeightAscent = textAscent();
  float textHeightDescent = textDescent();
  line(textWidth, height/2 + textHeightAscent, textWidth, height/2 - textHeightDescent); 

}