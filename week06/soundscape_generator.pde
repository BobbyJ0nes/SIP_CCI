// Week 6: Sci-Fi Soundscape Generator
// Atmospheric sounds for alien planet arrival scene

import processing.sound.*;

SinOsc osc1;     // main atmospheric drone
SawOsc osc2;     // alien communication sounds  
TriOsc osc3;     // environmental ambience
LowPass filter;

float time = 0;
boolean landed = false;

// Store frequency values for display
float freq1 = 220;
float freq2 = 110;
float freq3 = 440;

void setup() {
  size(600, 400);
  
  // Create oscillators and filter (simpler setup like course examples)
  osc1 = new SinOsc(this);
  osc2 = new SawOsc(this);
  osc3 = new TriOsc(this);
  filter = new LowPass(this);
  
  // Apply filter only to saw wave (like course examples)
  filter.process(osc2);
  
  // Safe audible frequencies
  osc1.freq(freq1);
  osc2.freq(freq2);
  osc3.freq(freq3);
  
  // Audible amplitudes
  osc1.amp(0.3);
  osc2.amp(0.2);
  osc3.amp(0.1);
  
  // Start the soundscape
  osc1.play();
  osc2.play();
  osc3.play();
  
  println("Soundscape started - you should hear 3 oscillators");
}

void draw() {
  // Alien planet visual atmosphere
  background(5, 15, 25);
  
  // Gentle frequency modulation (less extreme than before)
  float mod1 = sin(time * 0.02) * 0.2 + 1;  // subtle modulation
  float mod2 = sin(time * 0.03) * 0.3 + 1;
  float mod3 = sin(time * 0.025) * 0.1 + 1;
  
  // Apply modulation to base frequencies and store values
  freq1 = 220 * mod1;
  freq2 = 110 * mod2;
  freq3 = 440 * mod3;
  
  osc1.freq(freq1);
  osc2.freq(freq2);
  osc3.freq(freq3);
  
  // Filter modulation
  filter.freq(map(sin(time * 0.04), -1, 1, 500, 3000));
  
  // Simple visuals
  drawAlienScene();
  
  // Mouse interaction
  if (mousePressed) {
    exploreMode();
  }
  
  time += 1;
}

void drawAlienScene() {
  // Stars
  fill(255, 150);
  for (int i = 0; i < 30; i++) {
    float x = (noise(i * 0.1, time * 0.001) * width);
    float y = (noise(i * 0.1 + 100, time * 0.001) * height * 0.5);
    circle(x, y, 3);
  }
  
  // Oscillator visualization
  fill(0, 255, 150, 100);
  circle(150, 150, 50 + sin(time * 0.1) * 20);
  
  fill(255, 100, 0, 100);  
  circle(300, 200, 40 + sin(time * 0.15) * 15);
  
  fill(150, 0, 255, 100);
  circle(450, 180, 35 + sin(time * 0.12) * 10);
  
  // Labels with stored frequency values
  fill(255);
  text("Sine " + int(freq1) + "Hz", 120, 120);
  text("Saw " + int(freq2) + "Hz", 270, 170);
  text("Triangle " + int(freq3) + "Hz", 420, 150);
}

void exploreMode() {
  // Mouse controls main oscillator
  float newFreq = map(mouseX, 0, width, 150, 600);
  freq1 = newFreq;
  osc1.freq(freq1);
  
  // Mouse Y controls filter
  float filterFreq = map(mouseY, 0, height, 300, 4000);
  filter.freq(filterFreq);
  
  // Visual feedback
  fill(255, 255, 0, 150);
  circle(mouseX, mouseY, 40);
  
  text("Freq: " + int(newFreq), mouseX + 30, mouseY);
}

void keyPressed() {
  if (key == ' ') {
    // Toggle landing mode
    landed = !landed;
    if (landed) {
      osc1.amp(0.5);
      osc2.amp(0.1);
      osc3.amp(0.2);
      println("LANDING MODE");
    } else {
      osc1.amp(0.3);
      osc2.amp(0.2);
      osc3.amp(0.1);
      println("APPROACH MODE");
    }
  }
  
  if (key == 's') {
    osc1.stop();
    osc2.stop();
    osc3.stop();
    println("Sound stopped");
  }
  
  if (key == 'r') {
    // Restart sound
    osc1.play();
    osc2.play();
    osc3.play();
    println("Sound restarted");
  }
} 