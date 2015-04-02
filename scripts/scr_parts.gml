ps = part_system_create()
pt = part_type_create()
em = part_emitter_create(ps)

part_type_shape(pt,12)
part_type_size(pt,0.14,0.38,0,0)
part_type_speed(pt,0,1,0,0)
part_type_direction(pt,0,360,0,0)
part_type_color3(pt,65535,128,8421504)
part_type_alpha2(pt,1,1)
part_type_blend(pt,0)
part_type_life(pt,18,33)
part_type_gravity(pt,0,270)
part_emitter_region(ps,em,x-21,x+21,y-21,y+21,1,0)

part_system_depth(ps,-1)













///////////////////////////////////ATOMSPHERE PATS//////////////////////////////
ps1 = part_system_create()
pt1 = part_type_create()
em1 = part_emitter_create(ps1)

part_type_shape(pt1,pt_shape_disk)
part_type_size(pt1,0.3/25,.5/25,0,0)
part_type_speed(pt1,0,0.1,0,0)
part_type_direction(pt1,0,360,0,0)
part_type_color3(pt1,16777215,16777215,16777215)
part_type_alpha3(pt1,0.1,1,0)
part_type_blend(pt1,0)
part_type_life(pt1,90,180)
part_type_gravity(pt1,0,270)
part_emitter_region(ps1,em1,0,480,0,272,0,0)
part_system_depth(ps1,-2)




ps2 = part_system_create()
pt2 = part_type_create()
em2 = part_emitter_create(ps2)

part_type_shape(pt2,1)
part_type_size(pt2,0,0.04,0,0)
part_type_speed(pt2,0,0,0.10,0)
part_type_direction(pt2,0,360,0,0)
part_type_color3(pt2,16777215,16747677,8388608)
part_type_alpha2(pt2,1,1)
part_type_blend(pt2,0)
part_type_life(pt2,15,30)
part_type_gravity(pt2,0.11,270)
part_emitter_region(ps2,em2,x-59,x+59,y-59,y+59,1,2)




ps3 = part_system_create()
pt3 = part_type_create()
em3 = part_emitter_create(ps3)
part_type_shape(pt3,10)
part_type_size(pt3,0.04,0.18,0,0)
part_type_speed(pt3,1,5,0,3)
part_type_direction(pt3,0,6,0,0)
part_type_color3(pt3,255,25025,255)
part_type_alpha2(pt3,1,0.21)
part_type_blend(pt3,1)
part_type_life(pt3,8,24)
part_type_gravity(pt3,0,0)
part_emitter_region(ps3,em3,x-6,x+6,y-5,y+5,1,0)



ps4 = part_system_create()
pt4 = part_type_create()
em4 = part_emitter_create(ps4)

part_type_shape(pt4,10)
part_type_size(pt4,0.20,0.40,0,0)
part_type_speed(pt4,0,1,0,0)
part_type_orientation(pt4,0,0,0,0,1)
part_type_direction(pt4,98,101,0,0)
part_type_color3(pt4,16384,32768,8421376)
part_type_alpha2(pt4,1,0)
part_type_blend(pt4,1)
part_type_life(pt4,15,50)
part_type_gravity(pt4,0.04,0)
part_emitter_region(ps4,em4,x-80,x+80,y-82,y+82,1,0)

//part_emitter_stream(ps4,em4,pt4,10)








///////////////////////////////////PLASMA GUN!!//////////////////////////////
ps5 = part_system_create()
pt5 = part_type_create()
em5 = part_emitter_create(ps5)

part_type_shape(pt5,pt_shape_disk)
part_type_size(pt5,0.3/25,.5/25,0,0)
part_type_speed(pt5,0,0.1,0,0)
part_type_direction(pt5,0,360,0,0)
part_type_color3(pt5,16777215,16747677,8388608)
part_type_alpha3(pt5,0.1,1,0)
part_type_blend(pt5,0)
part_type_life(pt5,90,180)
part_type_gravity(pt5,0,270)
part_emitter_region(ps5,em5,0,480,0,272,0,0)
part_system_depth(ps5,-2)





////////////Sentry3////////////
ps6 = part_system_create()
pt6 = part_type_create()
em6 = part_emitter_create(ps6)

part_type_shape(pt6,12)
//part_type_size(pt6,0.06,0.22,0,0)
part_type_size(pt6,0.02,0.1,0,0)
part_type_speed(pt6,0,0,0,0)
part_type_direction(pt6,0,360,0,0)
part_type_color3(pt6,65535,128,8421504)
part_type_alpha2(pt6,1,1)
part_type_blend(pt6,0)
part_type_life(pt6,5,19)
part_type_gravity(pt6,0,270)
part_system_depth(ps6,1)
