int lifetime; 
Particle[] particles;
int totalparticles;


void setup(){
  colorMode(HSB);
  background(0);
  size(300, 200);
  textSize(28);
  
  lifetime = 99999;
  totalparticles = 500;
  
  //creates the particle array and fills them with particles
  particles = new Particle[totalparticles];
  for(int i = 0; i < totalparticles; ++i){
    particles[i] = new Particle(255, -60, 0.05, 0.05, random(-3,3), random(-3, 3), random(-150, 150), random(-150, 150));
  }
  
  
  
}

void draw(){
  
  //displays the particle lifetime
  background(0);
  fill(255, 0, 255);
//text("particle lifetime:" + lifetime, 24, 40);
  
  //updates the particles every frame and replaces them if their lifespan is below 0
  for (int i = 0; i < totalparticles; ++i){
    particles[i].update();
    particles[i].show();
    particles[i].checkwallboundaries();
    particles[i].checkparticleboundaries(particles);
    if(particles[i].isDead() == true){
      particles[i] = new Particle(particles[i].mouseSpeedToColour(), lifetime+int(random(-50, 50)), 0.05, 0.05, random(-10,10), random(-10, 10), random(-150, 150), random(-150, 150));
    }
  }
}


//keybinds to increase or decrease the particle lifespan using the up and down arrow keys
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      lifetime += 20;
    }  
     if (keyCode == DOWN) {
     lifetime -= 20;
    } 
  }
}
