extends Node

var playerName = "NAME"
var playerLife = 100
var playerlvl = 1
var playerxp = 0
var playerAtaque = 20
var playerLifeRefresh = 10

var dialogPos = Vector2()

func setPlayerLifeRefresh(refresh):
	playerLifeRefresh = refresh
func getPlayerLifeRefresh():
	return playerLifeRefresh

func setDialogPos(pos):
	dialogPos = pos
func getDialogPos():
	return dialogPos


func setPlayerxp(xp):
	playerxp += xp
	if (playerxp >= 0 and playerxp < 100):
		setPlayerlvl(1)
		setPlayerAtaque(20)
		setPlayerLifeRefresh(10)
	elif (playerxp >= 100 and playerxp < 200):
		setPlayerlvl(2)
		setPlayerAtaque(30)
		setPlayerLifeRefresh(20)
	elif (playerxp >= 200 and playerxp < 300):
		setPlayerlvl(3)
		setPlayerAtaque(40)
		setPlayerLifeRefresh(30)
	elif (playerxp >= 300 and playerxp < 400):
		setPlayerlvl(4)
		setPlayerAtaque(50)
		setPlayerLifeRefresh(40)
	elif (playerxp > 400):
		setPlayerlvl(5)
		setPlayerAtaque(100)
		setPlayerLifeRefresh(50)

func setPlayerlvl(lvl):
	playerlvl = lvl
func getPlayerlvl():
	return playerlvl

func setPlayerName(name):
	playerName = name
func getPlayerName():
	return playerName

func setPlayerLife(life):
	playerLife = playerLife - life
func getPlayerLife():
	return playerLife

func setPlayerAtaque(ataque):
	playerAtaque = ataque
func getPlayerAtaque():
	return playerAtaque