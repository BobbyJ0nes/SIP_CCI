// Week 5: Live Camera Effects Studio
// Image processing with dithering and convolution filters

PImage sample;
int frameCounter = 0;

// Convolution kernels from course examples
float[][] blur = {
  { 0.0625, 0.125, 0.0625 }, 
  { 0.125, 0.25, 0.125 }, 
  { 0.0625, 0.125, 0.0625 }
};

float[][] sharpen = {
  {  0, -1, 0 }, 
  { -1,  5, -1 }, 
  {  0, -1, 0 }
};

float[][] edge = {
  { -1, -1, -1 }, 
  { -1,  8, -1 }, 
  { -1, -1, -1 }
};

void setup() {
  size(640, 480);
  sample = loadImage("sample.jpg");
}

void draw() {
  // Display original image
  image(sample, 0, 0, width, height);
  
  // Apply effects when mouse is pressed
  if (mousePressed) {
    // Apply convolution filter first, then dithering
    PImage filtered = convolve(sample, blur);
    image(filtered, 0, 0, width, height);
    applyDither();
  }
}

// Convolution function from course examples
PImage convolve(PImage input, float[][] kernel) {
  PImage output = createImage(input.width, input.height, RGB);
  
  input.loadPixels();
  output.loadPixels();
  
  for (int y = 1; y < input.height-1; y++) {
    for (int x = 1; x < input.width-1; x++) {
      float sumR = 0, sumG = 0, sumB = 0;
      
      for (int offsetY = -1; offsetY <= 1; offsetY++) {
        for (int offsetX = -1; offsetX <= 1; offsetX++) {
          int neighbourIndex = (y+offsetY)*input.width + (x + offsetX);
          
          float r = red(input.pixels[neighbourIndex]);
          float g = green(input.pixels[neighbourIndex]);
          float b = blue(input.pixels[neighbourIndex]);
          
          sumR += r * kernel[offsetY+1][offsetX+1];
          sumG += g * kernel[offsetY+1][offsetX+1];
          sumB += b * kernel[offsetY+1][offsetX+1];
        }
      }
      
      sumR = constrain(sumR, 0, 255);
      sumG = constrain(sumG, 0, 255);
      sumB = constrain(sumB, 0, 255);
      
      int index = y*input.width + x;
      output.pixels[index] = color(sumR, sumG, sumB);
    }
  }
  
  return output;
}

// Floyd-Steinberg dithering from course examples
void applyDither() {
  loadPixels();
  
  for (int i = 0; i < pixels.length; i++) {
    float greyValue = red(pixels[i]);
    float newPixelValue = greyValue > 127 ? 255 : 0;
    float error = greyValue - newPixelValue;
    
    pixels[i] = color(newPixelValue);
    
    // Floyd-Steinberg error diffusion
    int[] offsets = { 1, width-1, width, width+1 };
    float[] ditherRatios = { 7/16.0, 3/16.0, 5/16.0, 1/16.0 };
    
    for (int j = 0; j < offsets.length; j++) {
      int neighbourIndex = i + offsets[j];
      if (neighbourIndex < pixels.length) {
        float neighbourGrey = red(pixels[neighbourIndex]);
        pixels[neighbourIndex] = color(neighbourGrey + (error * ditherRatios[j]));
      }
    }
  }
  
  updatePixels();
}

void keyPressed() {
  if (key == 's') {
    frameCounter++;
    if (frameCounter <= 10) {
      saveFrame("comic-" + frameCounter + ".jpg");
      println("Saved frame " + frameCounter + " of 10");
    }
  }
} 