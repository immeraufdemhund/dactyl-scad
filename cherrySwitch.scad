module Switch() {
  translate ([0.000, 8.200, 2.000])
    cube (size = [ 18.400, 2.000, 4.000], center = true);
}
module Nub() {
  hull () {
    translate ([8.200, 0.000, 2.000]) cube (size = [ 2.000, 2.750, 4.000], center = true);
    translate ([7.200, 0.000, 1.000]) {
      rotate (a = 90.000, v = [1.000, 0.000, 0.000]) {
        cylinder(h = 2.750, r1 = 1.000, r2 = 1.000, center = true, $fn = 30.000);
      }
    }
  }
}
module CherrySwitch(){
  union () {
    for (angle=[0:90:270]) rotate(a = angle, v=[0,0,1]) Switch();
    Nub();
    rotate (a = 180.000, v = [0.000, 0.000, 1.000]) Nub();
  }
}
