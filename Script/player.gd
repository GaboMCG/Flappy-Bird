extends RigidBody2D

var speed = 300.0
var puntaje = 0

func _ready() -> void:
	
	#variable y funcion que divide la pantalla en 2 (tanto su eje x.y)
	var viewport_size = get_viewport().get_visible_rect().size
	position = viewport_size/2
	
 #funcion para integrar las fisicas de un personaje/objeto en el juego
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if Input.is_action_just_pressed("volar"):
		linear_velocity = Vector2.ZERO
		apply_central_impulse(Vector2(0,-speed))
		$AnimatedSprite2D.play("movimiento")
		
		
func game_over():
	get_tree().paused = true
	$"../mensaje".show()
	$"../mensaje/Gameover".show()
	
func raise_score():
	puntaje += 1
	$"../Label".text = str(puntaje)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("tierra"):
		game_over()
