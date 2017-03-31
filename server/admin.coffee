Accounts.onCreateUser (options, user) ->
	if options.profile
		user.profile = options.profile
	else
		unless Meteor.users.findOne({'profile.type': 'teacher'})
			user.roles = ['admin']
			user.profile =
				type: 'teacher'
	return user

