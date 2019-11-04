extends Node

var nextID =0
var doorPaths =[]
var doorPositions =[]

func assign_id(path, pos):
		var id =nextID
		nextID +=1
		doorPaths.append(path)
		doorPositions.append(pos)
		return id
	
func get_door_path(id):
	var path =doorPaths[id]
	return path

func get_door_pos(id):
	var pos =doorPositions[id]
	return pos

