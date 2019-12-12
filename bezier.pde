ArrayList<ControlPoint> conpts = new ArrayList<ControlPoint>();
ArrayList<Curve> curves = new ArrayList<Curve>();

void setup () {
  size (700, 805);
  curves.add(new Curve (3));
  
  
  conpts.add(new ControlPoint(200, 200));
  conpts.add(new ControlPoint(200, 120));
  conpts.add(new ControlPoint(500, 750));
}

void draw (){
  background(250);
  // Draw grid
  int dim = max (width, height);
  for (int p = 0; p < dim; p++){
    stroke(200);
    strokeWeight(0.5);
    
    if (p % 50 == 0) 
      strokeWeight(1);
    if (p % 10 == 0){
      line (p, 0, p, height);
      line (0, p, width, p);
    }
  }
  
  
  // Update all control points
  for (Curve c: curves) {
    c.update(true, true);
  }
  
  // Interpolate curves
  /*
  for (float l = 0; l <= 1; l += 0.01){
    CurveLin c = new CurveLin(conpts.get(0), conpts.get(1));
    Vector2 lerp = c.getLerp(l);
    
    strokeWeight(1);
    stroke (240, 0, 0);
    point(lerp.x, lerp.y);
  }*/
  /*
  for (float l = 0; l <= 1; l += 0.01){
    //println("l:"+l);
    curves.get(0).getLerp(l);
  }*/
  curves.get(0).getLerp(0.5);
}

void mousePressed(){
  // Grabbing control Points
  if (mouseButton == LEFT) {
    ControlPoint close = null; // Closest control point to mouse
    for (Curve c: curves) {
      for (ControlPoint cp: c.points){
        if (cp.mDist() < ControlPoint.activeDist){ // Find all points within mouse's range
          if (close == null){
            close = cp;
          } else {
            if (cp.mDist() < close.mDist()){
              close = cp;
            }
          }
        }
      }
    }
    
    if (close != null)
      close.grab = true;
  }
}

void mouseReleased (){
  // Mouse drag release
  if (mouseButton == LEFT){
    for (Curve c: curves){
      for (ControlPoint cp: c.points){
        cp.grab = false; 
      }
    }
  }
}
// Distance formula that'll probably be used a lot
float distance (float x1, float y1, float x2, float y2) {
  return sqrt(sq(x1-x2)+sq(y1-y2));
}
