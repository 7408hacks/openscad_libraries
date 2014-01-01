/*parameters*/
// preview[view:south, tilt:top diagonal]
/* [Global] */
// Material type
type="ABS"; //[ABS,PLA,PS,PP,OTHER]
// Width of the symbol
size=20; //[1:50]
// Thickness of the symbol
T=1; //[1:10]
/* [Hidden] */
use <write/Write.scad>
Font = "write/Letters.dxf";

color("SteelBlue") recycling_symbol(type, size, T);

module recycling_symbol(type="ABS", size=10, h=1, pos=[], rot=[]){
	symbol_h=2;
	carve_h=symbol_h*2;
	fontsize_number=12;
	fontsize_letters=12;
	code=(type=="ABS"?"9":type=="PS"?"6":type=="PP"?"5":"7");
	L=len(type);

	translate(pos) rotate(rot) 
	scale([size/32, size/32, h/2]) translate([0,3,0]) // center
	{
		for(i=[0:L])
			translate([10*(i-L/2+1/2),-18,symbol_h/2]) write(type[i], t=symbol_h, h=fontsize_letters, center=true, font=Font);
		translate([0,2,symbol_h/2]) write(code, t=symbol_h, h=fontsize_number, center=true, font=Font);
		difference()
		{
			union()
			{
				difference()
				{
					__triang(4,symbol_h,0);
					__triang(2,carve_h,-1);
				}
				translate([3.5,-7.25,symbol_h/2]) cube(size=[3,8,symbol_h],center=true);
				translate([8.5,5.75,symbol_h/2]) rotate([0,0,122]) cube(size=[3,8,symbol_h],center=true);
				translate([-10.75,2,symbol_h/2]) rotate([0,0,-122]) cube(size=[3,8,symbol_h],center=true);
			}
			__arrow(carve_h, [0,-7.5,symbol_h/2], []); //Lower Arrow Head
			__arrow(carve_h, [10.5,3,symbol_h/2], [0,0,122]); //Right Arrow Head
			__arrow(carve_h, [-9.25,5,symbol_h/2], [0,0,-122]); //Left Arrow Head
		}
	}
}

module __triang(r, h, z)
{
	hull()
	{
		translate([0,14,z]) cylinder(r=r, h=h);
		translate([12,-4.5,z]) cylinder(r=r, h=h);
		translate([-12,-4.5,z]) cylinder(r=r, h=h);
	}
}

module __arrow(carve_h,pos,rot)
{
	translate(pos) rotate(rot) union()
	{
			translate([-1,0,0]) cube(size=[3,8,carve_h], center=true);
			translate([1.75,-2.25,0]) rotate([0,0,40]) cube(size=[3,8,carve_h],center=true);
			translate([1.75,2.25,0]) rotate([0,0,-40]) cube(size=[3,8,carve_h],center=true);
	}
}