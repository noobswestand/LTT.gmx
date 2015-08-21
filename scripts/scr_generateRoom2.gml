///scr_generateRoom2()
randomize()
global.gunheight=0

var locked=false;
if instance_exists(obj_control){
    if irandom(3)=0{
        if obj_control._floor!=0{
            locked=true;
        }
    }
}


var door=round(irandom_range(64,room_height-96)/16)*16
obj_spawn.yspawn=door
for(i=0;i<door;i+=16){
    instance_create(0,i,obj_block2)
    instance_create(room_width-16,i,obj_block2)
}
for(a=i+64;a<room_height;a+=16){
    instance_create(0,a,obj_block2)
    instance_create(room_width-16,a,obj_block2)
}
for(b=i;b<a;b+=16){
    instance_create(-16,b,obj_block2)
    instance_create(room_width,b,obj_block2)
}

//create blocks by the door to ensure enemys get out safely
var wid=round(irandom_range(64,96)/16)*16
var hie=round(irandom_range(16,96)/16)*16
var mat=choose(obj_block0,obj_block1)
for(i=16;i<wid;i+=16){
    if irandom(2)=0{
        hie+=(choose(-16,16))
        if hie<16{hie=16}
    }
    for(a=door+64;a<door+64+hie;a+=16){
        instance_create(i,a,mat)
        instance_create((room_width-16)-i,a,mat)
    }
    
}
//create the floor
var starth=choose(16,32,48,64);
if door+48>((room_height-16)-starth){
    starth=16
}


var mat=scr_chooseblock()//choose(obj_block0,obj_block1)

for(i=16;i<room_width/2;i+=16){
    if irandom(2)=0 && i!=16{
        starth+=(choose(-16,16,-32,32))
        if starth<=0{starth=16}
        if starth>64{starth=64}
    }
    if instance_exists(obj_control){
        if i=240-16 && obj_control._floor/obj_control.moneyCheckMult=1{
            randomize()
            //instance_create(room_width/2,((room_height-16)-starth),obj_control.gun2[irandom(obj_control.totalguns-1)])
            
            instance_create(room_width/2,((room_height-16)-starth),choose(obj_gun0,obj_gun1,obj_gun3,obj_gun4,obj_gun2,obj_gun5,obj_gun6,obj_gun8,obj_gun9))
            //instance_create(room_width/2,((room_height-16)-starth),choose(obj_gun5))
            
            //global.gunheight=((room_height-16)-starth);
        }
        
    //Spawn some monsters to make it more real
    if global.ONLINE=false && object_index=global.RoomGenObj{
        
        if irandom(obj_spawn.spawnrate/6)=0{
            nn=instance_create(i+8,(room_height-16)-starth-8,obj_monster0)
            nn=instance_create((room_width-16)-i+8,(room_height-16)-starth-8,obj_monster0)
        }
        if irandom(3)=0 && EASTER=true{
            if irandom(1){
                nn=instance_create(i+8,(room_height-16)-starth-8,obj_egg)
            }else{
                nn=instance_create((room_width-16)-i+8,(room_height-16)-starth-8,obj_egg)
            }
        }
        
    }
    
    }
    for(a=(room_height-16)-starth;a<(room_height-16);a+=16){
        if place_free(i,a){
            instance_create(i,a,mat)
            if irandom(16)=0{
                if place_free(i,a-16){
                    instance_create(i,a,obj_spikes)
                }
            }
        }
        if place_free((room_width-16)-i,a){
            instance_create((room_width-16)-i,a,mat)
            if irandom(16)=0{
                if place_free((room_width-16)-i,a-16){
                    instance_create((room_width-16)-i,a-16,obj_spikes)
                }
            }
        }
    }
}

var x_start=round(irandom_range(64,128)/16)*16
var y_start=round(irandom_range(64,128)/16)*16
var mat=scr_chooseblock()
scr_chunk0(x_start,y_start,mat)
scr_chunk0((room_width)-x_start,y_start,mat)

if instance_exists(obj_control){
    if obj_control._floor!=1{
        if irandom(1)=0{
            var x_start=round(irandom_range(128,208)/16)*16
            var y_start=round(irandom_range(128,188)/16)*16
            //var mat=choose(obj_block0,obj_block1)
            var mat=scr_chooseblock();
            scr_chunk0(x_start,y_start,mat)
            scr_chunk0((room_width)-x_start,y_start,mat)
        }else{
            var x_start=round(irandom_range(128,208)/16)*16
            var y_start=round(irandom_range(128,188)/16)*16
            scr_chunk1(x_start,y_start)
            scr_chunk1((room_width)-x_start,y_start)
        }
    }
}

scr_gen_ceiling(y_start)

with(par_block){
    if y>=room_height-16{instance_destroy()}
    if y<0{instance_destroy()}
}
if locked=true{
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

}

//create the giant pillars
var tall=35;
if os_type=os_android{tall=5}
for(i=0;i<tall;i++){
    instance_create(0,0-(i*16),obj_block2)
    instance_create(room_width-16,0-(i*16),obj_block2)
}
