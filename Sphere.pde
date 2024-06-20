class Sphere
{
  PVector position;
  float radius;
  RTMaterial mat;
  
  Sphere(PVector position, float radius)
  {
    this.position = position;
    this.radius = radius;
  }
  
  void setRTMaterial(RTMaterial mat)
  {
    this.mat = mat;
  }
}
