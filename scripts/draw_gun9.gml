///draw_gun5(reload,direction,damage,spread,player)
if argument[3]=obj_player{alarm[3]=5}else{alarm[4]=5}
var dir=argument[1];

//audio_play_sound(choose(snd_machine0,snd_machine1,snd_machine2,
//snd_machine3,snd_machine4,snd_machine5,snd_machine6),0,0)


nn=instance_create(argument[3].x+lengthdir_x(10,dir),argument[3].y+lengthdir_y(10,dir),obj_bullet9)
nn.dir=dir
nn.direction=argument[1]//dir//+choose(0,-1,1)//+argument[3]
nn.damage=argument[2]*5
nn.speed=10
nn.image_angle=irandom(360)
