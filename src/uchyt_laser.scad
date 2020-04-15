//UCHYT LASERU
include<promenne_planetarium.scad>
include<sroubky_matky.scad>

$fn=100;

//PODLOZKA LASERU
module pod_Laser() {
    color("Orange")
    difference() {
        union() {
            cube([h_Laser, a_Laser, t_podLaser], center=true);    //vodorovna cast
            translate([0,0,(h_kuzelLaser)/2+t_podLaser/2]) {
                difference() {
                    cylinder(d1=d_ALT_ulozT17*2, d2=d_ALT_ulozT17, h=h_kuzelLaser, center=true);
                    cylinder(d=d_tyc17+tol_d_tyc17, h=h_kuzelLaser, center=true);
                    }
                }
            }
//OTVORY UPEVNENI ALT OSY
        translate([0,0,(h_kuzelLaser)/2+t_podLaser/2]) {
            rotate([90,0,0])
            translate([0 ,-h_kuzelLaser/4, -delka_sroubuL_drzak ])
                sroubek_M3(delka_sroubuL_drzak);
            translate([0 ,d_tyc17/2+M3_nut_height/2+tol_h_matka,0 ])
            rotate([0,90,90])
                hull() {
                    matka_M3();
                    translate([h_tyc17,0,0])
                        matka_M3();
                    }
            }

         for(rot=[1:2]){
            for(i=[1:2])
                rotate([180,0,rot*180])
                translate([20*(-1)^i, 10, - t_podLaser*0.25]){
                    sroubek_M3(delka=35);
                    }
            rotate([180,0,rot*180])
            translate([20, 0, - t_podLaser*0.25]){
                sroubek_M3(delka=35);
                }
            }

/* //REZ
   translate([0,-50,0])
       cube([100,100,100], center=true); */
        }
}

pod_Laser();