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


  int res = round(map(mouseX, 0, width, 3, 6));
  for (int i=0; i<width/res; i++) {
    for (int j=0; j<height/res; j++) {
      int bx = res / 2 + i * res;
      int by = res / 2 + j * res;
      int pixelIndex = bx + by * width;
      color coloPixel = offscreenTexture.pixels[pixelIndex];

      if (coloPixel == color(255)) {
        float grey = 127.0/2.0 + noise(i * 0.2, j*0.15, frameCount * 0.05) * 255;
        float noiseRes = noise(i * 0.1, j*0.1, frameCount * 0.025) * (res * 5.0);
        float angle = noise(i * 0.1, j*0.1, frameCount * 0.01) * TWO_PI;
        float ex = bx + cos(angle) * (noiseRes * 2);
        float ey = by + sin(angle) * (noiseRes * 2);
        
        beginShape(LINES);
        stroke(grey, 255);
        vertex(bx, by);
        stroke(0, 0);
        vertex(ex, ey);
        endShape();
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