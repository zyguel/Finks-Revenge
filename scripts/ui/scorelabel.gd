extends Label

func _ready():
	self.text = "Final Score: " + str(Global.points)
