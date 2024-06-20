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
    return origin.copy().add(direction.copy().mult(length));
  }
  
  RayHitInfo checkCollision(Sphere sphere)
  {
    PVector difference = sphere.pos.copy().sub(origin);
    float a = direction.dot(direction);
    float b = -2.0 * direction.dot(difference);
    float c = difference.dot(difference) - sphere.radius * sphere.radius;
    float discriminant = b*b - 4*a*c;
    
    if (discriminant > 0)
    {
      float firstDist = (-b + sqrt(discriminant)) / 2 * a;
      float secondDist = (-b - sqrt(discriminant)) / 2 * a;
    }
    
    else return new RayHitInfo(false);
  }
}
