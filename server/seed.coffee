Meteor.startup ->
	appsInfo = JSON.parse Assets.getText('apps.json')
	for appInfo in appsInfo
		app = Apps.findOne({clientId: appInfo.clientId})
		if app
			Apps.update(app._id, {$set: {
				clientSecret: appInfo.clientSecret
				icon:         appInfo.icon,
				name:         appInfo.name,
				startupUri:   appInfo.startupUri,
				redirectUri:  appInfo.redirectUri
			}})
		else
			uid = Accounts.createUser
				username: "aid_#{appInfo.clientId}"
				profile:
					type: 'app'
					name: appInfo.name
			app = appInfo
			app.clientSecret or app.clientSecret = Random.secret()
			app.user = uid
			Apps.insert app


Seed 'links',
	data: [
		label: '武昌区教育局'
		url: 'http://www.updust.com'
	,
		label: '武汉市教育局'
		url: 'http://www.geekernel.com'
	,
		label: '湖北省教育局'
		url: 'http://www.aliyun.com'
	]
