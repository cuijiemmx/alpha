preinstalledApps = [
	type: 'system'
	userType: 'teacher'
	userRoles: ['admin']
	clientId: 'admin'
	label: '平台管理'
	icon: '/appicons/G28.png'
	startupUri: '/admin'
,
	type: '3rd-party'
	userType: 'teacher'
	userRoles: []
	clientId: 'testApp'
	clientSecret: Random.secret()
	label: '测试应用'
	icon: '/appicons/G28.png'
	startupUri: 'http://updust.com'
	redirectUri: 'http://updust.com'
]

if Apps.find().count() == 0
	for preinstalledApp in preinstalledApps
		if preinstalledApp.type == '3rd-party'
			preinstalledApp.user = Accounts.createUser
				username: preinstalledApp.clientId
				type: 'app'
				profile:
					name: preinstalledApp.label

Seed 'apps',
	data: preinstalledApps

Seed 'appCategories',
	data: [
		name: 'category0'
		label: '类型0'
		icon: 'ion-aperture'
		apps: ['admin', 'testApp']
	,
		name: 'category1'
		label: '类型1'
		icon: 'ion-aperture'
		apps: ['testApp']
	]

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
		label: '无 '
		image: ''
	]
