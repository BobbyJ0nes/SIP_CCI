// Week 9: Space Debris Collector
// Simple game using classes, forces, and interactions

Player ship;
ArrayList<Debris> debris;
PVector gravity;
PVector thrust;
int score = 0;
int debrisCount = 8;

void setup() {
  size(600, 400);
  
  // Create player ship (class example from course)
  ship = new Player(width/2, height/2);
  
  // Create debris objects to collect
  debris = new ArrayList<Debris>();
  for (int i = 0; i < debrisCount; i++) {
    debris.add(new Debris(random(width), random(height)));
  }
  
  // Forces (from force_ball example) - adjusted for better control
  gravity = new PVector(0, 0.05);  // reduced gravity for better ship control
  thrust = new PVector(0, 0);      // controlled by mouse
}

void draw() {
  background(10, 10, 30);  // space background
  
  // Calculate stronger thrust force from mouse position
  thrust.x = map(mouseX, 0, width, -0.5, 0.5);
  thrust.y = map(mouseY, 0, height, -0.6, 0.4); // stronger upward thrust
  
  // Apply forces to ship (from force_ball example)
  ship.applyForce(gravity);
  ship.applyForce(thrust);
  ship.update();
  ship.display();
  
  // Update and display debris
  for (int i = debris.size() - 1; i >= 0; i--) {
    Debris d = debris.get(i);
    d.applyForce(gravity);
    d.update();
    d.display();
    
    // Check collision (interaction requirement)
    if (ship.collidesWith(d)) {
      debris.remove(i);
      score++;
    }
  }
  
  // Display game info
  fill(255);
  text("Score: " + score, 20, 30);
  text("Debris left: " + debris.size(), 20, 50);
  text("Mouse to steer", 20, height - 20);
  
  // Win condition
  if (debris.size() == 0) {
    text("ALL DEBRIS COLLECTED!", width/2 - 80, height/2);
  }
}

void keyPressed() {
  if (key == 'r') {
    // Reset game
    score = 0;
    debris.clear();
    for (int i = 0; i < debrisCount; i++) {
      debris.add(new Debris(random(width), random(height)));
    }
    ship.position.set(width/2, height/2);
    ship.velocity.set(0, 0);
  }
} 