# Week 7: Modular Sample Sequencer

## Notes

Sample sequencer using modulo - took the course modulo examples and made overlapping rhythms.

### How the timing works:
- Uses modulo to trigger samples at different intervals
- kick every 4 steps, guitar every 6, glass every 8, bottle every 10
- Creates these weird overlapping patterns that sound pretty cool
- Visual grid so you can see what's happening

### The samples:
- 4 different sounds: kick, guitar, glass, bottle
- Each one has its own cycle length
- When they overlap you get complex rhythms

### Interactive stuff:
- Mouse X changes the pitch (like speeding up/slowing down a record)
- Mouse Y controls volume
- Spacebar resets everything back to the start

### Pulled from the examples:
- Modulo timing from simple_modulo_print
- Sample playback from modulo_loop_sample  
- Visual grid from modulo_colour_pattern 