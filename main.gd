extends Node2D
@onready var layer_a: TileMapLayer = $LayerA
@onready var layer_b: TileMapLayer = $LayerB
@onready var label: Label = $UI/StateLabel
@onready var player: CharacterBody2D = $Player

var active_layer := "A"

const SOLID_BLOCK := Vector2i(4, 34)

func _ready() -> void:
	Gamestate.total_coins = get_tree().get_nodes_in_group("coins").size()
	_apply_layer_state()
	
func _process(delta: float) -> void:
	$UI/Coin.text = "Coins: %d / %d" % [Gamestate.coins, Gamestate.total_coins]

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("switch_layer"):
		active_layer = "B" if active_layer == "A" else "A"
		_apply_layer_state()

func _apply_layer_state() -> void:
	var a_active := active_layer == "A"
	layer_a.visible = a_active
	layer_a.collision_enabled = a_active
	layer_b.visible = not a_active
	layer_b.collision_enabled = not a_active
	label.text = "Layer %s :) press E to switch" % active_layer
	label.add_theme_color_override(
		"font_color",
		Color(0.0, 0.587, 0.795, 1.0) if a_active else Color(0.0, 0.447, 0.0, 1.0)
	)

func _on_win_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$UI/YouWin.visible = true
		
func _on_restart_button_pressed() -> void:
	player.die()
