epsilon = 0.05;
mold_bottom_thickness = 5.0;
letter_thickness = 2.0;
rubber_base_thickness = 3.0;

letter = "ֆ";
font_size = 20;
bounding_square_size = 33;

difference(){
    linear_extrude(letter_thickness + rubber_base_thickness){
        square(size=bounding_square_size + epsilon, center=true);
    }
    include <letter_mold.scad>;
}