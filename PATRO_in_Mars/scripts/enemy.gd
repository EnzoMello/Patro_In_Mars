extends CharacterBody2D

const enemy_pieces = preload("res://scenes/enemies/enemy1_pieces.tscn")
@onready var animation_player = $AnimationPlayer as AnimationPlayer
@export var pieces : PackedStringArray
@export var impulse = 50

@export var SPEED = 20.0
@export var hp = 10.0
@export var DAMAGE = 100.0
@onready var player = get_tree().get_first_node_in_group("Player")
@onready var sprite = $AnimatedSprite2D

# Drops
var drops = {
	"blue_shard" : preload("res://scenes/enemy_resource_1.tscn"),
	"dark_shard" : preload("res://scenes/enemy_resource_two.tscn"),
}

var drops_to_scene : Array = drops.values()



func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = SPEED*direction
	if velocity.x < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	move_and_slide()


func _on_hurt_box_hurt(DAMAGE):
	hp -= DAMAGE
	print("Tomei dano. Meu hp: ",hp)
	if hp <= 0:
		hp = 0
		# Escolhendo um recurso para aparecer em meio a esse cenário
		var drop_choice = randi() % drops_to_scene.size()
		# Acessando o recurso escolhido
		var resource_acess = drops_to_scene[drop_choice]
	
		# Agora,tentarei criar o recurso para aparecer na cena
		var resource_instance = resource_acess.instantiate()
		# Tentarei colocar o recurso criado no local onde a jazida estava
		resource_instance.global_position = self.global_position
		velocity = Vector2.ZERO
		#await sprite.animation_finished
		self.break_sprite()
		# Adicionando o recurso na cena
		get_tree().get_first_node_in_group("Pickups").add_child(resource_instance)
		
func break_sprite():
	for piece in pieces.size():
		var piece_instance = enemy_pieces.instantiate()
		get_parent().add_child(piece_instance)
		piece_instance.get_node("texture").texture = load(pieces[piece])
		piece_instance.global_position = global_position
		piece_instance.apply_impulse(Vector2(randi_range(-impulse,impulse), randi_range(-impulse, impulse * 2)))
	queue_free()
