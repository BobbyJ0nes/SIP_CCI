float angle = 0;

void setup() {
  size(400, 400);
}

void draw() {
  background(20);
  
  for (int x = 0; x < 5; x++) {
    for (int y = 0; y < 5; y++) {
      float xPos = 50 + x * 80;
      float yPos = 50 + y * 80;
      
      // Use modulo to create checkerboard pattern
      if ((x + y) % 2 == 0) {
        // Random colors for even squares - update every 30 frames to slow down flickering
        randomSeed(frameCount/30 + x + y);
        fill(random(255), random(255), random(255));
      } else {
        // Fixed color for odd squares
        fill(100, 150, 255);
      }
      
      circle(xPos, yPos, 60);
    }
  }
} 