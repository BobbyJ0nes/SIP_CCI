// Week 4: Animated Terrain Generator
// 2D landscape using Perlin Noise with duotone color effect

float time = 0;
color colorA = color(20, 50, 120);   // dark blue for valleys
color colorB = color(255, 200, 100); // warm yellow for mountains

void setup() {
  size(600, 400);
}

void draw() {
  loadPixels();
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      // Generate noise value with time for animation
      float noiseValue = noise(x * 0.01, y * 0.01, time * 0.02);
      
      // Apply duotone color mapping
      color terrainColor = duotone(noiseValue);
      pixels[x + y * width] = terrainColor;
    }
  }
  
  updatePixels();
  time += 1; // animate the terrain
}

color duotone(float value) {
  return lerpColor(colorA, colorB, value);
}

 