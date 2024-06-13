@tool
extends TileMap

@export var generateTerrain : bool
@export var clearTerrain : bool

func _ready():
	pass

func _process(delta):
	if generateTerrain:
		generateTerrain = false
		GenerateTerrain()
	
	if clearTerrain:
		clearTerrain = false
		clear()
	
func GenerateTerrain():
	print("Generating Terrain")
	
	var rng = RandomNumberGenerator.new()
	
	for x in range(16):
		for y in range(16):
			set_cell(0,Vector2i(x,y),0,Vector2i(randi_range(0,5),0))
