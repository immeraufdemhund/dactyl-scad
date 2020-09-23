stemDiameter = 5.54;
stemHeight = 3.6;
wallThickness = 2;
clearance = 0.5;

$fn=100;

difference(){
    cylinder(r=stemDiameter+clearance+wallThickness, h=8, center=true);
    translate([0,0,5]){
        cylinder(r=stemDiameter+clearance, h=8, center=true);
    }
}
