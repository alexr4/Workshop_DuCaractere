import geomerative.*;

RShape shape;



void setup() {
  size(1280, 720, P2D); 
  smooth(8);

  RG.init(this);
  //shape = RG.getText("Type & Design", "Merriweather-BlackItalic.ttf", 100, CENTER);
  shape = RG.loadShape("type.svg");
  shape = RG.centerIn(shape, g);
  shape.scale(0.75);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  RG.ignoreStyles(true); 
  fill(127);
  stroke(0);
  //shape.draw();

  float polygonLength = 1.0;

  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(polygonLength);


  //for each
  blendMode(MULTIPLY);
  for (RShape s : shape.children) {
    RPoint[] points = s.getPoints();
    if (points != null) {

      noFill();
      noStroke();
      stroke(0);
      for (int j=0; j<3; j++) {
        float nox = noise(j * 0.01, frameCount * 0.01) * 0.25;
        float noy = noise(j * 0.015, frameCount * 0.015) * 0.25;
        beginShape();
        for (int i=0; i<points.length; i++) {
          RPoint p = points[i];
          float noix = noise(i * 0.05 * nox, j * 0.05 * nox, frameCount * 0.05 * nox);
          float noiy = noise(i * 0.075 * noy, j * 0.075 * noy, frameCount * 0.075 * noy);
          float offsetX = sin(noix * PI); 
          float offsetY = sin(noiy * PI);
          float marginX = (nox + noy + noix * 0.25 + noiy * 0.25) * 30;
          float marginY = (nox + noy + noix * 0.25 + noiy * 0.25) * 30;

          if (j==0) {
            stroke(255, 0, 0);
          } else if (j == 1) {
            stroke(0, 255, 0);
          } else {
            stroke(0, 0, 255);
          }

          vertex(p.x + offsetX * marginX, p.y + offsetY * marginY);
        }
        endShape();
      }
    }
  }
}

void keyPressed() {
}