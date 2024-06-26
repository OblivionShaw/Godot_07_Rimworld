@tool
extends TileMap

@export var generateTerrain : bool
@export var clearTerrain : bool

@export var mapWidth : int
@export var mapHeight : int
@export var terrainSeed : int

@export var grassThreshold : float
@export var grass2Threshold : float
@export var dirtThreshold : float
@export var rockThreshold : float


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
	
	var noise = FastNoiseLite.new()
	noise.noise_type = FastNoiseLite.TYPE_CELLULAR
	
	var rng = RandomNumberGenerator.new()
	
	if terrainSeed == 0:
		noise.seed = rng.randi()
	else:
		noise.seed = terrainSeed
	
	for x in range(mapWidth):
		for y in range(mapHeight):
			if noise.get_noise_2d(x,y) > grassThreshold:
				set_cell(0,Vector2i(x,y),0,Vector2i(0,0))
			elif noise.get_noise_2d(x,y) > grass2Threshold:
				set_cell(0,Vector2i(x,y),0,Vector2i(1,0))
			elif noise.get_noise_2d(x,y) > dirtThreshold:
				set_cell(0,Vector2i(x,y),0,Vector2i(2,0))
			elif noise.get_noise_2d(x,y) > rockThreshold:
				set_cell(0,Vector2i(x,y),0,Vector2i(3,0))
			else:
				set_cell(0,Vector2i(x,y),0,Vector2i(0,1))
