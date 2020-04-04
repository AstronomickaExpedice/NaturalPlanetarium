//PLANETARIUM
$fn=50;

//SROUBY M3
M3_screw_lenght=10;           //delka sroubu
M3_screw_diameter=3.2;        //prumer sroubu (zavit)
M3_nut_height=2.7;            //vyska matky
M3_nut_diameter=6.6;          //prumer matky (kruznice opsana)
M3_screw_head_height=3;       //vyska hlavy sroubu
M3_nut_pocket=5.6;
M3_screw_head_diameter=6.6;           //prumer hlavy sroubu


//MOTOR NEMA 17
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



//LOZISKO 625
D_Loz=16;              //vnejsi prumer loziska
d_Loz=5;               //vnitrni prumer loziska
h_Loz=5;               //vyska loziska

//Laser
a_Laser=42;         //sirka Laseru (xy)
h_Laser=60;         //vyska Laseru




//Tloustka soucastek
t_kolo=5;            //tloustka ozubenych kol
t_AZ=15;            //tloustka AZ casti
t_ALT=15;            //tloustka ALT casti
t_podLaser=15;            //tloustka podlozky Laseru
t_podlozky=3;            //tloustka podlozky AZ/ALT motoru

//Velke ozubene kolo
d_Vkolo=50;      //prumer velkeho kola

//Male ozubene kolo
d_Mkolo=30;      //prumer maleho kola


//AZ cast
a_AZ=d_Vkolo + a_mot17;         //sirka (x) AZ casti
b_AZ=d_Vkolo;                   //delka (y) AZ casti

//Podlozka AZ/ALT NEMA17
a_17podl=a_mot17 + 2;           //sirka a delka (xy) podlozky+tolerance
h_17podl=M3_screw_head_height + M3_screw_lenght - h_otvor17 - t_podlozky + 5;    //prostor pod podlozkou pro ulozeni sroubu+tolerance
H_17ulozeni=h_mot17 + 2*t_podlozky + 2;     //vyska boxu podlozky na motor+tolerance


//ALT cast
a_ALT=d_Vkolo + a_mot17 + D_Loz;   //sirka (x) ALT casti
b_ALT=h_mot17;   //delka (y) ALT casti
h_ALT=h_Laser;                         //vyska (z) ALT casti


//OSY M5
prumer_os=5;        //osa AZ a ALT (vruty)

mezera_ALTosy=5;




/*
//Drzak Laseru
a_drzakLaser=a_Laser + 20;        //sirka drzaku Laseru + uchyt sroubu
h_drzakLaser=h_Laser + 20;        //vyska drzaku Laseru + uchyt sroubu

//Podlozka pod Laser
a_podLaser=a_Laser + 10;        //sirka drzaku Laseru + uchyt sroubu
h_podLaser=h_Laser + 10;        //vyska drzaku Laseru + uchyt sroubu
*/









Posun_perspektivy=0;               //osa z 
Posun_ALT=30;                       //osa z

Posun_AZmot= sqrt(a_ALT^2 + b_ALT^2);  //polomer nutny pro otoceni ALT casti
Uhlopricka_drzakLaser= sqrt(a_Laser^2 + h_Laser^2);
Posun_drzakLaser= Posun_ALT + Uhlopricka_drzakLaser/2 + t_ALT/2 + 5;
Posun_podLaser=5;
PosunALT_Vkolo=5;



Hloubka_loziskaAZ= t_AZ/2 - h_Loz/2 + 0.1;
Hloubka_loziskaALT= t_ALT/2 - h_Loz/2 + 0.1;
Hloubka_loziskaALT_Laser= t_ALT/2 - h_Loz/2 + 0.1;
Hloubka_loziskaLaser= t_ALT/2 - h_Loz/2 + 0.1;




module AZ() {    

    cylinder(r=(4/3)*a_AZ*1.5, h=t_AZ, $fn=3, center=true);
    color("Red")
    cylinder(d=prumer_os, h=Posun_ALT*2 + 30, center=true);

}

module motor() {
    color("OrangeRed") {
    cube([a_mot17,a_mot17,h_mot17], center=true);
        translate([0,0, h_mot17/2]) {
            cylinder(d=d_tyc17, h=h_tyc17);
            cylinder(d=d_pod17, h=h_pod17);
        }
    }
}

module lozisko() {
    color("LightGreen")
    cylinder(d=D_Loz,h=h_Loz, center=true);
}  

module Vkolo() {
    color("LightBlue")
    cylinder(d=d_Vkolo,h=t_kolo, center=true);
}

module Mkolo() {
    color("LightBlue")
    cylinder(d=d_Mkolo,h=t_kolo, center=true);
}


module ALT() {
    cube([a_ALT,b_ALT,t_ALT], center=true);
    translate([a_ALT/4, -b_ALT/2+t_ALT/2, h_ALT/2 + t_ALT/2])
        rotate([0,0,90])
        color("Salmon")
        cube([t_ALT,a_ALT/2,h_ALT], center=true); 
    
}

module drzak_Laseru() {
    color("SlateBlue")
    cube([a_Laser,t_podLaser,h_Laser], center=true);
}

module Laser() {
    color("Grey")
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

//AZ motor
translate([Posun_AZmot/2+a_mot17/2 +10, 0, t_AZ + Posun_perspektivy])
    rotate([0,180,0])
        union() {
            translate([0,0, -H_mot17/2 - t_AZ/3])
                motor();
            translate([0,0,0])
                Mkolo();
}
translate([0,0, t_AZ + Posun_perspektivy])
    Vkolo();






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
        
//ALT Vkolo
rotate([90,0,0])
    translate([a_ALT/4, Posun_drzakLaser, b_ALT/2 + PosunALT_Vkolo]) {
        Vkolo(); 
        color("Red")
        translate([0, 0, -15])
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


translate([0,a_Laser/2 + t_podLaser/2 + 5,0])
Laser();
}








//VYPOCTY
h_ALTosa=t_kolo + t_ALT + t_podLaser + mezera_ALTosy*3;




//KONTROLY
color("Pink")
translate([0,0,Posun_ALT])
cylinder(d=Posun_AZmot,h=1);

echo("Musi byt kladne. Tloustka AZ casti v mezere AZ osy =", t_AZ-2*h_Loz);
echo("Musi byt kladne. Tloustka ALT casti v mezere AZ/ALT osy =", t_ALT-2*h_Loz);
echo("Musi byt kladne. Tloustka drzaku Laseruv mezere ALT osy =", t_podLaser-2*h_Loz);
echo(Posun_AZmot/2 -(a_ALT/4+h_Laser/2));

/* Zkontrolovat rotaci drzaku laseru + upravit konstanty
translate([a_ALT/4,0,Posun_drzakLaser]) {
rotate([0,45,0])
    drzak_Laseru();
*/



