import controlP5.*;

//global parameters

PImage mizuki;
int dimension;
float hueshift;
float brightnessshift;
float saturationshift;
ControlP5 cp5;
Slider abc;


void setup(){
  cp5 = new ControlP5(this);
  
  //loads the image in
  mizuki = loadImage("mizukismol.png");
  
  //defines the amount of total pixels in the image for later use in the pixels array
  dimension = mizuki.height * mizuki.width;
  size(600,600);
  colorMode(HSB, 600, 100, 100);
  
  //add the sliders in
  cp5.addSlider("hueshift")
     .setPosition(50,450)
     .setRange(-450,450)
     ;
     
  cp5.addSlider("brightnessshift")
     .setPosition(50,550)
     .setRange(0,100)
     .setValue(50)
     ;
     
   cp5.addSlider("saturationshift")
     .setPosition(50,500)
     .setRange(-100, 100)
     
     ;
}

void draw() {
  //loads the pixels into the array
  mizuki = loadImage("mizukismol.png");
  mizuki.loadPixels();
  //goes through the pixel array and adjusts the hue, saturation and brightness of the pixels
 for(int i = 0; i < dimension; i++){
    mizuki.pixels[i] = color(hueshifter(hue(mizuki.pixels[i])), saturationshifter(saturation(mizuki.pixels[i])), brightnessshifter(brightness(mizuki.pixels[i])));
  }
  //updates and displays the modified image
  mizuki.updatePixels();
  image(mizuki, 0, 0);
  
  
}
//shifts the hue of the pixels depending on the x position of the mouse
float hueshifter(float currentcolour){
  float newcolour;
  //adds the value of hueshift to the hue value passed in the function
  newcolour = currentcolour + hueshift;
  
  //if newcolour is greater than 600 or below 0, these conditionals "loop" the value back to within the 0-600 range
  if(newcolour > 600){
  newcolour = newcolour - 600;
  }
  if(newcolour < 0){
   newcolour = newcolour + 600;
  }
  return newcolour;
}

//changes the saturation of the pixels based on the sider
float saturationshifter(float currentsaturation){
  //remaps the saturationshift value from 0 to a maximum of 2 times the saturation value passed through the function
  float newsaturation = map(saturationshift, -100, 100, 0, currentsaturation*2);
  
  return newsaturation;
}

//changes the brightness of the pixels based on the slider
float brightnessshifter(float currentbrightness){
  //remaps the brightnessshift value from 0 to a maximum of 2 times the brightness value passed through the function
  float newbrightness = map(brightnessshift, 0, 100, 0, currentbrightness*2);
  return newbrightness;
}
