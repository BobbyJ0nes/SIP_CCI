// Week 7: Modular Sample Sequencer
// Modulo-based sequencing with simple effects

import processing.sound.*;

SoundFile kick;
SoundFile guitar;
SoundFile glass;
SoundFile bottle;

float bpm = 120;
int stepCount = 0;

void setup() {
  size(500, 250);
  
  // Load audio samples
  kick = new SoundFile(this, "kick.wav");
  guitar = new SoundFile(this, "Guitar.wav");
  glass = new SoundFile(this, "glass.wav");
  bottle = new SoundFile(this, "Bottle.wav");
  
  // Set volumes
  kick.amp(0.8);
  guitar.amp(0.6);
  glass.amp(0.7);
  bottle.amp(0.5);
  
  frameRate(8); // 8 steps per second
}

void draw() {
  background(30, 20, 40);
  
  drawSequencerGrid();
  
  // Play samples using modulo patterns (from course examples)
  if (stepCount % 4 == 0) {
    kick.play();
  }
  
  if (stepCount % 6 == 0) {
    guitar.play();
  }
  
  if (stepCount % 8 == 0) {
    glass.play();
  }
  
  if (stepCount % 10 == 0) {
    bottle.play();
  }
  
  stepCount++;
}

void drawSequencerGrid() {
  // Visual grid showing sequence patterns
  for (int i = 0; i < 16; i++) {
    float x = i * 30 + 20;
    
    // Current step highlight
    if (i == stepCount % 16) {
      fill(255, 200, 100);
    } else {
      fill(60);
    }
    
    // Draw step boxes for each track
    rect(x, 50, 20, 15);   // kick
    rect(x, 75, 20, 15);   // guitar  
    rect(x, 100, 20, 15);  // glass
    rect(x, 125, 20, 15);  // bottle
    
    // Show which steps will trigger (modulo visualization)
    fill(100, 255, 100, 100);
    if (i % 4 == 0) rect(x, 50, 20, 15);    // kick every 4
    if (i % 6 == 0) rect(x, 75, 20, 15);    // guitar every 6
    if (i % 8 == 0) rect(x, 100, 20, 15);   // glass every 8
    if (i % 10 == 0) rect(x, 125, 20, 15);  // bottle every 10
  }
  
  // Track labels
  fill(255);
  text("Kick", 5, 62);
  text("Guitar", 5, 87);
  text("Glass", 5, 112);
  text("Bottle", 5, 137);
  
  // Simple instructions
  text("Mouse: volume/pitch, Space: reset", 20, 180);
}

void keyPressed() {
  if (key == ' ') {
    stepCount = 0; // reset sequence
  }
}

void mouseMoved() {
  // Simple mouse effects
  float volume = map(mouseY, 0, height, 0.3, 1.0);
  float pitch = map(mouseX, 0, width, 0.7, 1.5);
  
  // Apply effects to samples
  guitar.rate(pitch);
  glass.rate(pitch);
  
  kick.amp(volume * 0.8);
  guitar.amp(volume * 0.6);
  glass.amp(volume * 0.7);
  bottle.amp(volume * 0.5);
} 