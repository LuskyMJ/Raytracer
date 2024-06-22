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
    
    vpWidth = tan(this.fovX / 2) * focalLength;
    vpHeight = tan(this.fovY / 2) * focalLength;
    pixelDeltaX = vpWidth / width;
    pixelDeltaY = -vpHeight / height;
    
    PVector vpTopLeft = new PVector(-vpWidth / 2, vpHeight / 2, focalLength);
    PVector halfDeltaPixel = new PVector(pixelDeltaX, pixelDeltaY).mult(0.5);
    topLeftPixel = vpTopLeft.add(halfDeltaPixel);
  }
  
  void render()
  {
    println("Render called");
    for (int row = 0; row < height; row++)
    {
      for (int column = 0; column < width; column++)
      {
        PVector pixelDelta = new PVector(pixelDeltaX * column, pixelDeltaY * row);
        PVector rayDir = topLeftPixel.copy().add(pixelDelta);
        Ray ray = new Ray(new PVector(0, 0, 0), rayDir);
        
        
        
        for (Sphere sphere: spheres)
        {
          RayHitInfo hitInfo = ray.checkCollision(sphere);
          if (hitInfo.didHit)
          {
            PVector normal = hitInfo.hitNormal;
            stroke((normal.x + 1f) * 0.5f * 255f, (normal.y + 1f) * 0.5f * 255f, (normal.z + 1f) * 0.5f * 255f);
          }
          else stroke(0, 0, 0);
          point(column, row);
        }
      }
    }
  }
}
