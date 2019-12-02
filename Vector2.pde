public class Vector2 { 
  public float x;
  public float y;
  
  public Vector2 (float _x, float _y){
    x =_x;
    y =_y;
  }
  
  public Vector2 (){ x = 0; y = 0; }
  
  public float getMag(){
    return sqrt((x*x)+(y*y));
  }
  
  public Vector2 normalized (){
    return new Vector2(x/getMag(), y/getMag());
  }
}
