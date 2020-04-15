//AZ - STRED
include<promenne_planetarium.scad>
include<sroubky_matky.scad>
include<AZ_soucastky.scad>

$fn=100;

module AZ_stred_sroub() {
    difference() {
        translate([0,0,t_AZ])
        scale([2,2,1])
            AZ_trojuhelnik();
        soustava_srouby_matky();
        }
}

module AZ_stred_matka() {
    difference() {
        translate([0,0,-t_AZ])
        scale([2,2,1])
            AZ_trojuhelnik();
            soustava_srouby_matky();
        }
}
/*
AZ_stred_sroub();
translate([0,100,t_AZ*2])
    AZ_stred_matka();
*/