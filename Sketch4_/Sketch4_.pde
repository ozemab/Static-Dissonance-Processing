//create image of television and colored bars 
PImage television;
PImage coloredbars;


void setup () {
  //set window size to match dimensions of television
  size (700, 500);
  //load image of television to fit entire processing window
  television = loadImage("TV.jpg");  
  image (television, 0, 0);
  //load image of colored bars to fit TV screen 
  coloredbars = loadImage("coloredbars.jpg");
  image (coloredbars, 67, 67, 450, 330);
}

void draw () {
  noStroke();
for (int i = 0; i < 5000; i++){
  float x = random (mouseX);
  float y = random (mouseY);
  
  color c = coloredbars.get(int(x), int(y));
  fill (c);
  ellipse (x, y, 5, 5);
  
  float xx = random (mouseX);
  float yy = random (mouseY);
  color w = television.get(int(xx), int(yy));
  fill (w);
  rect (xx, yy, 5, 5);
}
}
