extends Node2D

@export var quadrant_size: int = 100
var carve_radius := 40
var mouse_pos : Vector2

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#_make_mouse_circle()

func _input(event):
	if event is InputEventMouseMotion:
		pass
		#$CarveArea.position = mouse_pos
	
	if Input.is_action_just_pressed("click_left"):
		_carve()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_pos = get_global_mouse_position()

func _carve():

	var clipped_polygons = Geometry2D.clip_polygons(%Destructable_Terrain.polygon, %CarveArea.polygon)
	#%Destructable_Terrain.set_deferred("polygon", clipped_polygons[0]) 
	var poop = Polygon2D.new()
	poop.polygon = clipped_polygons
	add_child(poop)
	poop.position = Vector2.ZERO
	#print("clipped_polygons: ", clipped_polygons.polygons)
#
#func _get_affected_quadrants(pos):
	#"""
	#Returns array of Quadrants that are affected by
	#the carving. Not the best function: sometimes it
	#returns some quadrants that are not affected
	#"""
	#var affected_quadrants = []
	#var half_diag = sqrt(2)*quadrant_size/2
	#for quadrant in $Quadrants.get_children():
		#var quadrant_top_left = quadrant.default_quadrant_polygon[0]
		#var quadrant_center = quadrant_top_left + Vector2(quadrant_size, quadrant_size)/2
		#if quadrant_center.distance_to(pos) <= carve_radius + half_diag:
			#affected_quadrants.push_back(quadrant)
	#return affected_quadrants
