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
  for (RShape s : shape.children) {
    RPoint[] points = s.getPoints();
    if (points != null) {
      int targetFPS = 60 * 4;
      float ntime = norm(frameCount % targetFPS, 0, targetFPS);
      float nTimePortion = norm(ntime % 0.5, 0, 0.5);
      int bTween = 0;
      int eTween = 0;
      if (ntime < 0.5) {
        bTween = 0;
        eTween = round(nTimePortion * points.length);
      } else {
        eTween = points.length;
        bTween = round(nTimePortion * points.length);
      }

      noFill();
      noStroke();
      beginShape();
      for (int i=bTween; i<eTween; i++) {
        float normWeight = sin(norm(i, bTween, eTween) * PI);
        strokeWeight(normWeight * 2);
        stroke(255 - normWeight * 255);
        RPoint p = points[i];
        vertex(p.x, p.y);
      }
      endShape();
    }
  }
}

void keyPressed() {
}