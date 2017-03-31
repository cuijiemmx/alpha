Accounts.onCreateUser (options, user) ->
	if options.profile
		user.profile = options.profile
	else
		console.log 'hi'
		unless Meteor.users.findOne({'profile.type': 'teacher'})
			console.log 'he'
			user.roles = ['admin']
			user.profile =
				type: 'teacher'
	return user

