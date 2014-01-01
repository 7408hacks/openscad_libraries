use <7408/fillet.scad>

module __rounded_cube(dim, r, rounded)
{
	difference()
	{
		cube(dim, center=true);
		if(r[0])
			for(y=[-1,1])
			for(z=[-1,1])
			scale([1,y,z])
			fillet(r=r[0], h=dim[0]+2, pos=[0, dim[1]/2, dim[2]/2], rot=[0,-90,0]);
		if(r[1])
			for(x=[-1,1])
			for(z=[-1,1])
			scale([x,1,z])
			fillet(r=r[1], h=dim[1]+2, pos=[dim[0]/2, 0, dim[2]/2], rot=[90,0,0]);
		if(r[2])
			for(x=[-1,1])
			for(y=[-1,1])
			scale([x,y,1])
			fillet(r=r[2], h=dim[2]+2, pos=[dim[0]/2, dim[1]/2, 0], rot=[0,0,0]);
		if(r[0]&&(r[1]==r[2])&&(r[0]==r[1]))
			for(x=[-1,1])
			for(y=[-1,1])
			for(z=[-1,1])
			scale([x,y,z])
			translate(dim/2)
			translate(-r)
			scale(r)
			difference()
			{
				cube([2,2,2]);
				sphere(r=1);
			}
	}
}

module rounded_cube(dim=[], r=[], center=false)
{
	if(center)
	{
		__rounded_cube(dim=dim, r=r, r2=r2);
	}
	else
	{
		translate(dim/2)
		__rounded_cube(dim=dim, r=r);
	}
}
