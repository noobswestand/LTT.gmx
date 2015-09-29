///scr_menudraw_santa(sprite)
if CHRISTMAS=true{
    var yy=(5*sprite_get_yoffset(argument[0]))-10
    var xx=-5
    draw_sprite_ext(spr_santahat2,0,argument[1]+xx,argument[2]-yy,5,5,0,c_white,1)
}
if PARTY=true{
    var yy=(5*sprite_get_yoffset(argument[0]))-10
    var xx=0
    draw_sprite_ext(spr_santahat,0,argument[1]+xx,argument[2]-yy,1.5,1.5,0,global.PartyHatColour,1)
}
