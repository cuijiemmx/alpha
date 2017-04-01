Template.links.helpers
	links: ->
		Links.find()
	thumbnailSrc: (thumbnail) ->
		if thumbnail.indexOf('/') > -1
			thumbnail
		else
			picture = Pictures.findOne thumbnail
			picture?.url({store: 'images'})
