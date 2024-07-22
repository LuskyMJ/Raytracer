class RayHitInfo
{
  boolean didHit;
  PVector hitPoint, normal;
  float hitDist;
  Material hitMaterial;
  
  RayHitInfo(boolean didHit)
  {
    this.didHit = didHit;
  }
}
