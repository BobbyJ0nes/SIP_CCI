// Week 2: Image Histogram Analyzer
// Loads an image and displays RGB color histograms
// Shows the distribution of red, green, and blue values in the image

PImage sample;

void setup() {
  size(783, 1075);
  sample = loadImage("sample.jpg");
}

void draw() {
  // Display the image scaled to fit the canvas
  image(sample, 0, 0, width, height);
  
  // Create arrays to count each color value (0-255)
  int[] redHist = new int[256];
  int[] greenHist = new int[256];
  int[] blueHist = new int[256];
  
  // Load the image pixels for analysis
  sample.loadPixels();
  
  // Count how many pixels have each color value
  for (int i = 0; i < sample.pixels.length; i++) {
    int r = int(red(sample.pixels[i]));   // Extract red value
    int g = int(green(sample.pixels[i])); // Extract green value
    int b = int(blue(sample.pixels[i]));  // Extract blue value
    
    // Add to the count for this color value
    redHist[r]++;
    greenHist[g]++;
    blueHist[b]++;
  }
  
  // Draw the histograms as overlaid line graphs
  // Red histogram (bottom area)
  for (int i = 0; i < 256; i++) {
    stroke(255, 0, 0); // Red color
    float redHeight = map(redHist[i], 0, max(redHist), height, height-80);
    line(i*2, redHeight, i*2, height);
  }
  
  // Green histogram (middle area)
  for (int i = 0; i < 256; i++) {
    stroke(0, 255, 0); // Green color
    float greenHeight = map(greenHist[i], 0, max(greenHist), height-90, height-170);
    line(i*2, greenHeight, i*2, height-90);
  }
  
  // Blue histogram (top area)
  for (int i = 0; i < 256; i++) {
    stroke(0, 0, 255); // Blue color
    float blueHeight = map(blueHist[i], 0, max(blueHist), height-180, height-260);
    line(i*2, blueHeight, i*2, height-180);
  }
} 