Accounts.onCreateUser (options, user) ->
	# console.log options
	# console.log user

	# for built-in sign-up form, type is in options.profile
	if options.profile?.type
		options.type = options.profile.type
		delete options.profile.type

	user.type = options.type or 'teacher'
	user.username = "#{user.type.substr(0, 1)}id_#{options.username}"
	user.profile = options.profile or {}
	user.roles = options.roles or []

	if user.type == 'teacher'
		unless Meteor.users.findOne({'type': 'teacher'})
			user.roles.push 'admin'

	return user
