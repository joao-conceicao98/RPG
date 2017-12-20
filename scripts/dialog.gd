extends RichTextLabel

var dialog = ["Olá!",
"Bem vindo ao meu primeiro jogo",
"Este jogo foi criado para a cadeira de PI",
"Para o player andar usa as setas do teclado",
"Para disparar o teu ataque usa a tecla \"1\" ",
"Existem 4 planetas no total:",
"Satinico (o teu planeta)",
"Neptanas",
"Jupitar (desbloqueado quando o Boss do planeta Neptanas for derrotado)",
"E BDI (desbloqueado quando o Boss do planeta Jupitar for derrotado)",
"Estás pronto?",
"Bora!"
]
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0) #serve para indicar quantos char deve estar visíveis
	
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
			else:
				get_node("/root/globals").setScene("res://scene/Planet_Satinico.tscn")
		else: #faz o "skip" do resto do dialogo
			set_visible_characters(get_total_character_count())


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)