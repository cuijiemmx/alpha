Template.links.helpers
	links: ->
		Links.find()
	thumbnailSrc: (_id) ->
		picture = Pictures.findOne _id
		picture?.url({store: 'images'})
