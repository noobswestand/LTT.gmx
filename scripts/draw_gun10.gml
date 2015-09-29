///draw_gun10(reload,direction,damage,spread,player)
if argument[3]=obj_player{alarm[3]=5}else{alarm[4]=5}
var dir=argument[1];

audio_play_sound(snd_antiMatter,0,0)
//snd_machine3,snd_machine4,snd_machine5,snd_machine6),0,0)


nn=instance_create(argument[3].x+lengthdir_x(10,dir),argument[3].y+lengthdir_y(10,dir),obj_bullet10)
nn.dir=dir+random_range(-5,5)
nn.direction=argument[1]+random_range(-5,5)//dir//+choose(0,-1,1)//+argument[3]
nn.damage=argument[2]
nn.speed=10
nn.image_angle=irandom(360)
