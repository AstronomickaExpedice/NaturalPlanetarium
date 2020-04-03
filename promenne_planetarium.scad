//PROMENNE PLANETARIUM

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
h_tyce17=24.0;           //vyska stredove tyce (podlozka+tyc), tolerance 1mm
d_tyce17=5.0;           //prumer stredove tyce, tolerance 0.012mm
d_pod17=22.0;          //prumer podlozky stredove tyce, tolerance 0.05mm
//PUDORYS
a_sirka17=42.3;           //sirka motoru; bez tolerance, hodnota udana MAX
a_rozvor17=31.0;           //rozvor der pro srouby M3, tolerance 0.1mm
d_otvor17=4;             //prumer otvoru pro srouby M3, hloubka 4.5 MIN
h_otvor17=4.5;            //MIN hloubka otvoru pro srouby M3 udana vyrobcem

//LOZISKO 625
D_Loz=16;              //vnejsi prumer loziska
d_Loz=5;               //vnitrni prumer loziska
h_Loz=5;               //vyska loziska

//LASER
a_laser=42;         //sirka laseru (xy)
h_laser=60;         //vyska laseru

//OSY M5
prumer_os=5;        //osa AZ a ALT (vruty)

//Tloustka soucastek
t_kol=5;            //tloustka ozubenych kol
t_AZ=15;            //tloustka AZ casti
t_ALT=10;            //tloustka ALT casti
t_laser=5;            //tloustka podlozky laseru
t_podlozky=3;            //tloustka podlozky AZ/ALT motoru

//AZ cast
a_AZ=d_Vkolo + a_sirka17 + 20 + 10;         //sirka (x) AZ casti
b_AZ=d_Vkolo + 20;                          //delka (y) AZ casti

//Podlozka AZ/ALT NEMA17
a_17podl=a_sirka17 + 2;           //sirka a delka (xy) podlozky+tolerance
h_17podl=M3_screw_head_height + M3_screw_lenght - h_otvor17 - t_podlozky + 5;    //prostor pod podlozkou pro ulozeni sroubu+tolerance
H_17ulozeni=h_mot17 + 2*t_podlozky + 2;     //vyska boxu podlozky na motor+tolerance

//Velke ozubene kolo
d_Vkolo=5;      //prumer velkeho kola

//Male ozubene kolo
d_Mkolo=3;      //prumer maleho kola

//ALT cast
a_ALT=d_Vkolo + H_17ulozeni + t_ALT + 10;   //sirka (x) ALT casti
b_ALT=d_Vkolo + 10;                         //delka (y) ALT casti
h_ALT=d_Vkolo + 10;                         //vyska (z) ALT casti

//Drzak laseru
a_drzakLaser=a_laser + 20;        //sirka drzaku laseru + uchyt sroubu
h_drzakLaser=h_laser + 20;        //vyska drzaku laseru + uchyt sroubu

//Podlozka pod laser
a_drzakLaser=a_laser + 10;        //sirka drzaku laseru + uchyt sroubu
h_drzakLaser=h_laser + 10;        //vyska drzaku laseru + uchyt sroubu






