///scr_generateRoom()
randomize()
//walls on the outside
var doors=choose(1,2)
switch(doors){

    case 1://Create a wall with 1 "door" on each side
        var door=irandom_range(64,room_height-64)
        var door1=round(irandom_range(0,(room_height/2)-96)/16)*16
        var door2=round(irandom_range((room_height/2),room_height-96)/16)*16
        
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
        var width=choose(16,32)
        repeat(2){
            width+=choose(48,96)
            //create the floating chunks
            var start=round(irandom_range(width,48)/16)*16
            var stop=round(irandom_range(start+32,start+64)/16)*16
            var hei=round(irandom_range(-16,48)/16)*16
            var hei2=round(irandom_range(32,64)/16)*16
            for(i=start;i<stop;i+=16){
                if irandom(10)=1{
                    hei+=round(irandom_range(-16,16)/16)*16
                }
                if irandom(7)=1{
                    hei2+=round(irandom_range(-16,16)/16)*16
                }
                for(z=0;z<hei2;z+=16){
                    instance_create(i,hei+(door1+80)+z,obj_block0)
                    instance_create((room_width-16)-i,hei+(door1+80)+z,obj_block0)
                }
            }
        }
        
        
        if irandom(1)=0{
            //var height=0;
            //create the bottom
            var height=0
            for(d=16;d<(room_width/2);d+=16){
                if irandom(4)=1{
                    height+=round(irandom_range(32,-32)/16)*16
                    if height+(ceil(door2/16)*16)+64>room_height-32{height=((room_height-32)-(ceil(door2/16)*16))-64}
                }
                if d>room_width-64 or d<64{//check to see if it is on the last block
                    height=0
                }
                if height<-32{height=-32}
                
                
                for(f=(ceil(door2/16)*16)+64;f<room_height+128;f+=16){
                    instance_create(d,f+height,obj_block0)
                    instance_create((room_width-d)-16,f+height,obj_block0)
                }
            }
            
            with(par_block){
                if y>=room_height-16{instance_destroy()}
            }
            
            
        }else{
            //create the bottom
            for(d=16;d<room_width-16;d+=16){
                for(f=(ceil(door2/16)*16)+64;f<room_height-16;f+=16){
                    instance_create(d,f,obj_block0)
                }
            }
        }
        
        
        
        
    break;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    case 2:
        var door1=round(irandom_range(0,(room_height/2)-96)/16)*16
        var door2=round(irandom_range((room_height/2),room_height-96)/16)*16
        for(i=0;i<door1;i+=16){
            instance_create(0,i,obj_block2)
            instance_create(room_width-16,i,obj_block2)
        }
        for(a=i+64;a<door2;a+=16){
            instance_create(0,a,obj_block2)
            instance_create(room_width-16,a,obj_block2)
        }
        for(c=a+64;c<room_height;c+=16){
            instance_create(0,c,obj_block2)
            instance_create(room_width-16,c,obj_block2)
        }
        
        for(b=i;b<a;b+=16){
            instance_create(-16,b,obj_block2)
            instance_create(room_width,b,obj_block2)
        }
        
        for(t=0;t<room_height;t+=16){
            instance_create(-16,t,obj_block2)
            instance_create(room_width,t,obj_block2)
        }
        
        var width=choose(48,64,96)
        for(p=16;p<=width;p+=16){
            for(q=door1+64;q<door2;q+=16){
                instance_create(p,q,obj_block1)
                instance_create((room_width-16)-p,q,obj_block1)
            }
        }
        for(n=16;n<room_width-16;n+=16){
            for(m=0;m<door1;m+=16){
                instance_create(n,m,obj_block1)
            }
        }
        
        
         //create the floating chunks
        var start=round(irandom_range(width+64,48)/16)*16
        var stop=round(irandom_range(start+32,start+64)/16)*16
        var hei=round(irandom_range(-16,32)/16)*16
        var hei2=round(irandom_range(16,32)/16)*16
        for(i=start;i<stop;i+=16){
            if irandom(10)=1{
                hei+=round(irandom_range(-16,16)/16)*16
            }
            if irandom(7)=1{
                hei2+=round(irandom_range(-16,16)/16)*16
            }
            for(z=0;z<hei2;z+=16){
                instance_create(i,hei+(door1+80)+z,obj_block0)
                instance_create((room_width-16)-i,hei+(door1+80)+z,obj_block0)
            }
        }
        
        
        if irandom(1)=0{
            //var height=0;
            //create the bottom
            var height=0
            for(d=16;d<(room_width/2);d+=16){
                if irandom(4)=1{
                    height+=round(irandom_range(32,-32)/16)*16
                    if height+(ceil(door2/16)*16)+64>room_height-32{height=((room_height-32)-(ceil(door2/16)*16))-64}
                }
                if d>room_width-64 or d<64{//check to see if it is on the last block
                    height=0
                }
                if height<-32{height=-32}
                
                
                for(f=(ceil(door2/16)*16)+64;f<room_height+128;f+=16){
                    instance_create(d,f+height,obj_block0)
                    instance_create((room_width-d)-16,f+height,obj_block0)
                }
            }
            
            with(par_block){
                if y>=room_height-16{instance_destroy()}
            }
            
            
        }else{
            //create the bottom
            for(d=16;d<room_width-16;d+=16){
                for(f=(ceil(door2/16)*16)+64;f<room_height-16;f+=16){
                    instance_create(d,f,obj_block0)
                }
            }
        }
        
        
        
        
        
        
        
    break;
    
}
