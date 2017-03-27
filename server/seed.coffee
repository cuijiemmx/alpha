Meteor.startup ->
	appsInfo = JSON.parse Assets.getText('apps.json')
	for appInfo in appsInfo
		app = Apps.findOne({clientId: appInfo.clientId})
		if app
			Apps.update(app._id, {$set: {
				clientSecret:   appInfo.clientSecret
				name:        appInfo.name,
				startupUri:  appInfo.startupUri,
				redirectUri: appInfo.redirectUri
			}})
		else
			uid = Accounts.createUser
				username: "aid_#{appInfo.clientId}"
				profile:
					type: 'app'
					name: appInfo.name
			app = appInfo
			app.user = uid
			Apps.insert app
