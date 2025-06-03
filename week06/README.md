# Week 6: Sci-Fi Soundscape Generator

## Notes

Alien planet soundscape - took the course oscillator examples and made atmospheric sci-fi sounds.

### What happens:
- 3 different oscillators running (sine, saw, triangle)
- Automatic frequency modulation makes them wobble
- Low-pass filter on the saw wave so it's not too harsh
- Mouse lets you mess with the frequencies in real-time
- Added some visual stuff with the alien planet

### The wobbling:
- Uses sine waves to modulate the main frequencies
- Makes it sound like you're approaching something alien
- Filter cuts off the high frequencies on the saw wave

### Interactive bits:
- Just watch/listen for the automatic soundscape
- Hold mouse and drag around to explore different sounds
- Spacebar switches between approach/landing modes
- 's' stops everything, 'r' restarts

### Borrowed from examples:
- Multiple oscillators from Week 6 demos
- Frequency modulation from frequency_modulation example
- Filter stuff from simple_osc_filter_demo 