///scr_generateRoom2()
randomize()

var door=round(irandom_range(64,room_height-96)/16)*16
obj_spawn.yspawn=door
for(i=0;i<room_height;i+=16){
    instance_create(0,i,obj_block2)
    instance_create(room_width-16,i,obj_block2)
}
a=(irandom_range(door,room_height)/16)*16
for(b=i;b<a;b+=16){
    instance_create(-16,b,obj_block2)
    instance_create(room_width,b,obj_block2)
}

//create the floor
var starth=choose(16,32,48,64)
var mat=choose(obj_block0,obj_block1)
for(i=16;i<room_width/2;i+=16){
    if irandom(5)=0{
        starth+=(choose(-16,16,-32,32))
        if starth<=0{starth=16}
        if starth>64{starth=64}
    }
    if instance_exists(obj_control){
    
        obj=-1;
        
        switch(argument0){
            case 0: obj=obj_boss0 break;
        }
        
        if i=240-16{
            instance_create(room_width/2,((room_height-16)-starth)-sprite_get_height(object_get_sprite(obj)),obj)
        }
    //Spawn some monsters to make it more real
    if irandom(obj_spawn.spawnrate/6)=0{
        nn=instance_create(i+8,(room_height-16)-starth-8,obj_monster0)
        nn=instance_create((room_width-16)-i+8,(room_height-16)-starth-8,obj_monster0)
    }
    
    }
    for(a=(room_height-16)-starth;a<(room_height-16);a+=16){
        if place_free(i,a){instance_create(i,a,mat)}
        if place_free((room_width-16)-i,a){instance_create((room_width-16)-i,a,mat)}
    }
}

var x_start=round(irandom_range(64,128)/16)*16
var y_start=round(irandom_range(64,128)/16)*16
var mat=choose(obj_block0,obj_block1)
scr_chunk0(x_start,y_start,mat)
scr_chunk0((room_width)-x_start,y_start,mat)

with(par_block){
    if y>=room_height-16{instance_destroy()}
}

with(par_block){
    if y>=room_height-32{
        if x>(room_width/2)-32
        && x<(room_width/2)+32{
            nn=instance_create(x,y,obj_block3)
        }else{
            nn=instance_create(x,y,obj_block2)
        }
        instance_destroy()
    }
}
