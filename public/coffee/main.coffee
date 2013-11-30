require ["Models/Song"], (Song) ->
	console.log "woot"
	localStorage.setItem("LSSSHost", "http://192.168.1.120:4040")
	localStorage.setItem("LSUsername", "justin")
	localStorage.setItem("LSPassword", "elizabeth")
	window.Song = Song
