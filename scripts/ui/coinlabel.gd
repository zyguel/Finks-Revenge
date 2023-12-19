extends Label

func _process(_delta):
	self.text = "Points: " + str(Global.points)
