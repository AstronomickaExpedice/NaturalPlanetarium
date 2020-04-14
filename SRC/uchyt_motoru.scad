//UCHYCENI OBOU MOTORU
include<promenne_planetarium.scad>
include<sroubky_matky.scad>
include<motor_laser.scad>

$fn=100;

//UCHYT AZ ALT MOTORU
module uchyt_AZ_ALTmot() {
rotate([0,90,0])
difference() {
    union() {
    translate([h_mot17/2 + t_ALTpod17/2, 0, 0]){
        difference() {
//SVISLA CAST
            hull() {
                cube([t_ALTpod17,a_mot17,a_mot17], center=true);  //svisla cast
                rotate([90,0,0])
                translate([0,0,Uhlopricka_drzakLaser/2 + tol_otocLaser - h_tyc17/2-h_pod17])    //uchyt tyce
                    cube([d_AZ_ulozT17, d_AZ_ulozT17, h_tyc17-h_pod17-tol_h_tyc17], center=true);
                }

//otvory sroubu (svisla cast)
            translate([t_ALTpod17/2-M3_screw_head_height/2,0,0])
                for(rot=[1:4])
                    rotate([rot*90+45,0,0])
                    translate([0,0,a_rozvor17/2*sqrt(2)])
                    rotate([0,90,180])
                        sroubek_M3();
                
//otvor v uchytu tyce
            rotate([90,0,0])
            translate([0,0,Uhlopricka_drzakLaser/2 + tol_otocLaser - h_tyc17/2 - h_pod17]) {
                cylinder(d=d_tyc17+tol_d_tyc17, h=h_tyc17-h_pod17-tol_h_tyc17+0.1, center=true);
                }

//OTVOR SROUB + MATKA (UPEVNENI AZ OSY)
            translate([0,-(Uhlopricka_drzakLaser/2 + tol_otocLaser - h_tyc17/2-h_pod17),0]) {
                rotate([180,0,0])
                translate([0 ,0, -delka_sroubu_AZosa ])
                    sroubek_M3(delka_sroubu_AZosa);
                translate([0 ,0,(d_tyc17/2+M3_nut_height/2+tol_h_matka) ])
                    hull() {
                        matka_M3();
                        translate([-h_tyc17,0,0])
                            matka_M3();
                        }
                }
            }
        }
    }
 
//OTVOR TYC MOTORU
        translate([Posun_drzak_AZmot/2-tol_d_tyc17/2,0,0])
        rotate([0,90,0]) {
            motor();
            translate([0, 0, h_mot17/2+h_tyc17/2])
                cylinder(d=d_ALT_ulozT17*1.5, h=h_tyc17, center=true);  //tyc motoru
            }

/* //REZ
   translate([0,0,-50])
       cube([100,100,100], center=true);   */
    }
}

uchyt_AZ_ALTmot();