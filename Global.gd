extends Node

var wave_cont =0
var wave_num = 0

func wave_counter():
	wave_cont += 1
	if wave_cont==5:
		wave_num+=1
		
func reset():
	wave_cont = 0
