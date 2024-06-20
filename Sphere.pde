class Sphere
{
  PVector pos;
  float radius;
  RTMaterial mat;
  
  Sphere(PVector pos, float radius)
  {
    this.pos = pos;
    this.radius = radius;
  }
  
  void setRTMaterial(RTMaterial mat)
  {
    this.mat = mat;
  }
}
