extends TileMapLayer

@export var explosion_sprite : CompressedTexture2D = preload("res://Assets/Elements/Explosions/EXPLOSIONS2.png")

func erase_tile_at(bullet_position : Vector2i):
	var sprite_placeholder = Sprite2D.new()
	sprite_placeholder.texture = explosion_sprite
	%World.add_child(sprite_placeholder)
	sprite_placeholder.position = bullet_position
	var subtract_material = CanvasItemMaterial.new()
	subtract_material.blend_mode = CanvasItemMaterial.BLEND_MODE_SUB
	sprite_placeholder.material = subtract_material
	sprite_placeholder.scale *= 0.1
