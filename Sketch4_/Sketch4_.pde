//declare strings displaying different derogatory words often used to describe women
String b = "bitch";
String h = "hoe";
String c = "crazy";
String d = "dramatic";
String a = "airhead";
//declare image 
PImage img;


void setup () {
  size (375, 500);
  //create font, Karla, size 20
  PFont f = createFont("Karla", 20);
  textFont(f);
  //load image of unused menstrual pad to fill screen
  img = loadImage("Pad2.jpg");  
}

void draw () {
  //draw image 
  image (img, 0, 0);
  float x = random (50, 200);
  float y = random (100, 400);
  //display entire length of string (entire word) making each character appear at a random place on the pad
  for (int i = 0; i < b.length(); i++) {
  char ch = b.charAt(i);
  //letters will be red
  fill (255, 0, 0);
  text(ch, x, y);
  x = x + textWidth (ch);
}
}
