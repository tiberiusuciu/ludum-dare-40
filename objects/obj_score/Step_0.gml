var escape = keyboard_check_pressed(vk_escape);
var enter = keyboard_check_pressed(vk_enter);

if (escape) {
	game_end();
}
if (enter) {
	game_restart();
}