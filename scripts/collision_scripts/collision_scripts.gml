// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_collision_x(xdif,ydif){
var xx=0;
var yy=0;
var xreturn=0;
var collide = false;


for(i=0;i<dot_len;i++)
	{
	xx=(x+collision_dot[i][0]*bbox_w/2 -global.grid_x)/global.gridsize;
	yy=(y+collision_dot[i][1]*bbox_h/2 -global.grid_y)/global.gridsize;
	xx=clamp(xx,0,global.grid_w)
	yy=clamp(yy,0,global.grid_h)
	if global.grid[floor(xx)][floor(yy)]=1	//if a collision is present
		{
		if global.grid[floor(xx)][floor(yy+1)]=0 && yy mod 1 >0.7 && y_speed=0{y=( floor(y/global.gridsize) + 0.33 )*global.gridsize }
		if global.grid[floor(xx)][floor(yy-1)]=0 && yy mod 1 <0.3 && y_speed=0{y=( floor(y/global.gridsize) + 0.3 )*global.gridsize }
		if global.grid[floor(xx-sign(x_speed))][floor(yy)]=0{xreturn=-(xx-round(xx))*1.05 x_speed=0}
		collision_active[i]=1
		collide = true;
		}
	
	}
	
	

x+=xreturn*global.gridsize;

return collide;
}


function check_collision_y(xdif,ydif){
var xx=0;
var yy=0;
var yreturn=0;
var collide = false;

for(i=0;i<dot_len;i++)
	{
	xx=(x+collision_dot[i][0]*bbox_w/2 -global.grid_x)/global.gridsize;
	yy=(y+collision_dot[i][1]*bbox_h/2 -global.grid_y)/global.gridsize;
	xx=clamp(xx,0,global.grid_w);
	yy=clamp(yy,0,global.grid_h);
	if global.grid[floor(xx)][floor(yy)]=1	//if a collision is present
		{
		
		var xclamp = xx+1;
		xclamp = clamp(xclamp,0,global.grid_w);
		
		var xclamp = yy+1;
		xclamp = clamp(xclamp,0,global.grid_w);
	
		
		if global.grid[xclamp][floor(yy)]=0 && xx mod 1 >0.7 && x_speed=0{x=( floor(x/global.gridsize) + 0.5 )*global.gridsize }
		
		var xclamp = xx-1;
		xclamp = clamp(xclamp,0,global.grid_w);
		
		if global.grid[xclamp][floor(yy)]=0 && xx mod 1 <0.3 && x_speed=0{x=( floor(x/global.gridsize) + 0.43 )*global.gridsize }
		
		var yclamp = yy-sign(y_speed);
		yclamp = clamp(yclamp,0,global.grid_h);
		
		if global.grid[floor(xx)][floor(yclamp)]=0{yreturn=-(yy-round(yy))*1.05 y_speed=0}
		collision_active[i]=1
		collide = true;
		}
		
	
	}
y+=yreturn*global.gridsize
return collide;
}