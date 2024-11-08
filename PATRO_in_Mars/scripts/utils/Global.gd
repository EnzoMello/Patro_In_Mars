extends Node

@onready var can_pause = true
@onready var transition_scene : PackedScene = preload("res://scenes/utils/fade_in_transition.tscn")
@onready var last_time = "Last Time: 00:00"
@onready var last_time_holder = ""


## Database de itens
var resources := {
	"copper_element":{
		"name": "Copper Bar",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/resources/copper bar.png"),
		"amount":0
	},
	"bronze_element":{
		"name": "Bronze Bar",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/resources/bronze bar.png"),
		"amount":0
	},
	"iron_element":{
		"name": "Iron Bar",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/resources/iron bar.png"),
		"amount":0
	},
	"hematite_element":{
		"name": "Pure Hematite Fragment",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/resources/hematite.png"),
		"amount":0
	},
	"blue_shard":{
		"name": "Blue Martian Shard",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/resources/shard_01c.png"),
		"amount":0
	},
	"dark_shard":{
		"name": "Dark Martian Matter",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/resources/shard_01i.png"),
		"amount":0
	},
}

## Database de consumiveis
var consumables := {
	"battery":{
		"name": "Battery",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/consumables/battery.png"),
		"amount":0
	},
	"rudimentar_plating":{
		"name": "Rudimentar Plating",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/consumables/rudimentar_plating.png"),
		"amount":0
	},
	"flux_overloader":{
		"name": "Flux Overloader",
		"description": "Preencher descrição do item aqui",
		"icon": preload("res://assets/resources_and_consumables/consumables/flux_overloader.png"),
		"amount":0
	},
}

## Cenas principais
var main_scenes := {
	"game" : preload("res://scenes/world.tscn"),
	"introduction":preload("res://scenes/Introduction.tscn"),
	"history" : preload("res://scenes/history.tscn"),
	"main_menu" : preload("res://scenes/main_menu.tscn"),
	"game_over" : preload("res://scenes/game_over_menu.tscn"),
	"win" : preload("res://scenes/game_win.tscn")
}

# gambiarra do dano da bala
var damage_holder = 0

## Função que transiciona as cenas
func transition_to_scene(destiny_scene: String) -> void:
	var trans = transition_scene.instantiate()
	trans.destiny_scene = destiny_scene
	add_child(trans)
	
