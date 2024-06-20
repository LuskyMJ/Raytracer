class RayHitInfo
{
  boolean didHit;
  PVector hitPoint, hitNormal;
  RTMaterial hitMaterial;
  
  RayHitInfo(boolean didHit)
  {
    this.didHit = didHit;
  }
}
