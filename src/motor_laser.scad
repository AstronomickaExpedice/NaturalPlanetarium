//motor NEMA17 a Laser
include<promenne_planetarium.scad>
include<sroubky_matky.scad>

$fn=100;

//MOTOR
module motor() {
    color("OrangeRed") {
    cube([a_mot17,a_mot17,h_mot17], center=true);   //telo motoru
        translate([0,0, h_mot17/2]) {
            cylinder(d=d_tyc17, h=h_tyc17);         //tyc motoru
            cylinder(d=d_pod17, h=h_pod17);         //podlozka u tyce
            }
        }
    
    color("Orange")                             //otvory na srouby
    translate([0,0,+h_mot17/2-h_otvor17/2+0.1])
        for(rot=[1:4])
            rotate([rot*90+45,90,0])
                translate([0,0,a_rozvor17/2*sqrt(2)])
                    rotate([0,90,0])
                        cylinder(d=d_otvor17,h=h_otvor17, center=true);
        
    color("Orange")                             //otvory na srouby
    translate([0,0,-h_mot17/2+h_otvor17/2+0.1])
        for(rot=[1:4])
            rotate([rot*90+45,90,0])
                translate([0,0,a_rozvor17/2*sqrt(2)])
                    rotate([0,90,0])
                        cylinder(d=d_otvor17,h=h_otvor17, center=true);
}

//LASER
module Laser() {
    color("LightSalmon")
    cube([a_Laser,a_Laser,h_Laser], center=true);
}

/*
motor();
translate([-50,0,0])
Laser();
*/