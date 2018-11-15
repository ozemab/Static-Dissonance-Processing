//create image of television and colored bars 
PImage television;
PImage coloredbars;

//create strings displaying different phrases for each distortion phase 
String h = "Hello human";
String w = "Welcome to The Underworld";
String t = "Time up";

//variable allowing user to cycle between different types of distortions 
int distortion = 1;

//variable causing letters to appear one by one from each string of text 
int letters;

void setup () {
  //set window size to match dimensions of television
  size (700, 500);
  //load image of television
  television = loadImage("TV.jpg");  
  //load image of colored bars
  coloredbars = loadImage("coloredbars.jpg");

  //load television to fit entire processing window with colored bars on top of tv screen
  image (television, 0, 0);
  image (coloredbars, 67, 67, 450, 330);

  //load font, Courier New, size 50
  smooth();
  PFont f = createFont("Courier New", 25);
  textFont(f);
}


void draw () {
  //normal televion, no issues
  if (distortion == 1) {
    //draw television to fit entire processing window with colored bars on top of screen
    image (television, 0, 0);
    image (coloredbars, 67, 67, 450, 330);

    //phrase is typed out without input from the user
    fill (0);
    if (letters <= h.length())
      text(h.substring(0, letters), width/3, height/2);
    //makes text appear slowly 
    if (frameCount%20==0)
      letters++;
  }  

  if (distortion == 2) {
    //draw television to fit entire processing window with colored bars on top of screen
    image (television, 0, 0);
    image (coloredbars, 67, 67, 450, 330);

    //phrase is typed out without input from the user starting at 15 seconds
    if (millis () > 15000) {
      fill (0);
      if (letters <= w.length())
        text(w.substring(0, letters), width/9, height/2);
      //makes text appear slowly
      if (frameCount%30==0)
        letters++;
    }

    //adapted from Generative Design: P_4_1_2_01.pde
    //tv+screen are loaded into processing window and sections of the images are copied to slightly different positions (randomly selected)
    int x1 = (int) random(20, 80);
    int y1 = 0;

    int x2 = round(x1 + random(-5, 5));
    int y2 = round(random(-2, 2));
    //width and height of tv+screen distorted slightly based on mouse position (copied and moved) 
    int w = (int) mouseX; 
    constrain(mouseX, 50, 80);
    int h = (int) mouseY; 
    constrain(mouseY, 300, 400);

    copy(x1, y1, w, h, x2, y2, w, h);
  }


  if (distortion == 3) {
    noStroke();
    //rectangles take on color of images (tv+screen) depending on mouse position 
    for (int i = 0; i < 4000; i++) {
      float x = random (mouseX);
      float y = random (mouseY);
      color c = coloredbars.get(int(x), int(y));
      fill (c);
      rect (x, y, 20, 2);

      float xx = random (mouseX);
      float yy = random (mouseY);
      color w = television.get(int(xx), int(yy));
      fill (w);
      rect (xx, yy, 20, 2);
    }
  }



  if (distortion == 4) {
    //adapted from Generative Design: P_4_1_2_01.pde
    //tv+screen are loaded into processing window and sections of the images are copied to slightly different positions (randomly selected)
    int x1 = (int) random(70, 80);
    int y1 = 0;

    int x2 = round(x1 + random(-5, 5));
    int y2 = round(random(-2, 2));

    int w = (int) mouseX; 
    constrain(mouseX, 70, 80);
    int h = (int) mouseY; 
    constrain(mouseY, 300, 400);

    copy(x1, y1, w, h, x2, y2, w, h);
  }
}

//pressing a key allows user to cycle between different types of distortions 
void keyPressed() {
  distortion = distortion + 1;
  if (distortion > 4) {
    distortion = 1;
    //when distortion type reaches phase four image resets so that static from phase three does not carry over
  } else if (distortion == 4) {
    image (television, 0, 0);
    image (coloredbars, 67, 67, 450, 330);
  }
}
