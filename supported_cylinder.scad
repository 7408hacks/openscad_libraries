/*
style:
0 - plain cylinder
1 - teardrop
2 - trapezoid
*/
module supported_cylinder(r=1,h=1,z_rot=0, style=1, angle=45, center=false)
{
	union()
	{
		cylinder(r=r,h=h,center=center);
		if (style)
		rotate([0,0,z_rot])
		linear_extrude(height=h, center=center)
		if(style==1)
		{
			polygon([[r*sin(angle),r*cos(angle)],[r/sin(angle),0],[r*sin(angle),-r*cos(angle)]]);
		}		
		else if(style==2)
		{
			polygon([[r*sin(angle),r*cos(angle)], [r, r*(cos(angle)-tan(angle)*(1-sin(angle)))], [r, -r*(cos(angle)-tan(angle)*(1-sin(angle)))],[r*sin(angle),-r*cos(angle)]]);
		}
	}
}

