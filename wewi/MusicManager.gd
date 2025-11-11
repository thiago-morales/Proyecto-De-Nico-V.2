extends AudioStreamPlayer


# Diccionario donde guardamos TODAS las canciones del juego
var tracks := {
	"nivel1.3": preload("res://musica/Musica.1-3.mp3"),
	"nivel4.5": preload("res://musica/Musica.4-5.mp3"),
	"intro": preload("res://musica/Musica.intro.mp3"),
	"menu": preload("res://musica/candidato2 (1).mp3"),
	"creditos": preload("res://musica/Dragon Ball GT Opening Piano Cover - Dan Dan Kokoro Hikareteku [V_qozAIR3kk].mp3")
}

# Reproduce una canción por nombre
func play_track(name: String):
	if not tracks.has(name):
		print("No existe la canción: ", name)
		return
	
	var new_stream = tracks[name]

	# Solo cambia si es una canción diferente (para NO reiniciar)
	if stream != new_stream:
		stream = new_stream
		play()
