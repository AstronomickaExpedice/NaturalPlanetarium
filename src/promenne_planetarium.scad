//PROMENNE PLANETARIUM


//DELKY SROUBU
{
delka_sroubu_Vnohy=10;
delka_sroubuL_drzak=20;
delka_sroubu_AZosa=20;
}

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
}

//MOTOR NEMA 17
{
//BOKORYS
h_mot17=45;             //vyska hlavni casti motoru (muze byt v hodnotach 34-48mm nebo 60mm)
h_tyc17=24.0;           //vyska stredove tyc (podlozka+tyc)
d_tyc17=5.0+0.5;           //prumer stredove tyc
d_pod17=22.0+0.5;          //prumer podlozky stredove tyc
h_pod17=2;                 //vyska podlozky stredove tyc
H_mot17=h_mot17+h_tyc17;    //celkova vyska motoru
//PUDORYS
a_mot17=42.3;           //sirka motoru; bez tolerance, hodnota udana MAX
a_rozvor17=31.0;           //rozvor der pro srouby M3, tolerance 0.1mm
d_otvor17=M3_screw_diameter;             //prumer otvoru pro srouby M3, hloubka 4.5 MIN
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
A=a_mot17*0.4;               //vzdalenost od stredu kruhu tvoricich AZ cast
D=A;                //prumer kruhu tvoricich AZ cast
Prodlouzeni_AZ=5*D;             //vzdalenost od stredu trojuhelniku tvoricich spodni dily    
    
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

//POSUNY
{

Posun_uchyt=h_mot17 + t_AZ*1.5;          //osa z
Posun_drzakLaser= Posun_uchyt + Uhlopricka_drzakLaser/2 + tol_otocLaser;
Posun_nohou=A+D/6+Prodlouzeni_AZ;

h_kuzelLaser=h_tyc17-h_pod17-tol_h_tyc17;
}