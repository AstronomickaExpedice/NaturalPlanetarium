//SROUBKY A MATKY (M3 a M5)

//sroubek_M3
module sroubek_M3(delka = 10) {
    cylinder(d=M3_screw_diameter, h=delka);     //telo sroubu
    translate([0,0, -M3_screw_head_height])
        cylinder(d=M3_screw_head_diameter, h=M3_screw_head_height);     //hlava sroubu
        
}

//sroubek_M5
module sroubek_M5(delka = 20) {
    cylinder(d=M5_screw_diameter, h=delka);     //telo sroubu
    translate([0,0, -M5_head_height])
        cylinder(d=M5_head_diameter, h=M5_head_height);     //hlava sroubu         
}

//MATKA_M3
module matka_M3() {
    difference() {
        cylinder(d=M3_nut_diameter, h=M3_nut_height, $fn=6, center=true);   //matka
        cylinder(d=M3_screw_diameter, h=M3_nut_height+0.2, center=true);    //otvor
        }
}

//MATKA_M5
module matka_M5() {
    difference() {
        cylinder(d=M5_nut_diameter, h=M3_nut_height, $fn=6, center=true);   //matka
        cylinder(d=M5_screw_diameter, h=M5_nut_height+0.2, center=true);    //otvor
        }
}