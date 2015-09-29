///draw_gun5(reload,direction,damage,spread,player)
if argument[4]=obj_player{alarm[3]=argument[0]}else{alarm[4]=argument[0]}
var dir=argument[1];

audio_play_sound(choose(snd_machine0,snd_machine1,snd_machine2,
snd_machine3,snd_machine4,snd_machine5,snd_machine6),0,0)
nn=instance_create(argument[4].x+lengthdir_x(10,dir),argument[4].y+lengthdir_y(10,dir),obj_bullet5)
nn.dir=dir
nn.direction=argument[3]//dir//+choose(0,-1,1)//+argument[3]
nn.damage=argument[2]
nn=instance_create(argument[4].x+lengthdir_x(5,dir),argument[4].y+lengthdir_y(5,dir),obj_shell0)
nn.direction=irandom(360)
nn.speed=irandom(5)
