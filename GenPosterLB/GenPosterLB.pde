
// Based on "Coding Challenge #24: Perlin Noise Flow  Field" by Daniel Shiffman
// https://youtu.be/BjoM9oKOAKY
//
// image by Filipp Romanovsky https://unsplash.com/photos/CGKYNN3uuVo
//
// author Lukasz Barej @LukasBarej
//


FlowField flowfield;
PImage img;
ArrayList<Particle> particles;


boolean debug = !true;

void setup(){
  //size(1000,1400);
  //img = loadImage("marylin.jpg");
  //img.resize(1000,1400);
  
  size(1000,1500);
  img = loadImage("filipp.jpg");
  img.resize(1000,1500);

  
  flowfield = new FlowField(10);
  flowfield.update();
  
  //randomSeed(10);
  
  particles = new ArrayList<Particle>();
  for (int i = 0; i<10000; i++) {
    PVector start = new PVector(random(width*0.3,width*0.8), random(height*0.3,height*0.6));
    particles.add(new Particle(start, random(3)));
    
  }
  
  background(#FAF6D7);
 
}

void draw(){
  
  flowfield.update();
  
  if(debug) flowfield.display();
  
  for (Particle p: particles){
   p.follow(flowfield);
   p.run();
    
  }
  
}

void keyPressed(){
  
  saveFrame("poster####.jpg");
}
