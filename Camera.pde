class Camera
{
  float fovX, fovY;
  PVector pos, orientation;
  float focalLength = 1; // Distance to near clipping plane
  
  // For calculation rays
  float vpWidth, vpHeight;
  float pixelDeltaX, pixelDeltaY;
  PVector topLeftPixel;
  
  Camera(float fovX, float fovY)
  {
    this.fovX = radians(fovX);
    this.fovY = radians(fovY);
    
    vpWidth = tan(this.fovX * 0.5f) * focalLength;
    vpHeight = tan(this.fovY * 0.5f) * focalLength;
    pixelDeltaX = vpWidth / width;
    pixelDeltaY = -vpHeight / height;
    
    PVector vpTopLeft = new PVector(-vpWidth * 0.5f, vpHeight * 0.5f, focalLength);
    PVector halfDeltaPixel = new PVector(pixelDeltaX, pixelDeltaY).mult(0.5);
    topLeftPixel = vpTopLeft.add(halfDeltaPixel);
  }
  
  void render()
  {
    //println("Render called");
    test();
    for (int row = 0; row < height; row++)
    {
      for (int column = 0; column < width; column++)
      {
        color[] sampleColors = new color[SAMPLE_COUNT];
        
        for (int i = 0; i < SAMPLE_COUNT; i++)
        {
          float randomX = random(pixelDeltaX) - pixelDeltaX * 0.5f;
          float randomY = random(pixelDeltaY) - pixelDeltaY * 0.5f;
          
          PVector pixelDelta = new PVector(pixelDeltaX * column + randomX, pixelDeltaY * row + randomY);
          PVector rayDir = PVector.add(topLeftPixel, pixelDelta);
          Ray ray = new Ray(new PVector(0, 0, 0), rayDir);
          
          sampleColors[i] = calculateRayColor(ray, 0);
        }
        
        stroke(averageColor(sampleColors));
        point(column, row);
      }
    }
  }
  
  // Collision functions
  color calculateRayColor(Ray ray, int bounceCount)
  {
    ArrayList<RayHitInfo> hits = new ArrayList<RayHitInfo>();
    
    for (Sphere sphere: spheres)
    {
      RayHitInfo hitInfo = hitSphere(ray, sphere);
      if (hitInfo.didHit) hits.add(hitInfo);
    }
    
    // Hit a sphere
    if (hits.size() > 0)
    {
      RayHitInfo hit = hits.get(0);
      //color finalColor = normalToColor(hit.normal);
      color finalColor = color(100);
      
      if (bounceCount >= MAX_BOUNCE) return finalColor;
      
      // Construct bounced ray
      else
      {
        Ray newRay = new Ray(new PVector(0, 0, 0), PVector.random3D());
        if (PVector.dot(newRay.direction, hit.normal) < 0) newRay.direction.mult(-1);
        
        return colorMult( calculateRayColor(newRay, bounceCount + 1),  finalColor );
      }
    }
    
    // Didn't hit a sphere
    else
    {
      float progress = ( ray.normalize().y + 1f ) * 0.5f;
      return lerpColor(color(255), color(0, 255, 255), 1 - progress);
    }
  }
  
  RayHitInfo hitSphere(Ray ray, Sphere sphere)
  {
    PVector difference = PVector.sub(sphere.position, ray.origin);
    float a = ray.direction.dot(ray.direction);
    float b = -2.0 * ray.direction.dot(difference);
    float c = difference.dot(difference) - sphere.radius * sphere.radius;
    float discriminant = b*b - 4*a*c;
    
    if (discriminant > 0)
    {
      float firstDist = (-b + sqrt(discriminant)) / 2 * a;
      float secondDist = (-b - sqrt(discriminant)) / 2 * a;
      
      float dist;
      if (firstDist < secondDist) dist = firstDist;
      else dist = secondDist;
      
      RayHitInfo hitInfo = new RayHitInfo(true);
      hitInfo.hitPoint = PVector.add( ray.origin, PVector.mult(ray.direction, dist) );
      hitInfo.normal = PVector.div( PVector.sub(hitInfo.hitPoint, sphere.position), sphere.radius );
      hitInfo.hitMaterial = sphere.material;
      return hitInfo;
    }
    
    else return new RayHitInfo(false);
  }
  
  color normalToColor(PVector normal)
  {
    return color((normal.x + 1f) * 0.5f * 255f, (normal.y + 1f) * 0.5f * 255f, (normal.z + 1f) * 0.5f * 255f);    
  }
}
