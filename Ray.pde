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
    PVector difference = sphere.position.copy().sub(origin);
    float a = direction.dot(direction);
    float b = -2.0 * direction.dot(difference);
    float c = difference.dot(difference) - sphere.radius * sphere.radius;
    float discriminant = b*b - 4*a*c;
    
    if (discriminant > 0)
    {
      float firstDist = (-b + sqrt(discriminant)) / 2 * a;
      float secondDist = (-b - sqrt(discriminant)) / 2 * a;
      
      float dist;
      if (firstDist < secondDist) dist = firstDist;
      else dist = secondDist;
      
      PVector hitPoint = PVector.add( this.origin, PVector.mult(this.direction, dist) );
      PVector hitNormal = PVector.sub( hitPoint, sphere.position );
      RayHitInfo hitInfo = new RayHitInfo(true);
      hitInfo.hitPoint = hitPoint;
      hitInfo.hitNormal = hitNormal.div(sphere.radius);
      return hitInfo;
    }
    
    else return new RayHitInfo(false);
  }
}
