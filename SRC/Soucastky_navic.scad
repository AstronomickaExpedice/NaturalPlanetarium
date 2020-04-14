//Soucastky navic
include<promenne_planetarium.scad>
include<sroubky_matky.scad>


//DELKY SROUBU
{
delka_sroubuLoz=16;
}

//TOLERANCE
{
tol_h_sroub=2;

tol_h_podT17=1;
tol_d_podT17=1;
}

//LOZISKO 625
{
D_Loz=16;              //vnejsi prumer loziska
d_Loz=5;               //vnitrni prumer loziska
h_Loz=5;               //vyska loziska
}

//TLOUSTKA soucastek
{
t_kolo=5;            //tloustka ozubenych kol

t_ALT=5;            //tloustka ALT casti

t_podlozky=3;            //tloustka podlozky AZ/ALT motoru
t_ulozLaser=3;           //tloustka sten pro ulozeni laseru

}

//Velke ozubene KOLO
{
d_Vkolo=50;      //prumer velkeho kola
}

//Male ozubene KOLO
{
d_Mkolo=30;      //prumer maleho kola
}

//AZ cast
{
a_AZ=d_Vkolo + a_mot17;         //sirka (x) AZ casti
b_AZ=d_Vkolo;                   //delka (y) AZ casti


}

//Podlozka AZ/ALT NEMA17
{
a_17podl=a_mot17 + 2;           //sirka a delka (xy) podlozky+tolerance
h_17podl=M3_screw_head_height + M3_screw_lenght - h_otvor17 - t_podlozky + 5;    //prostor pod podlozkou pro ulozeni sroubu+tolerance
H_17ulozeni=h_mot17 + 2*t_podlozky + 2;     //vyska boxu podlozky na motor+tolerance
}

//ALT cast
{
mezera_ALTosy=h_Loz*2.5;        //toutou konstantou dochazi k posunu soucastek upevnenych na ALT ose

a_ALT=h_mot17 + mezera_ALTosy*2 + a_Laser + t_podLaser + tol_a_pod17;   //sirka (x) ALT casti
b_ALT=a_mot17 + tol_b_pod17;   //delka (y) ALT casti
h_ALT=Uhlopricka_drzakLaser+10;                         //vyska (z) ALT casti
}


///////////////////////////////////////////


//POSUNY
{
//tyto posuny jsou pouze kvuli prohlizeni modelu jako celku
Posun_perspektivy=0;               //osa z
Posun_perspektivy_motor=50;
Posun_AZkol=20;

//Posuny jednotlivych casti kvuli podminkam otaceni, velikosti,...
Posun_AZmot= sqrt(a_ALT^2 + b_ALT^2);  //polomer nutny pro otoceni ALT casti

Posun_a_mot_laser=0;
Posun_podLaser=5;
PosunALT_Vkolo=10;
posun_matkaLaser=1.5;
Posun_uchytM3 = M3_screw_diameter*1.2 + t_podLaser/2;   //uchyceni sroubu (drzak laseru) oproti podlozce

U_a_pod17=a_ALTpod17/2 - tol_a_pod17/3;     //Vzdalenost nohou podlozky Laseru ve smeru a
U_b_pod17=b_ALTpod17/2 - tol_b_pod17/3;     //Vzdalenost nohou podlozky Laseru ve smeru b

a_AZkol=Posun_AZmot/2+a_mot17/2 +10;        //vzdalenost osy AZ a stredu motoru AZ

D_ulozAZ_Loz=D_Loz*3;
h_ulozLoz=h_Loz*2;
}

//HLOUBKY LOZISEK
{
Hloubka_loziskaAZ= t_AZ/2 + h_Loz/2 ;               //AZ osa, AZ cast
Hloubka_loziskaALT_Laser= t_ALT/2 + h_Loz/2 + 0.1;  //ALT osa, ALT cast
}

//LOZISKO
module lozisko() {
    color("LightGreen")
    cylinder(d=D_Loz,h=h_Loz, center=true);
}

//Ulozeni loziska
module ulozeni_loziskaAZ_sroub() {
    difference() {
        cylinder(d1=D_ulozAZ_Loz,d2=D_Loz,h=h_ulozLoz, center=true);
            scale([1.1,1.1,1.1])
                translate([0,0,-h_Loz/2+0.45])
                    lozisko();
        for(rot=[1:3])
            rotate([rot*120,90,0])
                translate([D_Loz/3.5,0,D_Loz*(4/5)])
                    rotate([180,90,0]){
                        cylinder(d=M3_screw_diameter, h=delka_sroubuLoz*2, center=true);            //telo sroubu
                         translate([0,0, delka_sroubuLoz/2 + t_ALT/2 - tol_h_sroub])
                            cylinder(d=M3_screw_head_diameter, h=M3_screw_head_height*2, center=true);        //hlavy sroubu (zvetsene 2krat kvuli otvoru)
                     }
        cylinder(d=M3_screw_diameter,h=100, center=true);
    }
}

module ulozeni_loziskaAZ_matka_M3() {
    difference() {
        cylinder(d1=D_ulozAZ_Loz,d2=D_Loz,h=h_Loz*2, center=true);
        scale([1.1,1.1,1.1])
        translate([0,0,-h_Loz/2+0.45])
        lozisko();
        for(rot=[1:3])
            rotate([rot*120,90,0])
                translate([D_Loz/3.5,0,D_Loz*(4/5)])
                    rotate([180,90,0]){
                         cylinder(d=M3_screw_diameter, h=delka_sroubuLoz*2, center=true);            //telo sroubu
                         translate([0,0, delka_sroubuLoz/2 + t_ALT/2 - tol_h_sroub])
                            cylinder(d=M3_nut_diameter, h=M3_nut_height*2,$fn=6, center=true);        //matky (zvetsene 2krat kvuli otvoru)
                        cylinder(d=M3_screw_diameter,h=100, center=true);
}
}
}

//VELKE KOLO
module Vkolo() {
    color("Lime")
    cylinder(d=d_Vkolo,h=t_kolo, center=true);
}

//MALE KOLO
module Mkolo() {
    color("Lime")
    cylinder(d=d_Mkolo,h=t_kolo, center=true);
}

//ALT cast
module ALT() {
    difference() {
        union() {
            color("DeepSkyBlue")
            cube([a_ALT,b_ALT,t_ALT], center=true);     //vodorovna cast
//UCHYCENI AZ OSY
            hull() {
                    rotate([0,0,0])
                    translate([0,0,t_ALT/4+h_tyc17/4+2.5]) {
                        cylinder(d=d_tyc17*2, h=h_tyc17/2-t_ALT/2+5, center=true);
                        rotate([90,0,0])
                        translate([0,-M3_screw_diameter,-delka_sroubuL_drzak])
                            cylinder(d=M3_screw_diameter*3, h=delka_sroubuL_drzak/2, center=true);
                        }
                }
            }
//OTVORY UCHYCENI AZ OSY
            rotate([90,0,0])
                translate([0 ,+Posun_uchytM3, -delka_sroubuL_drzak ]) {
                    sroubek_M3(delka_sroubuL_drzak);
                    translate([0,0,delka_sroubuL_drzak/2 ])
                        rotate([0,0,0])
                            hull() {
                                matka_M3();
                                translate([-M3_nut_diameter,0,0])
                                    matka_M3();
                                }
                    }
                    
//OTVOR TYC MOTORU
            cylinder(d=d_tyc17+tol_d_tyc17/2, h=h_tyc17, center=true);

//UCHYCENI PODLOZKY ALT MOTORU
            rotate([90,0,0])
            translate([-a_ALT/2 + h_mot17/2 + tol_a_pod17/2, 0, 0])
                rotate([-90,0,0])
                    for(rot=[1:2])
                        for(i=[1:2])
                            rotate([0,0,rot*180])
                                translate([U_a_pod17*(-1)^i, U_b_pod17, h_ALTpod17/2 ]){
                                    translate([0,0,-h_ALTpod17/2 - t_ALT/2 +1])
                                        sroubek_M3(delka=40);
                                    }
//REZ ALT CASTI
/*    translate([50,0,0])
        cube([100,100,100],center=true);*/
        }
}

module ulozeni_M5() {
    difference() {
                    cylinder(d1=M5_nut_diameter*5, d2=M5_nut_diameter*1.5, h=t_ALT + M5_nut_height*2, center=true);
                    cylinder(d=M5_nut_diameter, h=t_ALT + M5_nut_height*3, $fn=6, center=true);
                    }
                }

//LASER DRZAK
module drzak_Laseru() {
    difference() {
        union() {
            color("SlateBlue")      //zakladni cast
            cube([a_Laser+15,t_podLaser,h_Laser], center=true);
            color("LightBlue")
            difference() {
//UPEVNENI ALT OSY
                hull() {
                    rotate([90,0,0])
                    translate([0,0,Posun_uchytM3]) {
                        cylinder(d=d_ALT_ulozT17, h=M3_screw_diameter*3, center=true);
                        rotate([0,90,0])
                        translate([0,0,-delka_sroubuL_drzak])
                            cylinder(d=M3_screw_diameter*3, h=delka_sroubuL_drzak/2, center=true);
                            }
                    }

//OTVORY UPEVNENI ALT OSY
                rotate([0,90,0])
                translate([0 ,-Posun_uchytM3, -delka_sroubuL_drzak ])
                    sroubek_M3(delka_sroubuL_drzak);
                    translate([-delka_sroubuL_drzak/2 ,-Posun_uchytM3,0 ])
                    rotate([0,90,0])
                        hull() {
                            matka_M3();
                            translate([M3_nut_diameter,0,0])
                                matka_M3();
                            }
                }
        }

        rotate([90,0,0])
            cylinder(d=d_tyc17+tol_d_tyc17/2, h=100, center=true);

//OTVORY SROUBY + MATKY
        translate([-1.4,-26,1.5])
            rotate([270,0,0])
                for(rot=[1:2])
                    for(i=[1:2])
                        rotate([0,0,rot*180])
                            translate([U_a_pod17*(-1)^i, U_b_pod17, h_ALTpod17/2 ]){
                                translate([0,0,-h_ALTpod17/2 - t_ALT/2 +1])
                                    sroubek_M3(delka=35);
                                translate([0,0,h_ALTpod17/2 + t_ALTpod17/2])
                                    hull() {
                                        matka_M3();
                                        translate([0,0,M3_nut_height])  //ULOZ. MATKY
                                            matka_M3();
                                        }
                                }
         }
}

/*
//VYPOCTY
h_ALTosa=t_kolo + t_ALT + t_podLaser + mezera_ALTosy*3;
*/

// ECHO
{
echo("Musi byt kladne. Otaceni laseru kvuli AZmot =",Posun_AZmot/2 - (a_ALT/4+Uhlopricka_drzakLaser/2));    //pokud bude zaporne, nutno preparametrizovat vzdalenost AZ motoru od ALT casti

echo("Musi byt kladne, MIN = 5. Tloustka AZ casti v mezere AZ osy =", t_AZ-2*h_Loz);
echo("Musi byt kladne, MIN = 5. Tloustka ALT casti v mezere AZ/ALT osy =", t_ALT-2*h_Loz);
echo("Musi byt kladne, MIN = 5. Tloustka drzaku Laseruv mezere ALT osy =", t_podLaser-2*h_Loz);
echo(Posun_AZmot/2 -(a_ALT/4+h_Laser/2));
echo(sqrt(29)*(33/29));
echo("vzdalenost AZ motor a AZ osa", Posun_AZmot/2+a_mot17/2);
echo(Posun_AZmot/2+a_mot17);
}
