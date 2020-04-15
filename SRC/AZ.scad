//AZ cast
include<promenne_planetarium.scad>
include<sroubky_matky.scad>
include<AZ_nozicky_vnitrni.scad>
include<AZ_stred.scad>
include<AZ_prodlouzeni.scad>
include<AZ_soucastky.scad>

$fn=100;


module AZ() {
//STRED   
color("LightBlue") {                         
    AZ_stred_sroub();
    AZ_stred_matka();
    }

//PRODLOUZENE CASTI + NOZICKY
AZ_prodl_Vnohy_sroub();
                    
//NOZICKY
translate([0,0,-h_Vnohy*(1/2)])
    tri_Mnohy();
            
}

AZ();