//case 21
todo=readbyte()
switch(todo){
    case 1:
        var xx,yy;
        xx=readshort()-8
        yy=readshort()-8
        var newhelth=readfloat();
        if place_meeting(xx+8,yy+8,par_block){
            nn=instance_place(xx+8,yy+8,par_block)
            if nn!=noone{
                nn.helth=newhelth
                
            }
        }
    break;
    
    case 2:
        var xx,yy;
        xx=readshort()-8
        yy=readshort()-8
        var newhelth=readshort();
        if place_meeting(xx+8,yy+8,par_block){
            nn=instance_place(xx+8,yy+8,par_block)
            if nn!=noone{
                with(nn){
                    if id!=other.id{
                        nn=instance_create(x,y,obj_blockdead)
                        nn.sprite_index=sprite_index
                        nn.image_index=image_index
                        instance_destroy()
                    }
                }
            }
        }
    break;
    
    
    case 3://crate
    var xx,yy;
        xx=readshort()-8
        yy=readshort()-8
        var newhelth=readshort();
        if place_meeting(xx+8,yy+8,obj_crate){
            nn=instance_place(xx+8,yy+8,obj_crate)
            if nn!=noone{
                with(nn){
                    if id!=other.id{
                        instance_destroy()
                    }
                }
            }
        }
    break;
    
    case 4:
        var xx,yy;
        xx=readshort()-8
        yy=readshort()-8
        var newhelth=readfloat();
        if place_meeting(xx+8,yy+8,obj_crate){
            nn=instance_place(xx+8,yy+8,obj_crate)
            if nn!=noone{
                nn.helth=newhelth
                
            }
        }
    break;
    
    
    case 5://chest
    var xx,yy;
        xx=readshort()-8
        yy=readshort()-8
        var newhelth=readshort();
        if place_meeting(xx+8,yy+8,obj_chest){
            nn=instance_place(xx+8,yy+8,obj_chest)
            if nn!=noone{
                with(nn){
                    if id!=other.id{
                        instance_destroy()
                    }
                }
            }
        }
    break;
    
    case 6://tnt
    var xx,yy;
        xx=readshort()-8
        yy=readshort()-8
        var newhelth=readshort();
        if place_meeting(xx+8,yy+8,obj_dynamite){
            nn=instance_place(xx+8,yy+8,obj_dynamite)
            if nn!=noone{
                with(nn){
                    if id!=other.id{
                        instance_destroy()
                    }
                }
            }
        }
    break;
}
