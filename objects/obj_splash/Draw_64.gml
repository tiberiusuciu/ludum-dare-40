//nnndraw_rectangle_color(0, 0, room_width, room_height, c_navy, c_red, c_orange, c_teal, false);

draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_alpha(.5);
draw_rectangle_color(0, 0, room_width, room_height, c_navy, c_navy, c_navy, c_navy, false);
draw_set_alpha(1);
draw_text(room_width/2, 100, "Snowman - Wildfire Edition")
draw_text(room_width/2, 200, "You're a snowman on the run from a wildfire.\nSave your friends and get out!");

draw_text(room_width/2, 300, "A game made by\n@SuciuTiberius");
draw_text(room_width/2, 350, "for Ludum Dare 40");

draw_text(room_width/2, 400, "Press <Enter> to begin");

draw_set_halign(fa_left)