Template.registerHelper 'imageSrc', (_id) ->
	if Meteor.users
		user = Meteor.users.findOne _id
		if user?.profile?.picture
			picture = user.profile.picture

			if picture.indexOf('/') > -1
				picture
			else
				picture = Pictures.findOne user.profile.picture
				picture?.url({store: 'images'})
