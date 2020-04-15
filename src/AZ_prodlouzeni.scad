//AZ - PRODLOUZENE CASTI
include<promenne_planetarium.scad>
include<sroubky_matky.scad>
include<AZ_soucastky.scad>

$fn=100;

module AZ_prodlouzeni() {
    hull() {
        rotate([0,180,0])   //vzajemne otoceni trojuhelniku...
            scale([1.2*(1/3),1.2,1])
                AZ_trojuhelnik();
        translate([Prodlouzeni_AZ,0,0])
            scale([1,1.2,1])
                AZ_trojuhelnik();
        }
}

module tri_AZ_prodlouzeni() {
    for(rot=[1:3])
        rotate([rot*120,90,180])
            translate([0,0,-2.5*D/3])   //posun tri dilu do stredu
                rotate([0,90,0])
                    AZ_prodlouzeni();
}

module AZ_prodl_Vnohy_sroub() {
    difference() {
        union() {
            tri_AZ_prodlouzeni();
                        
//NOZICKY
            tri_Vnohy(); 
            }
//OTVORY SROUBY A MATKY
        soustava_srouby_matky();
        }
}

/*
rotate([180,0,0])
AZ_prodl_Vnohy_sroub();
*/