PFont font;
PGraphics offscreenTexture;

//debug
boolean debug;

void setup() {
  size(1280, 720, P2D); 
  smooth(8);
  font = createFont("ACaslonPro-SemiboldItalic", 20);

  offscreenTexture = createGraphics(width, height, P2D);
  offscreenTexture.smooth(8);
}

void draw() {
  //draw into texture
  offscreenTexture.beginDraw();
  offscreenTexture.background(0);
  offscreenTexture.textFont(font);
  offscreenTexture.textMode(SHAPE);
  offscreenTexture.textSize(200);
  offscreenTexture.textAlign(CENTER);
  offscreenTexture.fill(255);
  offscreenTexture.text("Type & Design", width/2, height/2);
  offscreenTexture.endDraw();
  offscreenTexture.loadPixels();

  background(255);


  int res = round(1 + noise(frameCount * 0.01) * 20);
  for (int i=0; i<width/res; i++) {
    for (int j=0; j<height/res; j++) {
      int x = i * res;
      int y = j * res;
      int pixelIndex = x + y * width;
      color coloPixel = offscreenTexture.pixels[pixelIndex];

      if (coloPixel == color(0)) {
        fill(0);
        noStroke();
        rect(x, y, res, res);
      }

      if (debug) {
        noFill();
        stroke(255, 0, 0);
        rect(x, y, res, res);
      }
    }
  }
  
  
  float scale = 0.15;
  image(offscreenTexture, 0, 0, offscreenTexture.width * scale, offscreenTexture.height * scale);
}

void keyPressed() {
  if (key == 'd') {
    debug = !debug;
  }
}