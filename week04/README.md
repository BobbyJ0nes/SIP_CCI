# Week 4: Animated Terrain Generator

## Notes

Animated landscape using noise - took the course noise examples and made flowing terrain.

### What it does:
- Uses Perlin noise to generate smooth terrain heights
- Colors low areas blue, high areas yellow
- Animates by moving noise pattern over time
- Creates flowing, changing landscape

### Key features:
- 2D noise generation for natural terrain
- Color interpolation between blue/yellow
- Time-based animation for movement
- Pixel manipulation for smooth rendering

### Built from course examples:
- 2D noise from Week 4 examples
- Color mapping with lerpColor()
- Pixel handling with loadPixels()/updatePixels() 