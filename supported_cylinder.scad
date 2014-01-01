support=1;
teardrop_angle=45;
support_cylinder_style="teardrop";

t_ang=teardrop_angle;
module supported_cylinder(r=1,h=1,z_rot=0, center=false)
{
	union()
	{
		cylinder(r=r,h=h,center=center);
		if (support)
		rotate([0,0,z_rot])
		linear_extrude(height=h, center=center)
		if(support_cylinder_style=="trapezoid")
		{
			polygon([[r*sin(t_ang),r*cos(t_ang)], [r, r*(cos(t_ang)-tan(t_ang)*(1-sin(t_ang)))], [r, -r*(cos(t_ang)-tan(t_ang)*(1-sin(t_ang)))],[r*sin(t_ang),-r*cos(t_ang)]]);
		}
		else if(support_cylinder_style=="teardrop")
		{
			polygon([[r*sin(t_ang),r*cos(t_ang)],[r/sin(t_ang),0],[r*sin(t_ang),-r*cos(t_ang)]]);
		}		
	}
}

