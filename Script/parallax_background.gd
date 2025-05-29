extends ParallaxBackground

func _ready() -> void:
	pass
	
	
func _process(delta: float) -> void:
	scroll_base_offset.x -= 1.5
	
