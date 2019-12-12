public class CurveLin {
  ControlPoint p1;
  ControlPoint p2;
  
  public CurveLin (ControlPoint _p1, ControlPoint _p2){
    p1 = _p1; p2 = _p2;
  }
  
  public Vector2 getLerp (ControlPoint _p1, ControlPoint _p2, float lambda) {
    lambda = constrain(lambda, 0, 1);
    float lX = ((_p2.x-_p1.x)*lambda)+p1.x;
    float lY = ((_p2.y-_p1.y)*lambda)+p1.y;
    
    return new Vector2(lX, lY);
  }
  
  public Vector2 getLerp (float lambda){
    return getLerp (p1, p2, lambda);
  }
  
}

public class Curve {
  ArrayList<ControlPoint> points = new ArrayList<ControlPoint>(); // List of points in order 
  
  public Curve (int n) {
    float iX = 10; // Position the first point will be placed at
    float iY = 10;
    for (int i = 0; i < n; i++){
      points.add(new ControlPoint(iX, iY));
      points.get(i).x = random(0, width);
      points.get(i).y = random(0, height);
      
      /*if (points.size() > 0){ // Space each new point apart 
        iX = points.get(i).x + 20;
        iY = points.get(i).y + 20;
      }*/

    }
    println(points.size()+" points\n");
  } 
  
  public Vector2 getLerp (float lambda) {
    lambda = constrain (lambda, 0, 1); // Interpolation position
    ArrayList<Vector2> curPoints = new ArrayList<Vector2>();
    ArrayList<Vector2> newPoints = new ArrayList<Vector2>(); // Temp list
 
    for (ControlPoint p: points) {
      curPoints.add(new Vector2(p.x, p.y));
    }
    
    //while (curPoints.size() > 1) {
      
      // Interpolate between curPoints and set curPoints to new points
      for (int i = 0; i < curPoints.size()-1; i++) { // Do not include last point
        float x = curPoints.get(i).x + ((curPoints.get(i+1).x - curPoints.get(i).x)*lambda);
        float y = curPoints.get(i).y + ((curPoints.get(i+1).y - curPoints.get(i).y)*lambda);
        stroke (255, 0, 0);
        strokeWeight(4);
        point (x, y);
        
        newPoints.add(new Vector2(x, y)); // Add intermediate points to a temporary list
      }
      println(curPoints.size(), newPoints.size());
      
      curPoints = new ArrayList<Vector2>(newPoints); // Update main list
      println(curPoints.size());
    //}
    
    
    
    return (new Vector2 (0, 0));
  }
  
  public void update (boolean pts, boolean line){
    if (pts){
      int n = 0;
      for (ControlPoint p: points){
        p.update(true);
        fill(51, 135, 0);
        text(n, p.x, p.y);
        n++;
      }
    }
  }
}

  
