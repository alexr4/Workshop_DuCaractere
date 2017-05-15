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
  float targetDist = 10;//norm(mouseX, 0, width) * 10;
  float targetMargin = ntimePortion * 100;

  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(polygonLength);


  //for each
  for (RShape s : shape.children) {
    RPoint[] points = s.getPoints();
    if (points != null) {

      noFill();
      noStroke();
      stroke(0);
      beginShape();
      for (int i=0; i<points.length; i++) {
        RPoint p = points[i];
        for (int j=0; j<points.length; j++) {
          RPoint pnext = points[j];
          if (p != pnext) {
            float distance = dist(p.x, p.y, pnext.x, pnext.y);
            if (distance > targetDist - targetMargin && distance < targetDist + targetMargin) {
              line(p.x, p.y, pnext.x, pnext.y);
            }
          }
        }
        endShape();
      }
    }
  }
}

void keyPressed() {
}