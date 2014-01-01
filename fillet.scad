module fillet(r, h, pos, rot)
{
	translate(pos)
	rotate(rot)
	translate([-r,-r,0])
		difference()
		{
			translate([0,0,-h/2])
				cube([r+1,r+1,h]);
			cylinder(r=r, h=h+2, center=true);
		}
}
