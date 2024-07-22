class Plane
{
  PVector normal, origin;
  Material material;
  
  Plane(PVector normal, PVector origin)
  {
    this.normal = normal;
    this.origin = origin;
  }
  
  void setMaterial(Material material)
  {
    this.material = material;
  }
}
