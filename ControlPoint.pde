class ControlPoint {
  public float x;
  public float y; 
  public boolean hover;
  public boolean grab; // If it is held by the mouse
  public color cor = color(0, 0, 128);
  
  public static final float activeDist = 8; // Mouse distance from point to make dragable
  public static final int pointSm = 5;
  public static final int pointLg = 8;
  
  public ControlPoint (float _x, float _y){
    x = _x; y = _y;
  }
  
  public void update (boolean disp) {
    float mDist = sqrt(sq(x-mouseX)+sq(y-mouseY));
    hover = mDist <= activeDist;
    
    stroke (cor);
    if (hover) {
      strokeWeight(pointLg);
    }else{
      strokeWeight(pointSm);
    }
    
    if (grab) { // Dragging point
      x = mouseX;
      y = mouseY;
    }
      
    if (disp)
      point (x, y);    
  }

  public float mDist (){
    return distance (mouseX, mouseY, x, y);
  }
}
