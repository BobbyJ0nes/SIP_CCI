// Week 10: Simple Particle System
// Click mouse to add particles
// Hold W for wind, R to reset

ArrayList<Particle> particles;
PVector gravity, wind;

void setup() {
  size(800, 600);
  particles = new ArrayList<Particle>();
  gravity = new PVector(0, 0.05);
  wind = new PVector(0.2, 0);
}

void draw() {
  background(220);
  
  // Update particles
  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle p = particles.get(i);
    
    p.addForce(gravity);
    p.update();
    p.display();
    
    if (p.isDead()) {
      particles.remove(i);
    }
  }
  
  // Simple UI
  fill(0);
  text("Click: Add particles | Hold W: Wind | R: Reset", 10, 20);
  text("Particles: " + particles.size(), 10, 35);
}

void mousePressed() {
  for (int i = 0; i < 5; i++) {
    particles.add(new Particle(mouseX, mouseY));
  }
}

void keyPressed() {
  if (key == 'r') {
    particles.clear();
  }
  if (key == 'w') {
    for (Particle p : particles) {
      p.addForce(wind);
    }
  }
}

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  color particleColor;
  
  Particle(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(random(-2, 2), random(-3, 0));
    acceleration = new PVector(0, 0);
    lifespan = 255;
    
    // Simple autumn colors
    float r = random(1);
    if (r < 0.33) {
      particleColor = color(255, 140, 0); // Orange
    } else if (r < 0.66) {
      particleColor = color(255, 69, 0);  // Red
    } else {
      particleColor = color(139, 69, 19); // Brown
    }
  }
  
  void addForce(PVector force) {
    acceleration.add(force);
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    
    lifespan -= 1;
  }
  
  void display() {
    fill(red(particleColor), green(particleColor), blue(particleColor), lifespan);
    noStroke();
    circle(position.x, position.y, 8);
  }
  
  boolean isDead() {
    return lifespan <= 0;
  }
} 