extends TileMapLayer

@export var explosion_sprite : CompressedTexture2D = preload("res://Assets/Elements/Coin/Coin_0000000.png")

func erase_tile_at(bullet_position : Vector2i):
	var sprite_placeholder = Sprite2D.new()
	%World.add_child(sprite_placeholder)
	
	sprite_placeholder.texture = explosion_sprite
	sprite_placeholder.position = bullet_position
	sprite_placeholder.scale *= 0.1
	
	sprite_placeholder.material = preload("res://Themes/Shaders/white.tres")
	await get_tree().create_timer(0.05).timeout
	var subtract_material = CanvasItemMaterial.new()
	subtract_material.blend_mode = CanvasItemMaterial.BLEND_MODE_SUB
	sprite_placeholder.material = subtract_material
	
