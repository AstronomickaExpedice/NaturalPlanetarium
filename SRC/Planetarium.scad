//PLANETARIUM
$fn=100;

/* pred tiskem celeho modelu
1) vytisknout AZ nohu (pomery vnitrni vnejsi noha; ulozeni sroubu)
2} zkontrolovat tolerance(prumery os, ulozeni lozisek,...)
3) zkontrola ulozeni sroubu u obalky motoru
4) ulozeni motoru - otvory na draty
5) upravit delky sroubu, nastaveni matek,...
*/


//TOLERANCE
{
tol_sten=0.5;           //tolerance sten pri ulozeni motoru a laseru
tol_nohy=1;             //tolerance sten pri ulozeni nohou 
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
delka_sroubu=10;           
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
d_Vnohy=20;                     //prumer vnejsich nohou
    
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
prumer_os=5;        //osa AZ a ALT (vruty)

mezera_ALTosy=5+h_Loz*2;        //toutou konstantou dochazi k posunu soucastek upevnenych na ALT ose
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
A=70;               //vzdalenost od stredu kruhu tvoricich AZ cast
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
Posun_ALT=30;                       //osa z
Posun_perspektivy_motor=50;
Posun_AZkol=0;

//Posuny jednotlivych casti kvuli podminkam otaceni, velikosti,...
Posun_AZmot= sqrt(a_ALT^2 + b_ALT^2);  //polomer nutny pro otoceni ALT casti
Posun_drzakLaser= Posun_ALT + Uhlopricka_drzakLaser/2 + t_ALT/2 + 5;
Posun_podLaser=5;
PosunALT_Vkolo=5;

a_AZkol=Posun_AZmot/2+a_mot17/2 +10;        //vzdalenost osy AZ a stredu motoru AZ
}

//HLOUBKY LOZISEK
{
Hloubka_loziskaAZ= t_AZ/2 + h_Loz/2 ;               //AZ osa, AZ cast
Hloubka_loziskaALT= t_ALT/2 + h_Loz/2 + 0.1;        //AZ osa, ALT cast
Hloubka_loziskaALT_Laser= t_ALT/2 + h_Loz/2 + 0.1;  //ALT osa, ALT cast
Hloubka_loziskaLaser= t_ALT/2 + h_Loz/2 + 0.1;      //ALT osa, drzak laseru
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








//NOHY VNEJSI
module Vnohy() {    //vnejsi cast nozicek u AZ casti (pro tisk spojeno s AZ casti)
    color("OrangeRed")
    for(rot=[1:3])
            rotate([rot*120,90,0])
                translate([h_Vnohy/2+t_AZ/2,0,A])
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
                                     cylinder(d=M3_screw_diameter,h=delka_sroubu, center=true);            //telo sroubu
                                     translate([0,0,delka_sroubu/2])
                                        cylinder(d=M3_screw_head_diameter,h=M3_screw_head_height);        //hlavy sroubu
                                 
                             } 
                        }
   
}

//NOHY VNITRNI
module Mnohy() {
    color("Orange")
    for(rot=[1:3])
            rotate([rot*120,90,0])
                translate([h_Vnohy/2+t_AZ/2,0,A])
                    rotate([0,90,0]) {
                        difference() {
                        cylinder(d=d_Mnohy,h=h_Mnohy, center=true);
                        cylinder(d=d_Mnohy-5,h=h_Mnohy+0.2, center=true);   
                        }
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
    
//AZ
module AZ() {
 // difference() {          //REZ AZ NOHAMI
    union() {
    translate([Teziste + a_AZkol/6,0,0]) {      //priblizny posun do centra podlozky i s uvahou teziste soustavy
/*  translate([a_AZkol/6,0,0])    //posun do teziste cele soustavy pri pomeru hmotnosti 1:2 */
    AZ_podlozka();
    
    //nozicky
       
        Vnohy();
        translate([0,0,-h_Vnohy*(1/2)])
        Mnohy();
 
    }

    color("Red")
    cylinder(d=prumer_os, h=Posun_ALT*2 + 30, center=true);
    color("Grey")
    translate([a_AZkol, 0, 0]) 
        cylinder(d=d_tyc17*2, h=t_AZ*1.1, center=true);
}
/*translate([A+D/2,25,0])
rotate([0,0,0])
cube([50,50,100], center=true);
}*/
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


//MOTOR_ULOZENI
module ulozeni_motoru() {
    difference() {
        union() {
            cube([a_mot17+t_ulozLaser*2,a_mot17+t_ulozLaser*2,h_mot17+t_ulozLaser], center=true);
        translate([0,0,h_mot17/2+t_ulozLaser/2-h_otvor_sroub/2])
        for(rot=[1:4])
            rotate([rot*90+45,90,0])
                translate([0,0, a_mot17/2 * sqrt(2) + t_ulozLaser*1.5])
                    rotate([0,90,0])
                        cylinder(d=M3_screw_diameter*3,h=h_otvor_sroub, center=true);
        translate([0,0,-h_mot17/2-t_ulozLaser/2])
        for(rot=[1:4])
            rotate([rot*90+45,90,0])
                translate([0,0, a_mot17/2 * sqrt(2) + t_ulozLaser*0])
                    rotate([0,90,0])
                        cylinder(d=5,h=30, center=true);
        }
        
        translate([0,0,t_ulozLaser+0.1])
            cube([a_mot17+tol_sten,a_mot17+tol_sten,h_mot17+t_ulozLaser*2], center=true);
        
        translate([0,0,h_mot17/2+t_ulozLaser/2-h_otvor_sroub/2])
        for(rot=[1:4])
            rotate([rot*90+45,90,0])
                translate([0,0, a_mot17/2 * sqrt(2) + t_ulozLaser*1.5])
                    rotate([0,90,0])
                        cylinder(d=M3_screw_diameter,h=h_otvor_sroub*3+0.2, center=true);
        //odecteni podlozky a tyce
        #rotate([0,180,0])
        translate([0,0, h_mot17/2-h_pod17/2]) {                  
            cylinder(d=d_tyc17, h=h_tyc17);         //tyc motoru
            cylinder(d=d_pod17, h=h_pod17*2);         //podlozka u tyce
        }
    }
}


//MOTOR_VICKO
module ulozeni_motoru_vicko() {
    color("Coral")
    difference() {
        union() {
            cube([a_mot17+t_ulozLaser*2,a_mot17+t_ulozLaser*2,t_ulozLaser], center=true);
        translate([0,0,0])
        for(rot=[1:4])
            rotate([rot*90+45,90,0])
                translate([0,0, a_mot17/2 * sqrt(2) + t_ulozLaser*1.5])
                    rotate([0,90,0])
                        cylinder(d=M3_screw_diameter*3,h=t_ulozLaser, center=true);
        }
        //odecteni der 
        translate([0,0,0])
        for(rot=[1:4])
            rotate([rot*90+45,90,0])
                translate([0,0, a_mot17/2 * sqrt(2) + t_ulozLaser*1.5])
                    rotate([0,90,0])
                        cylinder(d=M3_screw_diameter,h=h_otvor_sroub*2+0.2, center=true);
        
        for(rot=[1:4])
            rotate([rot*90+45,90,0])
                translate([0,0, a_rozvor17/2 * sqrt(2)])
                    rotate([0,90,0])
                        cylinder(d=d_otvor17,h=h_otvor17*3, center=true);
    }
}


//TEST
/*hull() {
translate([400,0,0]) {
    rotate([0,180,0])
    translate([0,0, h_mot17/2-h_pod17/2]) {                  
            cylinder(d=d_tyc17, h=h_tyc17);         //tyc motoru
            cylinder(d=d_pod17, h=h_pod17*2);         //podlozka u tyce
    }
    translate([0,0,-H_mot17/2])
        scale([1.5,1.5,1.5])
            Mkolo();
}
}
*/
/*
//TEST
translate([200,0,0]) {
    ulozeni_motoru();
  //  translate([0,0,t_ulozLaser/2+0.1])
  //  motor();
    color("red")
    translate([0,0,h_mot17/2+t_ulozLaser*1.5+0.2])
        for(rot=[1:4])
            rotate([rot*90+45,90,0])
                translate([0,0, a_mot17/2 * sqrt(2) + t_ulozLaser*1.5])
                    rotate([0,90,0]) {
                        sroubek(16);
                        translate([0,0,16-M3_nut_height-1])
                        matka();
                    }
    translate([0,0,h_mot17/2+t_ulozLaser+0.1])
        ulozeni_motoru_vicko();
}
*/

//LOZISKO
module lozisko() {
    color("LightGreen")
    cylinder(d=D_Loz,h=h_Loz, center=true);
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


//ALT
module ALT() {
    color("DeepSkyBlue")                    
    cube([a_ALT,b_ALT,t_ALT], center=true);     //vodorvna cast
    color("DeepSkyBlue")                    
    translate([a_ALT/4, -b_ALT/2+t_ALT/2, h_ALT/2 + t_ALT/2])
        rotate([0,0,90]) {
            difference() {
                cube([t_ALT,a_ALT/2,h_ALT], center=true);       //svisla cast
                rotate([0,90,0])
                    translate([h_ALT/2 - Posun_drzakLaser/2,0,0])
                    difference() {                            //uprava zaoblene casti
                        cylinder(d=a_ALT/2+50,h=t_ALT+0.2, center=true);
                        cylinder(d=a_ALT/2,h=t_ALT+0.2, center=true);
                        rotate([0,90,0])
                            translate([0,0,h_ALT/2])
                                cube([t_ALT,a_ALT/2,h_ALT], center=true);
            }
        }
        }
}


//LASER DRZAK
module drzak_Laseru() {
    color("SlateBlue")
    cube([a_Laser,t_podLaser,h_Laser], center=true);
}


//LASER
module Laser() {
    color("LightSalmon")
    cube([a_Laser,a_Laser,h_Laser], center=true);
}








//AZ
AZ();
translate([0,0,0]) {
    translate([0,0, Hloubka_loziskaAZ])
        lozisko();
    rotate([180,0,0])
        translate([0,0, Hloubka_loziskaAZ])
            lozisko();
}

//AZ MOTOR + KOLA
module soustavaAZ_motorKola() {

    rotate([0,180,0])
        union() {
            translate([0,0, -H_mot17/2])
                motor();
            translate([0,0,Posun_AZkol])
                Mkolo();   
        }
        translate([0,0,H_mot17/2-tol_sten-0.1])
        ulozeni_motoru();
    
translate([-a_AZkol,0, -Posun_AZkol])
    Vkolo();
}

//AZ MOTOR + KOLA
translate([a_AZkol, 0, t_AZ + Posun_perspektivy]) {
    soustavaAZ_motorKola();
}



//ALT
translate([0,0, Posun_ALT]) {
ALT();
//Loziska AZ/ALT
translate([0,0,0]) {
    translate([0,0, Hloubka_loziskaALT])
        lozisko();
    rotate([180,0,0])
        translate([0,0, Hloubka_loziskaALT])
            lozisko();
    } 
}

//Loziska ALT/Laser
translate([a_ALT/4, -b_ALT/2+t_ALT/2, Posun_drzakLaser])
        rotate([90,0,0]) {
            translate([0,0, Hloubka_loziskaALT])
                lozisko();
            rotate([180,0,0])
                translate([0,0, Hloubka_loziskaALT])
                    lozisko();
       }   


//ALT motor
translate([-a_ALT/2 + a_mot17/2 ,0, Posun_ALT + a_mot17/2 + t_ALT/2])
    rotate([90,90,0])
        union() {
            motor();

            translate([0,0, b_ALT/2 + PosunALT_Vkolo])
                Mkolo();            
        }
        
//ALT VELKE KOLO
rotate([90,0,0])
    translate([a_ALT/4, Posun_drzakLaser , b_ALT/2 + PosunALT_Vkolo + mezera_ALTosy/2]) {
        Vkolo(); 
        color("Red")            //ALT osa
        translate([0, 0, -mezera_ALTosy*1.5])
            cylinder(d=prumer_os, h= 55, center=true); 
    } 





//LASER
translate([a_ALT/4, -b_ALT/2 + t_ALT + mezera_ALTosy + t_podLaser/2,Posun_drzakLaser]) {
drzak_Laseru();
//Loziska drzakLaser
translate([0, 0, 0])
        rotate([90,0,0]) {
            translate([0,0, Hloubka_loziskaALT])
                lozisko();
            rotate([180,0,0])
                translate([0,0, Hloubka_loziskaALT])
                    lozisko();
       }   


translate([0,a_Laser/2 + t_podLaser/2 + mezera_ALTosy/2 ,0])
Laser();
}






//REZY
/*translate([300,0,0])

difference() {
    
    //AZ motor
    union() {
    rotate([0,180,0])
        union() {
            translate([0,0, -H_mot17/2])
                motor();
        }
        
        translate([0,0,H_mot17/2-tol_sten-0.1])
        ulozeni_motoru();
        
    }
    translate([(a_mot17+t_ulozLaser*2)/2,(a_mot17+t_ulozLaser*2)/2,0])
        cube([a_mot17+t_ulozLaser*2,a_mot17+t_ulozLaser*2,1000], center=true);

}



//VYPOCTY
h_ALTosa=t_kolo + t_ALT + t_podLaser + mezera_ALTosy*3;


*/

//KONTROLY
/*color("Pink")
translate([0,0,Posun_ALT])
cylinder(d=Posun_AZmot,h=1);*/

echo("Musi byt kladne. Otaceni laseru kvuli AZmot =",Posun_AZmot/2 - (a_ALT/4+Uhlopricka_drzakLaser/2));    //pokud bude zaporne, nutno preparametrizovat vzdalenost AZ motoru od ALT casti

echo("Musi byt kladne, MIN = 5. Tloustka AZ casti v mezere AZ osy =", t_AZ-2*h_Loz);
echo("Musi byt kladne, MIN = 5. Tloustka ALT casti v mezere AZ/ALT osy =", t_ALT-2*h_Loz);
echo("Musi byt kladne, MIN = 5. Tloustka drzaku Laseruv mezere ALT osy =", t_podLaser-2*h_Loz);
echo(Posun_AZmot/2 -(a_ALT/4+h_Laser/2));
echo(sqrt(3));

// Zkontrolovat rotaci drzaku laseru + upravit konstanty
/*translate([a_ALT/4,0,Posun_drzakLaser]) {
rotate([0,45,0])
    drzak_Laseru();
    rotate([90,0,0])
    cylinder(d=73, h=1);
}
*/


