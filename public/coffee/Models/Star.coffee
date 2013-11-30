define ["Models/LiteSonicModel"], (LiteSonicModel) ->
	class Star extends LiteSonicModel
		createAPICall: "star"
		updateAPICall: "star"
		deleteAPICall: "unstar"

		defaults:
			id: null
