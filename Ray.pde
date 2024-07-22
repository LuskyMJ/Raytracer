class Ray
{
  PVector origin, direction;
  
  Ray(PVector origin, PVector direction)
  {
    this.origin = origin;
    this.direction = direction;
  }
  
  PVector at(float length)
  {
    return PVector.add( origin, PVector.mult(direction, length) );
  }
  
  PVector normalize()
  {
    return direction.normalize();
  }
}
