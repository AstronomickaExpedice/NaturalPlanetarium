include<promenne_planetarium.scad>
echo(z_promennych);

//PLANETARIUM
$fn=100;

//DELKY SROUBU
{
delka_sroubuLoz=16;
delka_sroubu_Vnohy=10;
delka_sroubu_podLaser=10;
delka_sroubu=10;
delka_sroubuL_drzak=20;
delka_sroubu_AZosa=20;
}

/* pred tiskem celeho modelu
1) vytisknout AZ nohu (pomery vnitrni vnejsi noha; ulozeni sroubu)
2) vytisknout ulozeni loziska
2} zkontrolovat tolerance(prumery os, ulozeni lozisek,...)
3) zkontrola ulozeni sroubu u obalky motoru
4) ulozeni motoru - otvory na draty
5) upravit delky sroubu, nastaveni matek,...
*/

//TOLERANCE
{
tol_sten=0.5;           //tolerance sten pri ulozeni motoru a laseru
tol_nohy=1;             //tolerance sten pri ulozeni nohou

tol_h_sroubLoz=2;
tol_h_sroub17=2;
tol_h_sroub=2;
tol_h_sroubLaser=2;
tol_h_sroubAZosa=2;

tol_h_drzakLaser=10;
tol_b_pod17=15;
tol_a_pod17=15;

tol_h_podT17=1;
tol_d_podT17=1;
tol_d_tyc17=1;
tol_h_tyc17=1;

tol_h_matka=1;

tol_otocLaser=5;

}

//SROUBY M3
{
M3_screw_lenght=10;           //delka sroubu
M3_screw_diameter=3.2;        //prumer sroubu (zavit)
M3_nut_height=2.7;            //vyska matky
M3_nut_diameter=6.6;          //prumer matky (kruznice opsana)
M3_screw_head_height=3;       //vyska hlavy sroubu
M3_nut_pocket=5.6;
M3_screw_head_diameter=6.6;           //prumer hlavy sroubu

h_otvor_sroub=8;           //delka otvoru pro sroub
}

//MOTOR NEMA 17
{
//BOKORYS
h_mot17=45;             //vyska hlavni casti motoru (muze byt v hodnotach 34-48mm nebo 60mm)
h_tyc17=24.0;           //vyska stredove tyc (podlozka+tyc), tolerance 1mm
d_tyc17=5.0;           //prumer stredove tyc, tolerance 0.012mm
d_pod17=22.0;          //prumer podlozky stredove tyc, tolerance 0.05mm
h_pod17=2;                 //vyska podlozky stredove tyc
H_mot17=h_mot17+h_tyc17;    //celkova vyska motoru
//PUDORYS
a_mot17=42.3;           //sirka motoru; bez tolerance, hodnota udana MAX
a_rozvor17=31.0;           //rozvor der pro srouby M3, tolerance 0.1mm
d_otvor17=4;             //prumer otvoru pro srouby M3, hloubka 4.5 MIN
h_otvor17=4.5;            //MIN hloubka otvoru pro srouby M3 udana vyrobcem
}

//LOZISKO 625
{
D_Loz=16;              //vnejsi prumer loziska
d_Loz=5;               //vnitrni prumer loziska
h_Loz=5;               //vyska loziska
}

//LASER
{
a_Laser=30;         //sirka Laseru (xy)
h_Laser=60;         //vyska Laseru
Uhlopricka_drzakLaser= sqrt(a_Laser^2 + h_Laser^2);
}

//TLOUSTKA soucastek
{
t_kolo=5;            //tloustka ozubenych kol
t_AZ=5;            //tloustka AZ casti
t_ALT=5;            //tloustka ALT casti
t_podLaser=5;            //tloustka podlozky Laseru
t_podlozky=3;            //tloustka podlozky AZ/ALT motoru
t_ulozLaser=3;           //tloustka sten pro ulozeni laseru
t_Vnohy=5;                 //tloustka nohou (rovina prumeru)
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

h_Vnohy=20;                      //vyska vnejsich nohou
d_Vnohy=11;                     //prumer vnejsich nohou

h_Mnohy=h_Vnohy-tol_nohy*2;     //vyska vnitrnich nohou
d_Mnohy=d_Vnohy-t_Vnohy-tol_nohy; //prumer vnitrnich nohou

d_podMnohy=d_Vnohy+10;      //vyska podlozky vnitrnich nohou
h_podMnohy=3;               //prumer podlozky vnitrnich nohou
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

//ALT podlozka motoru
{
d_ALT_ulozT17=d_tyc17*2;
d_AZ_ulozT17=d_tyc17*2;
Posun_drzak_AZmot=(d_AZ_ulozT17-d_tyc17);

a_ALTpod17 = h_mot17 + tol_b_pod17;
b_ALTpod17 = a_mot17 + tol_b_pod17;
t_ALTpod17 = d_tyc17 + Posun_drzak_AZmot;
h_ALTpod17 = Uhlopricka_drzakLaser/2 + tol_h_drzakLaser - a_mot17/2;
}

//SROUBY M5
{
M5_screw_lenght=20;           //delka sroubu
M5_screw_diameter=5.5;        //prumer sroubu (zavit)
M5_nut_height=4 + 0.5;            //vyska matky
M5_nut_diameter=9.4;          //prumer matky (kruznice opsana)
M5_head_height=5;               //vyska hlavy sroubu
M5_nut_pocket=8.4;
M5_head_diameter=13 + 0.5;  //prumer hlavy sroubu
}

///////////////////////////////////////////

//AZ cast hodnoty
{
//cela AZ cast navrzena funkci hull
A=a_mot17*0.4;               //vzdalenost od stredu kruhu tvoricich AZ cast
D=A;                //prumer kruhu tvoricich AZ cast
Teziste=D/6;       //posun ze stredu do teziste trojuhelniku
Prodlouzeni_AZ=5*D;             //vzdalenost od stredu trojuhelniku tvoricich spodni dily
}

//POSUNY
{
//tyto posuny jsou pouze kvuli prohlizeni modelu jako celku
Posun_perspektivy=0;               //osa z
Posun_ALT=h_mot17 + t_AZ*1.5;                      //osa z
Posun_perspektivy_motor=50;
Posun_AZkol=20;

//Posuny jednotlivych casti kvuli podminkam otaceni, velikosti,...
Posun_AZmot= sqrt(a_ALT^2 + b_ALT^2);  //polomer nutny pro otoceni ALT casti
Posun_drzakLaser= Posun_ALT /*+ Uhlopricka_drzakLaser/2 + t_ALT/2 + tol_h_drzakLaser*/ + Uhlopricka_drzakLaser/2 + tol_otocLaser;
Posun_a_mot_laser=0;
Posun_podLaser=5;
PosunALT_Vkolo=10;
posun_matkaLaser=1.5;
Posun_nohou=A+D/6+Prodlouzeni_AZ;
Posun_uchytM3 = M3_screw_diameter*1.2 + t_podLaser/2;   //uchyceni sroubu (drzak laseru) oproti podlozce

U_a_pod17=a_ALTpod17/2 - tol_a_pod17/3;     //Vzdalenost nohou podlozky Laseru ve smeru a
U_b_pod17=b_ALTpod17/2 - tol_b_pod17/3;     //Vzdalenost nohou podlozky Laseru ve smeru b

a_AZkol=Posun_AZmot/2+a_mot17/2 +10;        //vzdalenost osy AZ a stredu motoru AZ

D_ulozAZ_Loz=D_Loz*3;
h_ulozLoz=h_Loz*2;

h_kuzelLaser=h_tyc17-h_pod17-tol_h_tyc17;
}

//HLOUBKY LOZISEK
{
Hloubka_loziskaAZ= t_AZ/2 + h_Loz/2 ;               //AZ osa, AZ cast
Hloubka_loziskaALT_Laser= t_ALT/2 + h_Loz/2 + 0.1;  //ALT osa, ALT cast
}

//sroubek_M3
module sroubek_M3(delka = 10){
    translate([0, 0, -M3_screw_head_height])
    cylinder(d = M3_screw_head_diameter, h = M3_screw_head_height);         //hlava sroubu
    cylinder(d = M3_screw_diameter, h = delka);     //telo sroubu
}

//sroubek_M5
module sroubek_M5(delka = 20){
    translate([0, 0, -M5_head_height])
        cylinder(d = M5_head_diameter, h = M5_head_height);    //hlava sroubu
        cylinder(d = M5_screw_diameter, h = delka);     //telo sroubu
}

//MATKA_M3
module matka_M3(){
    difference() {
    cylinder(d=M3_nut_diameter, h=M3_nut_height, $fn=6, center=true);   //matka
    cylinder(d=M3_screw_diameter, h=M3_nut_height+0.2, center=true);    //otvor
    }
}

//MATKA_M5
module matka_M5(){
    difference() {
    cylinder(d=M5_nut_diameter, h=M3_nut_height, $fn=6, center=true);   //matka
    cylinder(d=M5_screw_diameter, h=M5_nut_height+0.2, center=true);    //otvor
    }
}

// Osy M5
module M5_osa() {
    cylinder(d=M5_screw_diameter, h=100, center=true);
}


//NOHY VNEJSI
module Vnohy() {    //vnejsi cast nozicek u AZ casti (pro tisk spojeno s AZ casti)
    color("OrangeRed")
    for(rot=[1:3])
            rotate([rot*120,90,0])
                translate([h_Vnohy/2+t_AZ/2,0,Posun_nohou])
                    rotate([0,90,0])
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

//NOHY VNITRNI
module Mnohy() {
    color("Orange")
    for(rot=[1:3])
            rotate([rot*120,90,0])
                translate([h_Vnohy/2+t_AZ/2,0,Posun_nohou])
                    rotate([0,90,0]) {
                        cylinder(d=d_Mnohy,h=h_Mnohy, center=true);
                        translate([0,0,h_Mnohy/2+h_podMnohy/2])
                            cylinder(d=d_podMnohy,h=h_podMnohy, center=true);
                    }
}

//////////////////////////////////////////////

//AZ cast
module AZ_cast() {
    hull() {
        for(rot=[1:3])
            rotate([rot*120,90,0])
                translate([0,0,A])
                    rotate([0,90,0])
                        cylinder(d=D,h=t_AZ, center=true);
        }
}

module AZ() {
   difference() {
        union() {
            difference() {
            scale([2,2,1])
            color("LightBlue") {
                    translate([0,0,t_AZ])
                        AZ_cast();
                    translate([0,0,-t_AZ])
                        AZ_cast();
                    }
   }

//PRODLOUZENE CASTI
     union() {
            for(rot=[1:3])
                rotate([rot*120,90,180])
                    translate([0,0,-2.5*D/3])   //posun tri dilu do stredu
                        rotate([0,90,0]) {
                           hull() {
                            rotate([0,180,0])   //vzajemne otoceni trojuhelniku...
                                translate([0,0,0])
                                    scale([1.2*(1/3),1.2,1])
                                        AZ_cast();
                            translate([Prodlouzeni_AZ,0,0])
                                    scale([1,1.2,1])
                                   AZ_cast();
                                  }
                        }
//NOZICKY

                Vnohy();
                        }
                translate([0,0,-h_Vnohy*(1/2)])
                    Mnohy();
                       }

union() {
//OTVORY SROUBY A MATKY (M5)
        for(rot_i=[1:3])
            for(rot_j=[1:2])
                rotate([rot_i*120+(rot_j*30+15)+60,270,0])
                    translate([t_AZ,0,-D*2.2+0.5])
                        rotate([180,90,0]) {
                            sroubek_M5(30);
                            translate([0,0,t_AZ*2.5])
                                matka_M5();
                           }

//OTVORY SROUBY MOTOR (M3)
        for(rot_i=[1:3])
            for(rot_j=[1:2])
                rotate([rot_i*120+(rot_j*30+15)+60,270,0])
                    translate([t_AZ,0,-D*2.2])
                        rotate([180,90,0]) {
                            sroubek_M5(30);
                            translate([0,0,t_AZ*2.5])
                                matka_M3();
                           }
        translate([0,0,-t_AZ*1.25])
        for(rot=[1:4])
            rotate([rot*90+45,270,0])
                translate([0,0,a_rozvor17/2*sqrt(2)])
                    rotate([0,90,0])
                        sroubek_M3(30);
    }
}
}
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

//UCHYT AZ ALT MOTORU
module uchyt_AZ_ALTmot() {
    rotate([0,-90,0])
    difference() {
        union() {
            translate([h_mot17/2 + t_ALTpod17/2, 0, 0]){
                difference() {
//SVISLA CAST
                    hull() {
                        cube([t_ALTpod17,a_mot17,a_mot17], center=true);  //svisla cast
                        rotate([90,0,0])
                        translate([0,0,Uhlopricka_drzakLaser/2 + tol_otocLaser - h_tyc17/2-h_pod17])
//uchyt tyce
                            cylinder(d=d_AZ_ulozT17, h=h_tyc17-h_pod17-tol_h_tyc17, center=true);
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
                rotate([0,0,0])
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
//OTVORY UPEVNENI ALT OSY
        rotate([90,0,0])
        translate([0 ,0, -delka_sroubuL_drzak ])
            sroubek_M3(delka_sroubuL_drzak);
            translate([0 ,d_tyc17/2+M3_nut_height/2+tol_h_matka,0 ])
            rotate([0,90,90])
                hull() {
                    matka_M3();
                    translate([h_tyc17,0,0])
                        matka_M3();
                    }
                }
            }
        }

         for(rot=[1:2]){
            for(i=[1:2])
                rotate([180,0,rot*180])
                    translate([20*(-1)^i, 10, - t_ALT*0.25]){
                        sroubek_M3(delka=35);
                        }
            rotate([180,0,rot*180])
                    translate([20, 0, - t_ALT*0.25]){
                        sroubek_M3(delka=35);
                        }
             }

/* //REZ
           translate([0,-50,0])
               cube([100,100,100], center=true); */
    }
}

//LASER
module Laser() {
    color("LightSalmon")
    cube([a_Laser,a_Laser,h_Laser], center=true);
}


/////////////////////////////////////////////////////////////
//AZ cast
AZ();

//AZ MOTOR + KOLA
module soustavaAZ_motorKola() {
    rotate([0,0,0])
        translate([-a_AZkol,0, +h_mot17/2+t_AZ/2 + Posun_perspektivy])
                motor();
}

//AZ MOTOR + KOLA
translate([a_AZkol, 0, t_AZ + Posun_perspektivy]) {
    soustavaAZ_motorKola();
}

translate([0,0,0]) {
//ALT motor + podlozka
 translate([0, 0, 0 ]){
    rotate([90,0,0])
     translate([ - h_mot17/2 -t_ALTpod17/2, 0, 0])
        difference() {
            union() {
                rotate([0,90,0])
                    translate([0,Posun_drzakLaser,0]){
                        translate([0,0, Posun_drzak_AZmot/2 - tol_d_tyc17/2])
                        motor();
                        uchyt_AZ_ALTmot();}
            }
}
}

//LASER
translate([ a_Laser/2 + t_podLaser + h_kuzelLaser + tol_h_tyc17, 0,Posun_drzakLaser]) {
rotate([0,0,-90])
    Laser();
rotate([0,90,180])
translate([0,0,a_Laser/2+t_podLaser/2])
    pod_Laser();
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
echo("Delka spodniho AZ dilu", Prodlouzeni_AZ + 2*D);
echo("Posun ALT casti", Uhlopricka_drzakLaser - (h_tyc17 + a_mot17/4));
}

//KONTROLY
// Zkontrolovat rotaci drzaku laseru + upravit konstanty
/*translate([a_ALT/8,0,Posun_drzakLaser]) {
rotate([0,0,0])
   // drzak_Laseru();
    rotate([0,90,0])
    cylinder(d=Uhlopricka_drzakLaser, h=1);
}*/
