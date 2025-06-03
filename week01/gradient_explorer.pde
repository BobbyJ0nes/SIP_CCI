void setup() {
  size(400, 300);
}

void draw() {
  loadPixels();
  
  float mouseInfluence = map(mouseX, 0, width, 0, 1);
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      float normalizedX = map(x, 0, width - 1, 0, 1);
      float normalizedY = map(y, 0, height - 1, 0, 1);
      
      int red = int(255 * normalizedX * mouseInfluence);
      int green = int(255 * normalizedY);
      int blue = int(255 * (1 - normalizedX));
      
      color c = color(red, green, blue);
      pixels[x + y * width] = c;
    }
  }
  updatePixels();
} 