Meteor.roles.upsert
	name: 'admin'
,
	$set:
		name: 'admin'
		label: '管理员'

preinstalledApps = [
	online: true
	type: 'system'
	userTypes: ['teacher']
	userRoles: ['admin']
	openInNewTab: true
	clientId: 'admin'
	label: '平台管理'
	icon: '/appicons/manage.png'
	startupUri: '/admin'
,
	online: true
	type: 'system'
	userTypes: ['teacher']
	userRoles: ['admin']
	openInNewTab: false
	clientId: 'sysSettings'
	label: '平台个性化'
	icon: '/appicons/sys_settings.png'
	startupUri: '/sysSettings'
,
	online: true
	type: 'system'
	userTypes: ['teacher', 'student', 'parent', 'app']
	openInNewTab: false
	clientId: 'profile'
	label: '个人设置'
	icon: '/appicons/profile.png'
	startupUri: '/profile'
,
	online: true
	type: 'system'
	userTypes: ['app']
	openInNewTab: false
	clientId: 'myApps'
	label: '应用管理'
	icon: '/appicons/apps.png'
	startupUri: '/myApps'
,
	online: true
	type: '3rd-party'
	userTypes: ['teacher']
	openInNewTab: true
	clientId: 'testApp'
	clientSecret: 'hMwuYNz2YYSGhwRh_lX0k3QWFQv3Sv5VmBNxgNMZo92'
	label: '示例应用'
	icon: '/appicons/plugin.png'
	startupUri: 'http://app0.geekernel.com'
	redirectUri: 'http://app0.geekernel.com/callback'
]

if Apps.find().count() == 0
	for preinstalledApp in preinstalledApps
		if preinstalledApp.type == '3rd-party'
			user = Accounts.findUserByUsername("aid_#{preinstalledApp.clientId}")
			if user
				preinstalledApp.user = user._id
			else
				preinstalledApp.user = Accounts.createUser
					username: preinstalledApp.clientId
					type: 'app'
					profile:
						name: preinstalledApp.label

Seed 'apps',
	data: preinstalledApps

# Seed 'appCategories',
# 	data: [
# 		name: 'category0'
# 		label: '类型0'
# 		icon: 'ion-aperture'
# 		apps: ['admin', 'testApp']
# 	,
# 		name: 'category1'
# 		label: '类型1'
# 		icon: 'ion-aperture'
# 		apps: ['testApp']
# 	]

Seed 'links',
	data: [
		label: '武昌区教育局'
		url: 'http://www.updust.com'
		thumbnail: '/images/wuchang.png'
	,
		label: '武汉市教育局'
		url: 'http://www.geekernel.com'
		thumbnail: '/images/wuchang.png'
	,
		label: '湖北省教育局'
		url: 'http://www.aliyun.com'
		thumbnail: '/images/wuchang.png'
	]

Seed 'wallpapers',
	data: [
		label: '冲浪'
		image: '/images/冲浪.jpg'
	,
		label: '办公桌'
		image: '/images/办公桌.jpg'
	,
		label: '麦田',
		image: '/images/麦田.jpg'
	,
		label: '秋千'
		image: '/images/秋千.jpg'
	,
		label: '船'
		image: '/images/船.jpg'
	,
		label: '好好学习',
		image: '/images/好好学习.jpg'
	]
