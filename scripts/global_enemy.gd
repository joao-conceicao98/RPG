extends Node

#inimigo1
var inimigo1_name = "inimigo1"
var inimigo1_stat = "vivo"
var inimigo1_life = 100
var inimigo1_ataque = 5
#inimigo1
#######################################
#Enemy_Neptanas
var Enemy_Neptanas_name = "Enemy_Neptanas"
var Enemy_Neptanas_stat = "vivo"
var Enemy_Neptanas_life = 100
var Enemy_Neptanas_ataque = 5
#Enemy_Neptanas
#######################################
#Enemy_BDI
var Enemy_BDI_name = "Enemy_BDI"
var Enemy_BDI_stat = "vivo"
var Enemy_BDI_life = 100
var Enemy_BDI_ataque = 5
#Enemy_BDI
#######################################
#Enemy_Júpitar
var Enemy_Jupitar_name = "Enemy_Jupitar"
var Enemy_Jupitar_stat = "vivo"
var Enemy_Jupitar_life = 100
var Enemy_Jupitar_ataque = 5
#Enemy_Júpitar
#######################################
#######################################
#Boss_Neptanas
var Boss_Neptanas_name = "Boss_Neptanas"
var Boss_Neptanas_stat = "vivo"
var Boss_Neptanas_life = 200
var Boss_Neptanas_ataque = 10
#Boss_Neptanas
#######################################
#Boss_Jupitar
var Boss_Jupitar_name = "Boss_Jupitar"
var Boss_Jupitar_stat = "vivo"
var Boss_Jupitar_life = 200
var Boss_Jupitar_ataque = 10
#Boss_Jupitar
#######################################
#Boss_BDI
var Boss_BDI_name = "Boss_BDI"
var Boss_BDI_stat = "vivo"
var Boss_BDI_life = 200
var Boss_BDI_ataque = 10
#Boss_Neptanas
#######################################
#Boss_Final
var Boss_Final_name = "Boss_Final"
var Boss_Final_stat = "vivo"
var Boss_Final_life = 200
var Boss_Final_ataque = 10
#Boss_Final
#######################################


#######################################
func get_enemy_stat(name):
	if name == "inimigo1":
		return inimigo1_stat
		
	if name == "Enemy_Neptanas":
		return Enemy_Neptanas_stat
	if name == "Boss_Neptanas":
		return Boss_Neptanas_stat
		
	if name == "Enemy_BDI":
		return Enemy_BDI_stat
	if name == "Boss_BDI":
		return Boss_BDI_stat
		
	if name == "Enemy_Jupitar":
		return Enemy_Jupitar_stat
	if name == "Boss_Jupitar":
		return Boss_Jupitar_stat
#######################################

#######################################
func set_enemy_stat(name, stat):
	if name == "inimigo1":
		inimigo1_stat = stat
		
	if name == "Enemy_Neptanas":
		Enemy_Neptanas_stat = stat
	if name == "Boss_Neptanas":
		Boss_Neptanas_stat = stat
		
	if name == "Enemy_BDI":
		Enemy_BDI_stat = stat
	if name == "Boss_BDI":
		Boss_BDI_stat = stat
		
	if name == "Enemy_Jupitar":
		Enemy_Jupitar_stat = stat
	if name == "Boss_Jupitar":
		Boss_Jupitar_stat = stat
#######################################

#######################################
func get_enemy_life(name):
	if name == "inimigo1":
		return inimigo1_life
		
	if name == "Enemy_Neptanas":
		return Enemy_Neptanas_life
	if name == "Boss_Neptanas":
		return Boss_Neptanas_life
		
	if name == "Enemy_BDI":
		return Enemy_BDI_life
	if name == "Boss_BDI":
		return Boss_BDI_life
		
	if name == "Enemy_Jupitar":
		return Enemy_Jupitar_life
	if name == "Boss_Jupitar":
		return Boss_Jupitar_life
#######################################

#######################################
func get_enemy_ataque(name):
	if name == "inimigo1":
		return inimigo1_ataque
		
	if name == "Enemy_Neptanas":
		return Enemy_Neptanas_ataque
	if name == "Boss_Neptanas":
		return Boss_Neptanas_ataque
		
	if name == "Enemy_BDI":
		return Enemy_BDI_ataque
	if name == "Boss_BDI":
		return Boss_BDI_ataque
		
	if name == "Enemy_Jupitar":
		return Enemy_Jupitar_ataque
	if name == "Boss_Jupitar":
		return Boss_Jupitar_ataque
#######################################
