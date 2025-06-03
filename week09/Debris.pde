// Debris class - also based on Ball.pde from course examples
class Debris {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float size;
  color c;
  
  Debris(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(0, 0);
    size = random(8, 15);
    c = color(random(200, 255), random(100, 200), random(50, 150));
  }
  
  // Apply force method from force_ball example
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  // Update physics (from Ball.pde)
  void update() {
    velocity.add(acceleration);
    velocity.mult(0.98); // slight drag
    position.add(velocity);
    
    // Wrap around screen edges (different from Ball.pde bouncing)
    if (position.x < 0) position.x = width;
    if (position.x > width) position.x = 0;
    if (position.y < 0) position.y = height;
    if (position.y > height) position.y = 0;
    
    acceleration.mult(0); // reset acceleration
  }
  
  void display() {
    // Draw space debris
    fill(c);
    stroke(255, 100);
    strokeWeight(1);
    circle(position.x, position.y, size);
    
    // Add sparkle effect
    fill(255, 150);
    circle(position.x + 2, position.y - 2, 2);
  }
} 