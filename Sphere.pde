class Sphere
{
  PVector position;
  float radius;
  Material material;
  
  Sphere(PVector position, float radius)
  {
    this.position = position;
    this.radius = radius;
  }
  
  void setMaterial(Material material)
  {
    this.material = material;
  }
}
