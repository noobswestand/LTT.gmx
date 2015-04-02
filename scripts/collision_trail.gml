/*
collision_trail(trail,obj,prec,notme)

Uses collision_line over the trail, except when point goes to or from (-1000,-1000), to check for collisions with the trail
returns id of instance it collides with closest along the trail to the newest point of the trail
or returns negative if no collision with obj
*/


var i;
var (trail) = argument0; // name of trail
var (obj) = argument1; // object to check for collision with
var (prec) = argument2; // collision precision
var (notme) = argument3; // whether or not to include self in collision check if self is of object obj
var (traillength) = ds_grid_width(trail); // length of trail
var (hitobj) = -1;

// use collision_line between all non-null trail coordinates
for(i=0; i<traillength-1; i+=1)
{
    if ((ds_grid_get(trail,i,0)!=ds_grid_get(trail,i+1,0) or ds_grid_get(trail,i,1)!=ds_grid_get(trail,i+1,1)) and (ds_grid_get(trail,i,0)!=-1000 or ds_grid_get(trail,i,1)!=-1000) and (ds_grid_get(trail,i+1,0)!=-1000 or ds_grid_get(trail,i+1,1)!=-1000)) // make sure that the either the x coordinates or the y coordinates are different, and that trail is not at (-1000,-1000) (which is how I demark trail "positions" not to be drawn)
    {
        hitobj = collision_line(ds_grid_get(trail,i,0),ds_grid_get(trail,i,1),ds_grid_get(trail,i+1,0),ds_grid_get(trail,i+1,1),obj,prec,notme);
        if (hitobj > 0) {break;}
    }
}

return (hitobj);