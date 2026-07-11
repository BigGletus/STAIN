extends Node

enum {
	KEY_BTN = -1, MOUSE_BTN = -2,
	MODE_KEY_EVENT,
	MODE_MOUSE_EVENT
}

const INPUT_ACTIONS: Dictionary[StringName,Array] = {
	&"click_left": [MOUSE_BTN, MOUSE_BUTTON_LEFT],
	&"click_right": [MOUSE_BTN, MOUSE_BUTTON_RIGHT],
	&"move_up": [KEY_BTN, KEY_W],
	&"move_down": [KEY_BTN, KEY_S],
	&"move_right": [KEY_BTN, KEY_D],
	&"move_left": [KEY_BTN, KEY_A],
	&"menu_character": [KEY_BTN, KEY_C],
	&"action_1": [KEY_BTN, KEY_1],
	&"action_2": [KEY_BTN, KEY_2],
	&"action_3": [KEY_BTN, KEY_3],
	&"action_4": [KEY_BTN, KEY_4],
	&"action_5": [KEY_BTN, KEY_5],
	&"action_6": [KEY_BTN, KEY_6],
	&"action_7": [KEY_BTN, KEY_7],
	&"action_8": [KEY_BTN, KEY_8],
	&"action_9": [KEY_BTN, KEY_9],
	&"action_0": [KEY_BTN, KEY_0]
}

func _ready() -> void:
	for input_action: StringName in (INPUT_ACTIONS.keys() as Array[StringName]):
		InputMap.add_action(input_action)
		var event_mode: int = KEY_BTN
		for input_int: int in (INPUT_ACTIONS[input_action] as Array[int]):
			if input_int < 0: # Event Mode int
				if input_int == KEY_BTN: event_mode = MODE_KEY_EVENT
				else: event_mode = MODE_MOUSE_EVENT
			else: #Event key int
				match event_mode:
					MODE_KEY_EVENT:
						add_key_event(input_action, input_int)
					MODE_MOUSE_EVENT:
						add_mouse_event(input_action, input_int)
		print(">>" + str(input_action) + " " + str(InputMap.action_get_events(input_action)))

static func add_key_event(action: StringName, keycode: int) -> void:
	var key_event: InputEventKey = InputEventKey.new()
	key_event.set_keycode(keycode)
	InputMap.action_add_event(action, key_event)

static func add_mouse_event(action: StringName, mousecode: int) -> void:
	var mouse_event: InputEventMouseButton = InputEventMouseButton.new()
	mouse_event.set_button_index(mousecode)
	InputMap.action_add_event(action, mouse_event)
