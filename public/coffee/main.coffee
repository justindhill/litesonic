require ["Models/Artist", "AppRouter", "Collections/ArtistList","Views/AppContent", "Views/AppHeader", "Views/AppPlayer"],
		(Artist, AppRouter, ArtistList, AppContent, AppHeader, AppPlayer) ->

			console.log "Starting LiteSonic"

			# Temporary. This will be set by the login page in the future.
			localStorage.setItem("LSSSHost", "http://localhost:4040")
			localStorage.setItem("LSUsername", "justin")
			localStorage.setItem("LSPassword", "elizabeth")

			# Set up the main views
			console.log "Adding main views..."
			window.LiteSonic = {}
			LiteSonic.contentView = new AppContent
			LiteSonic.headerView = new AppHeader
			LiteSonic.playerView = new AppPlayer

			# Set up routing
			console.log "Starting the router..."
			LiteSonic.router = new AppRouter
			Backbone.history.start(pushState: no)

			console.log "Done!"
