//PLANETARIUM
$fn=100;

/* DALSI UPRAVY
    OTVORY OS
    OZUBENA KOLA
    PODLOZKA MOTOR AZ/ALT
    PODLOZKA LASER
    ULOZENI LOZISEK - DO JEDNOHO module
    DIRY V PODLOZCE
    ALT - BOCNICE + ZEBRO
    ZKONTROLOVAT PARAMETRY

*/

//DELKY SROUBU
{
delka_sroubuLoz=16;
delka_sroubu_Vnohy=10;
delka_sroubu_podLaser=10;
delka_sroubu=10;  
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
}


//HODNOTY   
{
    
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

h_mot17=60;             //vyska hlavni casti motoru (muze byt v hodnotach 34-48mm nebo 60mm)
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
a_Laser=42;         //sirka Laseru (xy)
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
a_ALT=(4/3)*(Uhlopricka_drzakLaser/2 + 10 + a_mot17);   //sirka (x) ALT casti
b_ALT=h_mot17;   //delka (y) ALT casti
h_ALT=Uhlopricka_drzakLaser+10;                         //vyska (z) ALT casti
}

//OSY M5
{
M5_screw_lenght=20;           //delka sroubu
M5_screw_diameter=5.5;        //prumer sroubu (zavit)
M5_nut_height=4 + 0.5;            //vyska matky
M5_nut_diameter=9.4;          //prumer matky (kruznice opsana)
M5_head_height=5;               //vyska hlavy sroubu
M5_nut_pocket=8.4;
M5_head_diameter=13 + 0.5;  //prumer hlavy sroubu
}
}
/*
//Drzak Laseru
a_drzakLaser=a_Laser + 20;        //sirka drzaku Laseru + uchyt sroubu
h_drzakLaser=h_Laser + 20;        //vyska drzaku Laseru + uchyt sroubu

//Podlozka pod Laser
a_podLaser=a_Laser + 10;        //sirka drzaku Laseru + uchyt sroubu
h_podLaser=h_Laser + 10;        //vyska drzaku Laseru + uchyt sroubu
*/



//AZ cast hodnoty
{
//cela AZ podlozka navrzena funkci hull    
A=25;               //vzdalenost od stredu kruhu tvoricich AZ cast
D=A;                //prumer kruhu tvoricich AZ cast
/*V=A*1.5;
B=D+V;
E=A/2+D/2;       //posun na rovnou hranu
F=A+D/2 ;        //posun k zaoblene casti   */
Teziste=D/6;       //posun ze stredu do teziste trojuhelniku
}
//POSUNY
{
//tyto posuny jsou pouze kvuli prohlizeni modelu jako celku
Posun_perspektivy=0;               //osa z 
Posun_ALT=50;                       //osa z
Posun_perspektivy_motor=50;
Posun_AZkol=20;

//Posuny jednotlivych casti kvuli podminkam otaceni, velikosti,...
Posun_AZmot= sqrt(a_ALT^2 + b_ALT^2);  //polomer nutny pro otoceni ALT casti
Posun_drzakLaser= Posun_ALT + Uhlopricka_drzakLaser/2 + t_ALT/2 + 5;
Posun_podLaser=5;
PosunALT_Vkolo=10;
posun_matkaLaser=1.5;

a_AZkol=Posun_AZmot/2+a_mot17/2 +10;        //vzdalenost osy AZ a stredu motoru AZ
    
D_ulozAZ_Loz=D_Loz*3;
h_ulozLoz=h_Loz*2;
mezera_ALTosy=h_Loz*2.5;        //toutou konstantou dochazi k posunu soucastek upevnenych na ALT ose
}

//HLOUBKY LOZISEK
{
Hloubka_loziskaAZ= t_AZ/2 + h_Loz/2 ;               //AZ osa, AZ cast
//Hloubka_loziskaALT= t_ALT/2 + h_Loz/2 + 0.1;        //AZ osa, ALT cast
Hloubka_loziskaALT_Laser= t_ALT/2 + h_Loz/2 + 0.1;  //ALT osa, ALT cast
//Hloubka_loziskaLaser= t_ALT/2 + h_Loz/2 + 0.1;      //ALT osa, drzak laseru
}



//SROUBEK
module sroubek(delka = 10){
   
    translate([0, 0, -3]) 
    cylinder(d=5.5, h = 3, $fn=20);         //hlava sroubu
    cylinder(h = delka, d = 3, $fn=20);     //telo sroubu
    
}


//MATKA
module matka(){
    difference() {
    cylinder(d=M3_nut_diameter, h=M3_nut_height, $fn=6, center=true);   //matka
    cylinder(d=M3_screw_diameter, h=M3_nut_height+0.2, center=true);    //otvor
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
                translate([h_Vnohy/2+t_AZ/2,0,A+D/6])
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
                                 #union() {              //SROUB, MATKA, ULOZENI MATKY
                                     
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
                translate([h_Vnohy/2+t_AZ/2,0,A+D/6])
                    rotate([0,90,0]) {
                        cylinder(d=d_Mnohy,h=h_Mnohy, center=true);
                        translate([0,0,h_Mnohy/2+h_podMnohy/2])
                            cylinder(d=d_podMnohy,h=h_podMnohy, center=true);
                    }
}

//AZ podlozka
module AZ_podlozka() {
    hull() {
        for(rot=[1:3])
            rotate([rot*120,90,0])
                translate([0,0,A])
                    rotate([0,90,0])
                        cylinder(d=D,h=t_AZ, center=true);
        }
}
    
//AZ podlozka
module AZ() {
    difference() {          //REZ AZ NOHAMI
        union() {
  /*          translate([Teziste + a_AZkol/6,0,0]) {      //priblizny posun do centra podlozky i s uvahou teziste soustavy
                translate([a_AZkol/6,0,0]) {   //posun do teziste cele soustavy pri pomeru hmotnosti 1:2 
  */                
            translate([0,0,50])
            scale([1.5,1.5,1])
            color("LightBlue")
            AZ_podlozka();
                    translate([0,0,0])
                    for(rot=[1:3])
                        rotate([rot*120,90,180])    
                            translate([0,0,-2.5*D/3])   //posun tri dilu do stredu
                                rotate([0,90,0]) {
                                   hull() {
                                    rotate([0,180,0])   //vzajemne otoceni trojuhelniku...
                                        translate([0,0,0])
                                            scale([1.2*(1/3),1.2,1])
                                                AZ_podlozka();
                                    translate([Posun_AZmot/2+a_mot17/2,0,0])
                                            scale([1*(14/25),1.2,1])
                                         AZ_podlozka();
                                   }
                                }
/*    //nozicky
       
                    Vnohy();
                    translate([0,0,-h_Vnohy*(1/2)])
                        Mnohy();*/
  /*                  } 
                }*/

    
            }
    color("Red")
        cylinder(d=M5_screw_diameter, h=Posun_ALT*2 + 30, center=true);
    color("Grey")
    translate([a_AZkol, 0, 0]) 
        cylinder(d=d_tyc17*2, h=t_AZ*1.1, center=true);



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
    translate([0,0,-h_mot17/2+h_otvor17/2-0.1])
        for(rot=[1:4])
            rotate([rot*90+45,90,0])
                translate([0,0,a_rozvor17/2*sqrt(2)])
                    rotate([0,90,0])
                        cylinder(d=d_otvor17,h=h_otvor17, center=true);
}

//LOZISKO
module lozisko() {
    color("LightGreen")
    cylinder(d=D_Loz,h=h_Loz, center=true);
}  
        
//Ulozeni loziska
module ulozeni_loziskaAZ_sroub() {
    color("OrangeRed")
    difference() {
        
        cylinder(d1=D_ulozAZ_Loz,d2=D_Loz,h=h_ulozLoz, center=true);
            scale([1.1,1.1,1])
                translate([0,0,-h_Loz/2+0.45])
                    lozisko();
        for(rot=[1:3])
            rotate([rot*120,90,0])
                translate([D_Loz/3.5,0,D_Loz*(4/5)])
                    rotate([180,90,0]){
        /*hull() {
                                 cylinder(d=M3_nut_diameter, h=M3_nut_height, $fn=6, center=true);
                                 translate([-5,0])
                                     cylinder(d=M3_nut_diameter, h=M3_nut_height, $fn=6, center=true);
                                 }*/
                         cylinder(d=M3_screw_diameter, h=delka_sroubuLoz*2, center=true);            //telo sroubu
                         translate([0,0, delka_sroubuLoz/2 + t_ALT/2 - tol_h_sroub])
                            cylinder(d=M3_screw_head_diameter, h=M3_screw_head_height*2, center=true);        //hlavy sroubu (zvetsene 2krat kvuli otvoru)
                     }              
                      
        cylinder(d=M3_screw_diameter,h=100, center=true);
    }
}

module ulozeni_loziskaAZ_matka() {
    color("OrangeRed")
    difference() {
        
    cylinder(d1=D_ulozAZ_Loz,d2=D_Loz,h=h_Loz*2, center=true);
        scale([1.1,1.1,1.1])
        translate([0,0,-h_Loz/2+0.45])
        lozisko();
        for(rot=[1:3])
            rotate([rot*120,90,0])
                translate([D_Loz/3.5,0,D_Loz*(4/5)])
                    rotate([180,90,0]){
  /*      hull() {
                                     cylinder(d=M3_nut_diameter,h=M3_nut_height,$fn=6, center=true);
                                     translate([-5,0])
                                         cylinder(d=M3_nut_diameter,h=M3_nut_height,$fn=6, center=true);
                                     }*/
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

//AZ podlozka
AZ();
translate([0,0,0]) {
/*    translate([0,0, Hloubka_loziskaAZ])
        lozisko();
    rotate([180,0,0])
        translate([0,0, Hloubka_loziskaAZ])
            lozisko();
*/    rotate([180,0,0])
        translate([0,0, Hloubka_loziskaAZ + 10])
                ulozeni_loziskaAZ_sroub();
    translate([0,0, Hloubka_loziskaAZ + 10])
            ulozeni_loziskaAZ_matka();
}

//AZ MOTOR + KOLA
module soustavaAZ_motorKola() {

    rotate([0,180,0])
        union() {
            translate([0,0, -h_mot17/2+2+0.5])
                motor();
           /* translate([0,0,Posun_AZkol])
                Mkolo();   */
        }
    /*    translate([0,0,H_mot17/2-tol_sten-0.1])
        ulozeni_motoru();
        translate([0,0,H_mot17-9.6])
        ulozeni_motoru_vicko();*/
    
/*translate([-a_AZkol,0, -Posun_AZkol])
    Vkolo();*/
}

//AZ MOTOR + KOLA
translate([a_AZkol, 0, t_AZ + Posun_perspektivy]) {
    soustavaAZ_motorKola();
   /* difference() {  //TEST remenu
        scale([1.1,1.1,1])
        hull() {
            
            translate([-a_AZkol+9,0, -Posun_AZkol])
               
                Vkolo();
            translate([0,0,-Posun_AZkol])
                Mkolo();
            
        }
        
        hull() {
            translate([-a_AZkol,0, -Posun_AZkol])
                Vkolo();
            translate([0,0,-Posun_AZkol])
                Mkolo();
        }
}*/

}
echo((7/2)*D+Posun_AZmot/2+a_mot17/2);



