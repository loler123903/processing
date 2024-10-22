class Particle{
  int colour;
  int lifetime; 
  float xacceleration;
  float yacceleration;
  float xvelocity;
  float yvelocity;
  float x;
  float y;
  
  //constructor
  Particle(int colour, int lifetime, float xacceleration, float yacceleration,  float xvelocity, float yvelocity, float x, float y){
  this.colour = colour;
  this.lifetime = lifetime;
  this.xacceleration = xacceleration;
  this.yacceleration = yacceleration;
  this.xvelocity = xvelocity;
  this.yvelocity = yvelocity;
  this.x = x;
  this.y = y;
  }
  
  
  void update(){
    
    //decreases the lifetime every frame
    this.lifetime -= 2;
    //accelerates the particle in the y direction by increasing the y velocity by the acceleration value
    y += yvelocity;
    yvelocity += yacceleration;
    //deccelerates the particle in the x direction
    x += xvelocity;
    if(xvelocity < 0){
    xvelocity += xacceleration;
  }
  else{
    xvelocity -= xacceleration;
  }
     
  }
  
  //display function
  void show(){
    noStroke();
    fill(colour, 255, 255, lifetime);
    circle(x, y, 8);
  }
  
  //checks the particle's lifetime
  boolean isDead(){
    return (this.lifetime < 0);    
  }
  
  //returns the difference between the last and current mouse position
  int mouseSpeedToColour(){
    int mouseXspeed = 0;
    int mouseYspeed = 0;
    mouseXspeed = abs(pmouseX - mouseX); 
    mouseYspeed = abs(pmouseY - mouseY);
    
    if (mouseXspeed > mouseYspeed){
      return mouseXspeed*2;
    }
    else{
      return mouseYspeed*2;
    }
  }
  
  
  void checkwallboundaries(){
    if(x > width-4){
    x = width-4;
    xvelocity = 0;
    }
    else if(x < 4){
    x = 4;
    xvelocity = 0;
    }
    if(y > height-4){
    y = height-4;
    yvelocity = 0;
    }
    else if(y < 4){
    y = 4;
    yvelocity = 0;
    }
  }

 void checkparticleboundaries(Particle[] particles){
   for(int i = 1; i < 500; i++){
   float distancex= particles[i].x - x;
   float distancey = particles[i].y - y;
   float distance = sqrt(distancex*distancex + distancey * distancey);
   float minDist = 4 + 4;
   //println(distance);
   if(distance < minDist){
     
   }
 }
 }


}
