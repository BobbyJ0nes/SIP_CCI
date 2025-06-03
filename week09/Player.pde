// Player class - based on Ball.pde from course examples
class Player {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float size = 15;
  
  Player(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  // Apply force method from force_ball example
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  // Update physics (from Ball.pde)
  void update() {
    velocity.add(acceleration);
    velocity.mult(0.95); // slight drag to make control easier
    position.add(velocity);
    
    // Keep on screen (from Ball.pde checkEdges)
    position.x = constrain(position.x, size/2, width - size/2);
    position.y = constrain(position.y, size/2, height - size/2);
    
    acceleration.mult(0); // reset acceleration
  }
  
  void display() {
    // Draw simple spaceship
    fill(100, 150, 255);
    stroke(255);
    strokeWeight(2);
    circle(position.x, position.y, size);
    
    // Add direction indicator
    fill(255);
    circle(position.x, position.y - 3, 3);
  }
  
  // Simple collision detection (new - not from course examples)
  boolean collidesWith(Debris d) {
    float distance = PVector.dist(position, d.position);
    return distance < (size/2 + d.size/2);
  }
} 