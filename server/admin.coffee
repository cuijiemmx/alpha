Accounts.onCreateUser (options, user) ->
	code
	switch options.profile?.type
		when 'app'
			code = 'a'
		when 'teacher'
			code = 't'
		when 'student'
			code = 's'
		when 'parent'
			code = 'p'
		else
			code = 't'

	user.username = "#{code}id_#{options.username}"

	if code == 't'
		unless user.profile
			user.profile = {}
		user.profile.type = 'teacher'

		unless Meteor.users.findOne({'profile.type': 'teacher'})
			user.roles = ['admin']

	return user
