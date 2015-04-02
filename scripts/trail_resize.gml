/*
trail_resize(trail,newlength)

Change the length of the trail
*/

var(w) = ds_grid_width(argument0);

ds_grid_resize(argument0,argument1,2);

if (w<ds_grid_width(argument0))
{
    ds_grid_set_region(argument0,w,0,ds_grid_width(argument0)-1,0,-1000);
    ds_grid_set_region(argument0,w,1,ds_grid_width(argument0)-1,1,-1000);
}