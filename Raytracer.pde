Camera cam;
Sphere sphere;
RTMaterial testMat;

void setup()
{
  // Setting up screen
  size(200, 200);
  background(0);
  noStroke();
  
  // Object init
  cam = new Camera(60f, 60f);
  sphere = new Sphere(new PVector(0, 0, 1), 0.3);
}

void draw()
{
  cam.render();
}

void keyPressed()
{
}
