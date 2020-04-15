//AZ - VNITRNI NOZICKY
include<promenne_planetarium.scad>
include<sroubky_matky.scad>

$fn=100;

//NOHY VNITRNI
module Mnohy(){
    cylinder(d=d_Mnohy,h=h_Mnohy, center=true);
    translate([0,0,h_Mnohy/2+h_podMnohy/2])
        cylinder(d=d_podMnohy,h=h_podMnohy, center=true);
}

module tri_Mnohy() {
    color("Orange")
    for(rot=[1:3])
        rotate([rot*120,90,0])
            translate([h_Vnohy/2+t_AZ/2,0,Posun_nohou])
                rotate([0,90,0]) 
                    Mnohy();
}

