extends Label



func _ready():
	text = "Points: "+str(Variables.current_points	)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "Points: "+str(Variables.current_points)
