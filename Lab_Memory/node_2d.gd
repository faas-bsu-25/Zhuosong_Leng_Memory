extends Node2D

var selected_cards : Array
var card_match = false

func _ready() -> void:
	selected_cards = []
	
func _on_card_card_selected(selected_card) -> void:
	selected_cards.append(selected_card)
	$AudioStreamPlayer2.play()
	
	if selected_cards.size() >= 2:
		$flip_timer.start()
		
		if selected_cards[0].card_value == selected_cards[1].card_value:
			card_match = true
		else:
			card_match = false
	pass # Replace with function body.

func _on_flip_timer_timeout() -> void:
	if card_match:
		selected_cards[0].queue_free()
		selected_cards[1].queue_free()
		$AudioStreamPlayer.play()
	else:
		selected_cards[0]._flip()
		selected_cards[1]._flip()
		
	selected_cards = []
	pass # Replace with function body.
