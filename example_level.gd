extends Node2D
# Example / sanity-check level showing how to paint the generated TileSet.
# Atlas coordinates below are looked up from assets/terrain_tile_index.json
# (search that file by "name" to find any other piece's atlas_coords).

func _ready():
	var layer := $TerrainLayer

	# A big pre-made cave chunk (10x10 cells) - "Ground Additional 01"
	layer.set_cell(Vector2i(-3, -3), 0, Vector2i(0, 0))

	# A row of solid ground blocks - "Ground 05/06/07" (all fully solid, 4x4 cells each)
	layer.set_cell(Vector2i(0, 4), 0, Vector2i(4, 34))
	layer.set_cell(Vector2i(1, 4), 0, Vector2i(8, 34))
	layer.set_cell(Vector2i(2, 4), 0, Vector2i(12, 34))

	# Props - "Wooden Box" and "Wooden Barrel"
	layer.set_cell(Vector2i(4, -6), 0, Vector2i(8, 42))
	layer.set_cell(Vector2i(6, -6), 0, Vector2i(12, 42))
