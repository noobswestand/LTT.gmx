//argument0 from x
//argument1 from y
//argument2 from z
//argument3 to x
//argument4 to y
//argument5 to z
//argument6 segment lenght. the lower this value is, the longer the segments
//argument7 "crazyness"

draw_set_color(c_white)
draw_set_alpha(1)
checkx=argument0
checky=argument1
checkz=argument2
checkx2=argument0
checky2=argument1
checkz2=argument2
do
{
checkx3=argument3-checkx
checky3=argument4-checky
checkz3=argument5-checkz

checkx3/=argument6
checky3/=argument6
checkz3/=argument6

checkx3+=random(argument7)-argument7/2
checky3+=random(argument7)-argument7/2
checkz3+=random(argument7)-argument7/2
checkx+=checkx3
checky+=checky3
checkz+=checkz3

draw_line_width(checkx,checky,checkx2,checky2,2)

checkx2=checkx
checky2=checky
checkz2=checkz
}
until point_distance(checkx,checky,argument3,argument4)
<10 and checkz<argument5+10 and checkz>argument5-5
draw_set_color(c_white)
