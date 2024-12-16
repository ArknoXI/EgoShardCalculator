extends Node2D

@export var MD_normal :int
@export var MD_hard :int

@export var BattlePass := false

@export var Days :int
@onready var Result = $CanvasLayer/Control/PanelContainer/VBoxContainer/HBoxContainer/Result/Valor

func Get_CratesValue():
	var sum := 0.0
	var HardValue :int
	var LevelValue := 1
	var HardIncrease := 1
	if Days >= 5:
		sum += 2.0
	match MD_hard:
		0:
			HardValue = 0
		1:
			HardValue = 22.5
		2:
			HardValue = 23.5
		3:
			HardValue = 25.0
	if BattlePass :
		LevelValue = 3
		HardIncrease = 3
	sum += ((MD_normal * 3 * LevelValue) * Days) + (HardValue * HardIncrease) + Days
	return sum


func _on_button_pressed() -> void:
	Result.text = "Nada"
	Result.text = str(Get_CratesValue()) + " Caixas"

func _on_option_button_item_selected(index: int) -> void:
	MD_hard = index
	print(MD_hard)

func _on_check_button_toggled(toggled_on: bool) -> void:
	BattlePass = toggled_on
	print(BattlePass)

func _on_days_text_changed(new_text: String) -> void:
	Days = int(new_text)
	print(Days)

func _on_mdnormal_text_changed(new_text: String) -> void:
	MD_normal = int(new_text)
	print(MD_normal)


func _on_quit_pressed() -> void:
	get_tree().quit()
