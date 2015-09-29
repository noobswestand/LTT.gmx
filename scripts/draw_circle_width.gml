///draw_circle_width(x,y,r,w)
//0=X
//1=Y
//2=Radius
//3=Outline Width
varOW=argument3
varCR=argument2
varX=argument0
varY=argument1
{
   iii=varCR-(varOW/2)
   repeat(varOW*2){
       draw_circle(varX,varY,iii,1)
       iii+=1/2
   }
}
iii=0
