Template.registerHelper 'niceName', (_id)->
	if _id
		user = Meteor.users.findOne _id

	if user
		if user.username
			user.username
		else if typeof user.profile != 'undefined' and user.profile.firstName
			user.profile.firstName
		else if user.emails[0].address
			user.emails[0].address
		else
			'A user'

Template.registerHelper 'imageThumbSrc', (_id) ->
	if typeof Meteor.users != 'undefined'
		if Meteor.users.findOne _id
			user = Meteor.users.findOne({_id:_id})
			if typeof user.profile != 'undefined' and typeof user.profile.picture != 'undefined'
				picture = user.profile.picture

				if picture.indexOf('/') > -1
					picture
				else
					if typeof Pictures != 'undefined' && Pictures.findOne user.profile.picture
						picture = Pictures.findOne picture
						picture.url({store: 'thumbs'})
