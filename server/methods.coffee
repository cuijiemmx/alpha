Meteor.methods
	deleteAccount: (userId) ->
		if @userId == userId
			Meteor.users.remove _id: @userId

	initWithFile: (id) ->
		# console.log id

	insertApp: (app) ->
		check arguments, [Match.Any]
		user = Meteor.users.findOne @userId
		if user?.type is 'app'
			Apps.insert app
		else
			throw new Meteor.Error 400, 'user type is not app'

	updateApp: (app, id) ->
		check arguments, [Match.Any]
		user = Meteor.users.findOne @userId
		if user?.type is 'app'
			Apps.update id, app
		else
			throw new Meteor.Error 400, 'user type is not app'

	removeApp: (id) ->
		check arguments, [Match.Any]
		user = Meteor.users.findOne @userId
		if user?.type is 'app'
			Apps.remove id
		else
			throw new Meteor.Error 400, 'user type is not app'
