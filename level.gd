class level:

	var levelScene #scene
	var levelNumb #int
	
	
	func newLevel(scene, numb):
		levelNumb =numb
		levelScene =scene
	
	#func set_levelScene(newScene):
	#	levelScene =newScene
	
	#func set_levelNumb(newNumb):
	#	levelNumb =newNumb
	
	
	func get_levelScene():
		return levelScene
	
	func get_levelNumb():
		return levelNumb

