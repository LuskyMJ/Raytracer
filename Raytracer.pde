Camera cam;
Sphere sphere;
RTMaterial testMat;

void setup()
{
  // Setting up screen
  size(800, 800);
  //fullScreen();
  background(0);
  noStroke();
  
  // Object init
  cam = new Camera(60f, 60f);
  sphere = new Sphere(new PVector(0, 0, 2), 0.3);
}

void draw()
{
  background(0);
  cam.render();
}

void keyPressed()
{
}
