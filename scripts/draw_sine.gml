///draw_sine(x, y, direction, length, amplitude,start)

// Usage: draw_sine(x, y, direction, length, amplitude)
// argument 0   -   x to start drawing from
// argument 1   -   y to start drawing from
// argument 2   -   direction in degrees
// argument 3   -   length in pixels
// argument 4   -   amplitude in pixels

// RESULT: Draws a single cycle of sine wave with given length anywhere in the 2D space

var xOrig = argument0;
var yOrig = argument1;
var dir = argument2;
var lenPxs = argument3;
var amplitude = argument4;

var resolution = 0.250; // in radians

// Keep track of last position for line drawing
var n = 0;
var xPrev = xOrig;
var yPrev = yOrig;

var numCycles = 16 * pi*2; // draws 1 cycle

for( i = argument5; i <= numCycles+argument5; i += resolution)   {
    var sinVal = amplitude * sin( i );
    
    var len = ((i-argument5) / numCycles) * lenPxs;
    var xx = xOrig + lengthdir_x(len, dir) + lengthdir_x(sinVal, dir - 90);
    var yy = yOrig + lengthdir_y(len, dir) + lengthdir_y(sinVal, dir - 90);
    
    // Draw a line segment after the first loop
    if(n > 0)   {
        draw_set_color(c_red);
        draw_line_width(xPrev, yPrev, xx, yy,1.5);
        xPrev = xx;
        yPrev = yy;
    }
    
    n++;
    
}