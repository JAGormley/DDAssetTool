/// globals

#macro TILE_SIZE 16

enum stageTypes {
	space,
	eden,
	vr,
	badlands,
	test
}

enum stageResTypes {
	wall,
	wallSmokeCollider,
	floorType,
	outside,
	box,
	bedrock,
	hazard
}

enum axes {
	x = 0,
	y = 1
}
#macro AXES axes

enum collisionTileTypes { // need numbers for 0 tile offset
	wall = 1,
	air = 2,
	destWall = 3,
	box = 4,
	groundEdge = 5,
	creepWall = 6,
	borderWall = 7,
	outside = 8,
	rock = 9
}
#macro COLLISION_TILES collisionTileTypes

enum directions {
	up = 1,
	down = -1,
	left = 0,
	right = 2
}
#macro DIRS directions

enum inputTypes {
	keyboard,
	gamepad
}

enum keyBoardInputs {
	left,
	right
}

enum selectionState {
	selected,
	confirmed
}

enum gameModes {
	standard,
	geode
}

// win condition
enum wc {
	survival,
	killThresh,
	gems,
	totalGems
}

enum detectorModes {
	sweep,
	confirmed,
	inactive
}

enum button {
	onePressed,
	twoPressed,
	threePressed,
	fourPressed,
	oneReleased,
	twoReleased,
	threeReleased,
	oneQueuePressed,
	twoQueuePressed,
	oneQueueReleased,
	twoQueueReleased,
	twoHeld,
	boostHeld,
	abilityMod
}

enum keyboardLeft {
	left     = ord("A"),
	right    = ord("D"),
	up       = ord("W"),
	down     = ord("S"),
	one      = ord("C"),
	two      = ord("V"),
	three    = ord("X"),
	four	 = ord("Q"),
	swap     = ord("1"),
	pause	 = vk_lshift,
	lvlUp    = vk_left,
	//strafe	 = ord("B"),
	abilityMod	 = ord("R"),
	boost	 = ord("F")
}

enum keyboardRight {
	left     = ord("G"),
	right    = ord("J"),
	up       = ord("Y"),
	down     = ord("H"),
	one      = ord("O"),
	two      = ord("P"),
	three    = ord("K"),
	four	 = ord("L"),
	swap     = ord("2"),
	pause	 = vk_rshift,
	lvlUp    = vk_right,
	//strafe	 = ord("L"),
	abilityMod	 = ord("0"),
	boost	 = ord("I")
}

enum gamepadType {
	ps,
	xbox
}