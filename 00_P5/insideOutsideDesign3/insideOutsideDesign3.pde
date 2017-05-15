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


  int resX = 1;
  int resY = 1 + round(map(mouseY, 0, height, 3, 30));
  blendMode(MULTIPLY);
  for (int j=0; j<height/resY; j++) {
    float noiseLine = noise(j * 0.1, frameCount * 0.1);
    int resDeviation = round(noiseLine * 4); 
    for (int i=0; i<width/resX; i++) {
      int bx = resX / 2 + i * resX;
      int by = resY / 2 + j * resY; 
      int pixelIndex = bx + by * width;
      color coloPixel = offscreenTexture.pixels[pixelIndex];
      float noiseCrush = noise(i * 0.3, j*0.25) * 0.5 + noiseLine * 0.5;
      if (coloPixel == color(255) && noiseCrush > 0.5) {
        float noiseRes = noise(i * 0.2, j*0.15, frameCount * 0.05) * resDeviation;
        float randResR =  noiseRes + random(resDeviation * 8.0);
        float randResG =  noiseRes + random(resDeviation * 8.0);
        float randResB =  noiseRes + random(resDeviation * 8.0);

        noStroke();
        rectMode(CENTER);
        fill(255, 0, 0);
        rect(bx, by, resX + randResR, resY);
        fill(0, 255, 0);
        rect(bx, by, resX + randResG, resY);
        fill(0, 0, 255);
        rect(bx, by, resX + randResB, resY);
      }
    }
  }
  blendMode(NORMAL);


  float scale = 0.15;
  image(offscreenTexture, 0, 0, offscreenTexture.width * scale, offscreenTexture.height * scale);
}

void keyPressed() {
  if (key == 'd') {
    debug = !debug;
  }
}