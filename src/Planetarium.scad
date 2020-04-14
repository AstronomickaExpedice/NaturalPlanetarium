include<promenne_planetarium.scad>
include<sroubky_matky.scad>
include<AZ.scad>
include<uchyt_motoru.scad>
include<uchyt_laser.scad>
include<motor_laser.scad>

echo(z_promennych);

//PLANETARIUM
$fn=100;

//AZ cast
{
AZ();
}

//AZ MOTOR
{
translate([0,0, +h_mot17/2+t_AZ*1.5])
    motor();
}

//UCHYT AZ ALT motoru 
{
rotate([90,0,0])
translate([ -h_mot17/2 - t_ALTpod17/2, 0, 0])
    union() {
        rotate([0,90,0])
        translate([0,Posun_drzakLaser,0]) {
            translate([0,0, Posun_drzak_AZmot/2 - tol_d_tyc17/2])
                motor();
            rotate([0,180,0])
            uchyt_AZ_ALTmot();
            }
        }
}

//LASER
{
translate([ a_Laser/2 + t_podLaser + h_kuzelLaser + tol_h_tyc17, 0,Posun_drzakLaser]) {
    rotate([0,0,-90])
        Laser();
    rotate([0,90,180])
    translate([0,0,a_Laser/2+t_podLaser/2])
        pod_Laser();
    }
}


//ECHO
{
echo("Delka spodniho AZ dilu", Prodlouzeni_AZ + 2*D);
echo("Posun ALT casti", Uhlopricka_drzakLaser - (h_tyc17 + a_mot17/4));
}

//KONTROLY
{
// Zkontrolovat rotaci drzaku laseru + upravit konstanty
/*translate([a_ALT/8,0,Posun_drzakLaser]) {
   // drzak_Laseru();
    rotate([0,90,0])
    cylinder(d=Uhlopricka_drzakLaser, h=1);
}*/
}
