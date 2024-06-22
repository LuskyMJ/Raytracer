Camera cam;
Sphere sphere;
RTMaterial testMat;
Sphere[] spheres;

void setup()
{
  // Setting up screen
  size(800, 800);
  //fullScreen();
  background(0);
  noStroke();
  
  // Object init
  cam = new Camera(60f, 60f);
  spheres = new Sphere[] {
    new Sphere(new PVector(0, 0, 2), 0.3),
    new Sphere(new PVector(0.1, 0.1, 2), 0.1)
  };
}

void draw()
{
  background(0);
  cam.render();
}

void keyPressed()
{
}
