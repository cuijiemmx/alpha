@AdminConfig =
	name: '平台管理'
	collections:
		# 'Meteor.roles':
		# 	color: 'blue'
		# 	icon: ''
		# 	label: '用户角色'
		# 	tableColumns: [
		# 		{ label: 'Name', name: 'name'}
		# 		{ label: 'Label', name: 'label'}
		# 	]
		Apps:
			color: 'blue'
			icon: ''
			label: '应用'
			extraFields: ['user', 'userTypes', 'online']
			tableColumns: [
				{ label: '上线中', name: 'onlineStatus()' }
				{ label: 'Client Id', name: 'clientId'}
				{ label: '应用名', name: 'label'}
				{ label: '用户类型', name: 'userTypesNames()'}
				{ label: '用户角色', name: 'userRoles'}
			]
			templates:
				new:
					name: 'adminApps'
				edit:
					name: 'adminApps'
			# insert: false
		# AppCategories:
		# 	color: 'blue'
		# 	icon: ''
		# 	label: '应用分类'
		# 	extraFields: ['apps']
		# 	tableColumns: [
		# 		label: '名称'
		# 		name: 'name'
		# 	,
		# 		label: '标题'
		# 		name: 'label'
		# 	,
		# 		label: '应用'
		# 		name: 'appNames()'
		# 	]
		Links:
			color: 'blue'
			icon: ''
			label: '友情链接'
			tableColumns: [
				{ label: '标题', name: 'label' }
				{ label: '地址', name: 'url' }
			]
		# Wallpapers:
		# 	color: 'blue'
		# 	icon: ''
		# 	label: '桌面背景'
		# 	tableColumns: [
		# 		{ label: '标题', name: 'label' }
		# 	]
	autoForm:
		omitFields: ['createdAt', 'updatedAt']
