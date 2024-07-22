// Settings
int MAX_BOUNCE = 1 ;
int SAMPLE_COUNT = 50;

Camera cam;
Sphere sphere;
Material testMat;
Sphere[] spheres;

void setup()
{ 
  // Setting up screen
  size(800, 800);
  background(0);
  noStroke();
  
  // Object init
  cam = new Camera(60f, 60f);
  spheres = new Sphere[] {
    new Sphere(new PVector(0, 0, 3), 0.3),
  };
  
  cam.render();
  save("image.png");
}

void draw()
{
}

void keyPressed()
{
}

color colorMult(color firstColor, color secondColor)
{
  float red = red(firstColor) / 255f * ( red(secondColor) / 255f );
  float green = green(firstColor) / 255f * ( green(secondColor) / 255f );
  float blue = blue(firstColor) / 255f * ( blue(secondColor) / 255f );
  return color(red * 255f, green * 255f, blue * 255f);
}

color averageColor(color[] colors)
{
  float red = 0f;
  float green = 0f;
  float blue = 0f;
  for (int i = 0; i < colors.length; i++)
  {
    red += red(colors[i]);
    green += green(colors[i]);
    blue += blue(colors[i]);
  }
  
  return color(red / colors.length, green / colors.length, blue / colors.length);
}

void printColor(color clr)
{
  print(red(clr));
  print(", " + green(clr));
  println(", " + blue(clr));
}
