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


  int res = round(map(mouseX, 0, width, 3, 12));
  for (int i=0; i<width/res; i++) {
    for (int j=0; j<height/res; j++) {
      int bx = res / 2 + i * res;
      int by = res / 2 + j * res;
      int pixelIndex = bx + by * width;
      color coloPixel = offscreenTexture.pixels[pixelIndex];

      float noisePixel = noise(i * 0.15, j*0.25, frameCount * 0.035);
      if (coloPixel == color(255) && noisePixel > 0.40) {
        float grey = noise(i * 0.2, j*0.15, frameCount * 0.05) * 127;
        float noiseRes = noise(i * 0.1, j*0.1, frameCount * 0.025) * res * 2.0;
        fill(grey, 255);
        noStroke();
        rectMode(CENTER);
        ellipse(bx, by, noiseRes, noiseRes);
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