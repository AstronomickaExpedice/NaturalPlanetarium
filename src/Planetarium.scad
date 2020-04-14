//include<promenne_planetarium.scad>
//echo(z_promennych);

//PLANETARIUM
$fn=100;

//DELKY SROUBU
{
delka_sroubu_Vnohy=10;
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
tol_nohy=1;             //tolerance sten pri ulozeni nohou

tol_h_drzakLaser=10;
tol_otocLaser=5;
    
tol_b_pod17=15;
tol_a_pod17=15;

tol_d_tyc17=1;
tol_h_tyc17=1;

tol_h_matka=1;
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

//LASER
{
a_Laser=30;         //sirka Laseru (xy)
h_Laser=60;         //vyska Laseru
Uhlopricka_drzakLaser= sqrt(a_Laser^2 + h_Laser^2);
}

//TLOUSTKA soucastek
{

t_AZ=5;            //tloustka AZ casti
t_podLaser=5;            //tloustka podlozky Laseru
t_Vnohy=5;                 //tloustka nohou (rovina prumeru)
}



//AZ cast
{

h_Vnohy=20;                      //vyska vnejsich nohou
d_Vnohy=11;                     //prumer vnejsich nohou

h_Mnohy=h_Vnohy-tol_nohy*2;     //vyska vnitrnich nohou
d_Mnohy=d_Vnohy-t_Vnohy-tol_nohy; //prumer vnitrnich nohou

d_podMnohy=d_Vnohy+10;      //vyska podlozky vnitrnich nohou
h_podMnohy=3;               //prumer podlozky vnitrnich nohou
}





//UCHYT AZ ALT motoru
{
d_ALT_ulozT17=d_tyc17*2;
d_AZ_ulozT17=d_tyc17*2;
Posun_drzak_AZmot=(d_AZ_ulozT17-d_tyc17);

a_ALTpod17 = h_mot17 + tol_b_pod17;
b_ALTpod17 = a_mot17 + tol_b_pod17;
t_ALTpod17 = d_tyc17 + Posun_drzak_AZmot;
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
Prodlouzeni_AZ=5*D;             //vzdalenost od stredu trojuhelniku tvoricich spodni dily
}

//POSUNY
{
//tyto posuny jsou pouze kvuli prohlizeni modelu jako celku
Posun=h_mot17 + t_AZ*1.5;          //osa z

//Posuny jednotlivych casti kvuli podminkam otaceni, velikosti,...
Posun_drzakLaser= Posun + Uhlopricka_drzakLaser/2 + tol_otocLaser;
Posun_nohou=A+D/6+Prodlouzeni_AZ;

h_kuzelLaser=h_tyc17-h_pod17-tol_h_tyc17;
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

//LASER
module Laser() {
    color("LightSalmon")
    cube([a_Laser,a_Laser,h_Laser], center=true);
}


/////////////////////////////////////////////////////////////
//AZ cast
AZ();

//AZ MOTOR
translate([0,0, +h_mot17/2+t_AZ*1.5])
                motor();


//UCHYT AZ ALT motoru 
rotate([90,0,0])
translate([ -h_mot17/2 - t_ALTpod17/2, 0, 0])
    union() {
        rotate([0,90,0])
        translate([0,Posun_drzakLaser,0]) {
            translate([0,0, Posun_drzak_AZmot/2 - tol_d_tyc17/2])
                motor();
            uchyt_AZ_ALTmot();
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


{
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
