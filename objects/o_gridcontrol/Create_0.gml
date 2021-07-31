/// @description Insert description here
// You can write your code in this editor
global.grid_x=room_width/5;
global.grid_y=room_height/8;
global.grid_w=24;
global.grid_h=16;
global.gridsize=16;

for(i=0;i<global.grid_w;i++)
	{
	
	for(j=0;j<global.grid_h;j++)
		{
		global.grid[i][j]=0
		
		if i=0 or i=global.grid_w-1 or j=0 or j=global.grid_h-1{global.grid[i][j]=1}
		}
	
	}
	
