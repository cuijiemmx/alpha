Accounts.onCreateUser (options, user) ->
	unless user.profile
		user.profile = {}

	switch options.profile?.type
		when 'app'
			user.profile.type = 'app'
		when 'teacher'
			user.profile.type = 'teacher'
		when 'student'
			user.profile.type = 'student'
		when 'parent'
			user.profile.type = 'parent'
		else
			user.profile.type = 'teacher'

	user.username = "#{user.profile.type.substr(0, 1)}id_#{options.username}"

	if user.profile.type == 'teacher'
		unless Meteor.users.findOne({'profile.type': 'teacher'})
			user.roles = ['admin']

	return user
