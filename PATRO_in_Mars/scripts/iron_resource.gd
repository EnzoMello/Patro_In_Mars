extends Area2D


func _ready():
	$Timer.start()

func _on_body_entered(body: Player) -> void:
	body.resources["iron_element"]["amount"] += 1
	print("Global", Global.resources["iron_element"]["amount"])
	print("Player", body.resources["iron_element"]["amount"])
	queue_free()


func _on_timer_timeout():
	queue_free()
