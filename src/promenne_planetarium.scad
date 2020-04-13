//PROMENNE PLANETARIUM

z_promennych = "Tohle je text ze souboru s parametry";


//DELKY SROUBU
{
delka_sroubuLoz=16;
delka_sroubu_Vnohy=10;
delka_sroubu_podLaser=10;
delka_sroubu=10;
delka_sroubuL_drzak=20;
delka_sroubu_AZosa=20;
}


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
