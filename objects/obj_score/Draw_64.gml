//nnndraw_rectangle_color(0, 0, room_width, room_height, c_navy, c_red, c_orange, c_teal, false);

draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_alpha(.5);
draw_rectangle_color(0, 0, room_width, room_height, c_navy, c_navy, c_navy, c_navy, false);
draw_set_alpha(1);
draw_text(room_width/2, 100, "You died as a Hero.\nSaving your friends from the wildfire");
draw_text(room_width/2, 150, "The ones you freed are now safe thanks to you!");
draw_text(room_width/2, 200, "You have accumulated " + string(obj_game.game_score) + " points!");

draw_text(room_width/2, 250, "Thank you for playing my Ludum Dare 40 entry");
draw_text(room_width/2, 300, "Made by @SuciuTiberius");

draw_text(room_width/2, 350, "Special thanks to friends and family for the support");
draw_text(room_width/2, 400, "Honoroable mentions goes to my supportive girlfriend :D\n and twitch user ImDaveead");

draw_text(room_width/2, 450, "Press <escape> to quit or press <enter> to start again");