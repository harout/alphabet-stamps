$fn=30;


difference(){
 minkowski(){
    linear_extrude(10){
        square(size=33, center=true);
    }

    cylinder(r=3.5,h=0.01);
}
    linear_extrude(10.1){
        square(size=33, center=true);
    }
}

 difference(){
    linear_extrude(6.99){
        square(size=33.1, center=true);
    }


    translate([0,0,5]){
        rotate(a=180,v=[0,0,1]){
            minkowski(){
                linear_extrude(2){
                    text(text="դ",
                         font="Noto Sans Armenian:style=Regular",
                         size=20,
                         valign="center",
                         halign="center");
                }
                cylinder(r1 = 0, r2 = 2, h = 2);
            }
        }
    }
 }
