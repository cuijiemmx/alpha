@AdminConfig =
	name: '平台管理'
	# collections:
		# Posts:
		# 	color: 'red'
		# 	icon: 'pencil'
		# 	extraFields: ['owner']
		# 	tableColumns: [
		# 		{ label: 'Title', name: 'title' }
		# 		{ label: 'User', name: 'author()', template: 'adminUserCell' }
		# 	]
		# Comments:
		# 	color: 'green'
		# 	icon: 'comments'
		# 	extraFields: ['doc', 'owner']
		# 	tableColumns: [
		# 		{ label: 'Content', name: 'content' }
		# 		{ label: 'Post', name: 'docTitle()', template: 'adminPostCell' }
		# 		{ label: 'User', name: 'author()', template: 'adminUserCell' }
		# 	]
		# 	children: [
		# 		{
		# 			find: (comment) ->
		# 				Posts.find comment.doc, limit: 1
		# 		}
		# 		{
		# 			find: (comment) ->
		# 				Meteor.users.find comment.owner, limit: 1
		# 		}
		# 	]
		#
	collections:
		Apps:
			color: 'green'
			icon: ''
			label: '应用'
			extraFields: ['user', 'userType']
			tableColumns: [
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
		AppCategories:
			color: 'green'
			icon: ''
			label: '应用类别'
			extraFields: ['apps']
			tableColumns: [
				label: 'Name'
				name: 'name'
			,
				label: 'Label'
				name: 'label'
			,
				label: 'Apps'
				name: 'appNames()'
			]
		Links:
			color: 'green'
			icon: ''
			label: '友情链接'
			tableColumns: [
				{ label: '标题', name: 'label' }
				{ label: '地址', name: 'url' }
			]
		Wallpapers:
			color: 'green'
			icon: ''
			label: '桌面背景'
			tableColumns: [
				{ label: '标题', name: 'label' }
			]
	autoForm:
		omitFields: ['createdAt', 'updatedAt']
