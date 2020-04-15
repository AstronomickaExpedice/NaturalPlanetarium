//AZ SOUCASTKY
include<promenne_planetarium.scad>
include<sroubky_matky.scad>

$fn=100;

//NOHY VNEJSI
module Vnohy() {
difference() {
    hull() {
        cylinder(d=d_Vnohy,h=h_Vnohy, center=true);
        translate([-d_Vnohy/2,0, h_Vnohy/2 - (M3_nut_diameter+3)/2])
            rotate([0,90,0])
                cylinder(d=M3_nut_diameter*1.5, h=M3_nut_height+3, center=true);
        }
        cylinder(d=d_Mnohy+tol_nohy,h=h_Vnohy+10, center=true);
        
//SROUBY NOHOU
    translate([-d_Vnohy/2,0,h_Vnohy/2-(M3_nut_diameter+3)/2])
        rotate([0,-90,0])
            union() {              //SROUB, MATKA, ULOZENI MATKY
                hull() {
                    cylinder(d=M3_nut_diameter,h=M3_nut_height,$fn=6, center=true);
                    translate([5,0,0])
                        cylinder(d=M3_nut_diameter,h=M3_nut_height,$fn=6, center=true);
                    }
                cylinder(d=M3_screw_diameter,h=delka_sroubu_Vnohy, center=true);            //telo sroubu
                translate([0,0,delka_sroubu_Vnohy/2])
                    cylinder(d=M3_screw_head_diameter,h=M3_screw_head_height);        //hlavy sroubu
                }
    }
}
                    
module tri_Vnohy() {    //vnejsi cast nozicek (pro tisk spojeno s AZ casti)
    color("OrangeRed")
    for(rot=[1:3])
        rotate([rot*120,90,0])
            translate([h_Vnohy/2+t_AZ/2,0,Posun_nohou])
                rotate([0,90,0])
                    Vnohy();
}

//SOUSTAVA SROUBU A MATEK (M5)              //SPOJENI CELE AZ CASTI
module soustava_sroubyM5() {
    for(rot_i=[1:3])
        for(rot_j=[1:2])
            rotate([rot_i*120+(rot_j*30+15)+60,270,0])
                translate([t_AZ,0,-D*2.2+0.5])
                    rotate([180,90,0]) {
                        sroubek_M5(30);
                        translate([0,0,t_AZ*2.5])
                            matka_M5();
                        }
}

//SOUSTAVA SROUBU A MATEK (M3)              //SPOJENI MOTORU S AZ CASTI
module soustava_sroubyM3() {
    translate([0,0,-t_AZ*1.25])
        for(rot=[1:4])
            rotate([rot*90+45,270,0])
                translate([0,0,a_rozvor17/2*sqrt(2)])
                    rotate([0,90,0])
                        sroubek_M3(30);
}

//SOUSTAVA SROUBU A MATEK
module soustava_srouby_matky() {
//OTVORY SROUBY A MATKY (M5)
        soustava_sroubyM5();

//OTVORY SROUBY MOTOR (M3)
        soustava_sroubyM3();
}
        
//AZ TROJUHELNIK
module AZ_trojuhelnik() { 
    hull() {
        for(rot=[1:3])
            rotate([rot*120,90,0])
                translate([0,0,A])
                    rotate([0,90,0])
                        cylinder(d=D,h=t_AZ, center=true);
        }
}
