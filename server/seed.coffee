Meteor.startup ->
	apps = JSON.parse Assets.getText('apps.json')
	for app in apps
		user = Accounts.findUserByUsername app.username
		if user
			Accounts.setPassword user._id, app.password
			Meteor.users.update(user._id, {$set: {profile: {
				type: 'app',
				name: app.name,
				startupUri: app.startupUri,
				redirectUri: app.redirectUri
			}}})
		else
			Accounts.createUser
				username: app.username
				password: app.password
				profile:
					type: 'app'
					name: app.name
					startupUri: app.startupUri
					redirectUri: app.redirectUri
