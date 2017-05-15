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

  float target = 60 * 4;
  float ntime = norm(frameCount % target, 0, target) * PI;
  float ntimePortion =  0.1 + sin(ntime);


  float polygonLength = ntimePortion * 100.0;
  float targetDist = 2;//norm(mouseX, 0, width) * 10;
  float targetMargin = ntimePortion * 100;

  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(polygonLength);


  //for each
  for (RShape s : shape.children) {
    RPoint[] points = s.getPoints();
    if (points != null) {

      noFill();
      noStroke();
      //stroke(0);
      for (int i=0; i<points.length; i++) {
        RPoint p = points[i];
        for (int j=0; j<points.length; j++) {
          RPoint pnext = points[j];
          for (int k=0; k<points.length; k++) {
            RPoint pnext2 = points[k];
            if (p != pnext && p != pnext2 && pnext != pnext2) {
              float d0 = dist(p.x, p.y, pnext.x, pnext.y);
              float d1 = dist(p.x, p.y, pnext2.x, pnext2.y);
              float d2 = dist(pnext.x, pnext.y, pnext2.x, pnext2.y);
              if (d0 > targetDist - targetMargin && d0 < targetDist + targetMargin
                && d1 > targetDist - targetMargin && d1 < targetDist + targetMargin
                && d2 > targetDist - targetMargin && d2 < targetDist + targetMargin) {
                float noiseR = noise(i * 0.01, (j + k) * 0.01, frameCount * 0.01) * 255;
                float noiseG = noise(i * 0.15, (j + k) * 0.15, frameCount * 0.015) * 255;
                float noiseB = noise(i * 0.05, (j + k) * 0.05, frameCount * 0.05) * 255;

                beginShape();
                fill(noiseR * 0.1, noiseG, noiseB);
                vertex(p.x, p.y);
                vertex(pnext.x, pnext.y);
                vertex(pnext2.x, pnext2.y);
                endShape();
              }
            }
          }
        }
      }
    }
  }
}

void keyPressed() {
}