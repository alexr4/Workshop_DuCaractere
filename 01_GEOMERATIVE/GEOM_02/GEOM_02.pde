import geomerative.*;

RShape shape;
RPoint[] points;

boolean debug;


void setup() {
  size(1280, 720, P2D); 
  smooth(8);

  RG.init(this);
  shape = RG.getText("Type & Design", "Merriweather-BlackItalic.ttf", 100, CENTER);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  fill(0);
  stroke(0);
  //shape.draw();

  float polygonLength = 1 + norm(mouseX, 0, width) * 20;

  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(polygonLength);
  points = shape.getPoints();

  //for All
  if (points != null) {
    if (debug) {
      stroke(0, 0, 255);
      noFill();
      beginShape();
      for (RPoint p : points) {
        vertex(p.x, p.y);
      }
      endShape();
    }

    fill(0);
    noStroke();
    for (int i=0; i<points.length; i++) { 
      float x = points[i].x;
      float y = points[i].y;
      ellipse(x, y, 4, 4);
    }
  }

  //for each
  for (RShape s : shape.children) {
    RPoint[] points = s.getPoints();
    if (points != null) {
      if (debug) {
        stroke(0, 255, 0);
        noFill();
        beginShape();
        for (RPoint p : points) {
          vertex(p.x, p.y);
        }
        endShape();
      }

      fill(0);
      noStroke();
      for (int i=0; i<points.length; i++) { 
        float x = points[i].x;
        float y = points[i].y;
        ellipse(x, y, 4, 4);
      }
    }
  }
}

void keyPressed() {
  debug = !debug;
}