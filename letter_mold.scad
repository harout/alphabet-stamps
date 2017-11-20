$fn=30;

epsilon = 0.05;
mold_bottom_thickness = 5.0;
letter_thickness = 2.0;
rubber_base_thickness = 3.0;

letter = "";
font_size = 20;
bounding_square_size = 33;

// The outside shell to hold in the liquid rubber

difference(){
    // Rounding the edges seems to held the mold stick to the build plate
    // on the 3d printer
     
     minkowski(){
        linear_extrude(mold_bottom_thickness + rubber_base_thickness){
            square(size=bounding_square_size, center=true);
        }
    
        cylinder(r=3,h=0.01);
    }

    minkowski(){
        linear_extrude(mold_bottom_thickness + rubber_base_thickness + epsilon){
            square(size=bounding_square_size - 3, center=true);
        }
        
        cylinder(r1 = 1.5, r2 = 1.5, h = mold_bottom_thickness + rubber_base_thickness + epsilon);
    }

}


// The letter
difference(){
    // Make a block into which the letter's shape will be cut
    linear_extrude(mold_bottom_thickness - epsilon){
        square(size=bounding_square_size + epsilon, center=true);
    }

    translate([0,0,mold_bottom_thickness - letter_thickness]){
        rotate(a=180,v=[0,0,1]){
            // This produces a slope between the face of the letter and
            // the base of the rubber stamp. This eases demolding
            // Noto Sans Armenian:style=Regular
            minkowski(){
                linear_extrude(letter_thickness){
                    text(text=letter,
                         font="Arek Armenian:style=Italic",
                         size=font_size,
                         valign="center",
                         halign="center");
                }
                cylinder(r1 = 0, r2 = 2, h = letter_thickness);
            }
        }
    }
 }