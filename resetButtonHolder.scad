module ResetButtonHolder(wallThickness){
  difference () {
    Holder();
    #Cutout();
  };
  module prism(l, w, h){
    polyhedron(
      points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
      faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
  }

  buttonBodyY = 6.35;
  metalThickness = 0.4318;
  buttonY = buttonBodyY + metalThickness;
  buttonDiameter = 3.429; //0.135"
  buttonHeight = 1.143; //0.045"
  module ResetButton(){
    gapFromBottomOfBodyToBottomOfMetal = 1.8;
    union(){
      //silver plate around switch body
      color ("silver") union(){
        translate([0.0,0,gapFromBottomOfBodyToBottomOfMetal]) cube([metalThickness, buttonBodyY, 5.08]);//left metal
        translate([6.4,0,gapFromBottomOfBodyToBottomOfMetal]) cube([metalThickness, buttonBodyY, 5.08]);//right metal
        translate([metalThickness,5.9182,0])  cube([5.969,metalThickness,buttonBodyY]); //face plate
      }
      //black body of reset button
      translate([metalThickness,2.3876,0])
        color ("black") cube([5.969, 3.5306, 5.969]);

      // black button on switch
      translate([3.5306, 7.493, 3.175]) rotate([90,0,0])
        color ("red") cylinder(h=buttonHeight, d=buttonDiameter, $fn=100);
    }
  }

  module Cutout() {
    union(){
      translate([holderX/2, wallThickness + wall + buttonY, buttonFloor])
      rotate([90,0,0])
        cylinder(h=wallThickness, d=3.429+.5, $fn=100);

    };
    // // cutout hole for the reset button
    // // cube cutout for body of the reset button
    // translate([
    //   (resetButtonCenterOffset/2)-clearance,
    //   buttonBackWall + (6.35-3.5306-metalThickness-clearance)/*distance from back of prongs to back of button*/,
    //   buttonFloor
    // ])
    //   cube (size=[
    //     metalThickness + metalThickness + 5.969 + (clearance * 2),
    //     metalThickness + 3.5306 + clearance,
    //     (holderZ - buttonFloor) + clearance
    //   ]);
    // // cube cutout to hold the reset button in place
    // translate([
    //   (resetButtonCenterOffset/2)-clearance,
    //   buttonBackWall - clearance,
    //   (buttonFloor + 1.8) - clearance
    // ])
    //   cube (size=[
    //     metalThickness + metalThickness + 5.969 + (clearance * 2), // 0.8318
    //     6.35 - (metalThickness + 3.5306), // 2.3876
    //     5.08 + (clearance * 2) // 5.48
    //   ]);
    // translate([
    //   (resetButtonCenterOffset/2)-clearance,
    //   buttonBackWall + (6.35-3.5306-metalThickness-clearance),
    //   (buttonFloor + 1.3) - clearance
    // ])
    //   rotate([90,0,0]) prism(
    //     metalThickness + metalThickness + 5.969 + (clearance * 2),
    //     0.5,
    //     0.5
    //   );
  }

  wall = 2; //thickness of the holder wall around back and sides
  holderX = 12.954;
  holderZ = 7.515;
  middleMinusWalls = holderX - (wall * 2);
  module Holder() {
    union(){
      translate([0, 0, 0])                 cube([wall, wall + buttonY + wallThickness, holderZ]);
      translate([holderX - wall, 0, 0])    cube([wall, wall + buttonY + wallThickness, holderZ]);
      translate([wall, 0, 0])              cube([middleMinusWalls, wall, holderZ]);
      translate([wall, wall, 0])           cube([middleMinusWalls, buttonY,holderZ]);
      translate([0, wall + buttonY, 0]) cube([holderX, wallThickness,holderZ]);
    };
  }
  buttonFloor = 0.635;
  buttonBackWall = 2.54;
  // resetButtonCenterOffset = holderX
  //   - metalThickness /* left metal  */
  //   - 5.969  /* body        */
  //   - metalThickness /* right metal */;
  // *translate([resetButtonCenterOffset/2, buttonBackWall, buttonFloor]) ResetButton();
  clearance = 0.2;
}
ResetButtonHolder(3.81);
