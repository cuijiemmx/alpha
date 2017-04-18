@AdminConfig =
	name: '平台管理'
	collections:
		Apps:
			color: 'blue'
			icon: ''
			label: '应用'
			extraFields: ['user', 'userType', 'online']
			tableColumns: [
				{ label: '上线中', name: 'onlineStatus()' }
				{ label: 'Client Id', name: 'clientId'}
				{ label: '标题', name: 'label'}
				{ label: '用户类型', name: 'userTypeName()'}
				{ label: '用户角色', name: 'userRoles'}
			]
			templates:
				new:
					name: 'adminApps'
				edit:
					name: 'adminApps'
			insert: false
		AppCategories:
			color: 'blue'
			icon: ''
			label: '应用类别'
			extraFields: ['apps']
			tableColumns: [
				label: '名称'
				name: 'name'
			,
				label: '标题'
				name: 'label'
			,
				label: '应用'
				name: 'appNames()'
			]
		Links:
			color: 'blue'
			icon: ''
			label: '友情链接'
			tableColumns: [
				{ label: '标题', name: 'label' }
				{ label: '地址', name: 'url' }
			]
		Wallpapers:
			color: 'blue'
			icon: ''
			label: '桌面背景'
			tableColumns: [
				{ label: '标题', name: 'label' }
			]
		'Meteor.roles':
			color: 'blue'
			icon: ''
			label: '角色'
			tableColumns: [
				{ label: 'Name', name: 'name'}
				{ label: 'Label', name: 'label'}
			]
	autoForm:
		omitFields: ['createdAt', 'updatedAt']
