//global parameters

PImage mizuki;
int dimension;


void setup(){
  //loads the image in
  mizuki = loadImage("mizukismol.png");
  
  //defines the amount of total pixels in the image for later use in the pixels array
  dimension = mizuki.height * mizuki.width;
  size(600,600);
  colorMode(HSB, 600, 100, 100);
}

void draw() {
  mizuki = loadImage("mizukismol.png");
  mizuki.loadPixels();
  //goes through the pixel array and adjusts the hue and saturation of the pixels
 for(int i = 0; i < dimension; i++){
    mizuki.pixels[i] = color(hueshifter(hue(mizuki.pixels[i])), saturationshifter(saturation(mizuki.pixels[i])), brightness(mizuki.pixels[i]));
  }
  //updates and displays the modified image
  mizuki.updatePixels();
  image(mizuki, 0, 0);
  
  
}

float hueshifter(float currentcolour){
  float newcolour;
  float mousepos = mouseX; 
  //remaps the value of the mouseX position from 0-600 to -450-450
  mousepos = map(mousepos, 0, 600, -450, 450);
  //adds the value of mouse pos to the hue value passed in the function
  newcolour = currentcolour + mousepos;
  
  //if newcolour is greater than 600 or below 0, these conditionals "loop" the value back to within the 0-600 range
  if(newcolour > 600){
  newcolour = newcolour - 600;
  }
  if(newcolour < 0){
   newcolour = newcolour + 600;
  }
  return newcolour;
}

float saturationshifter(float currentsaturation){
  float mousepos = mouseY;
  //remaps the mouseY value from 0 to a maximum of 2 times the saturation value passed through the function
  float newsaturation = map(mousepos, 0, 600, 0, currentsaturation*2);
  
  return newsaturation;
}
