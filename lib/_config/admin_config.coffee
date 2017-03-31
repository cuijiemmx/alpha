@AdminConfig =
	name: '用户管理'
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
			extraFields: ['user']
			tableColumns: [
				{ label: 'Active', name: 'active', template: 'adminAppsIsActive'}
				{ label: 'Name', name: 'name'}
				{ label: 'Client Id', name: 'clientId'}
				{ label: 'Client Secret', name: 'clientSecret'}
				{ label: 'Startup Url', name: 'redirectUri'}
			]
			insert: false
			edit: true
			delete: false
		Links:
			color: 'green'
			icon: ''
			label: '友情链接'
			tableColumns: [
				{ label: '标题', name: 'label' }
				{ label: '地址', name: 'url' }
			]
	autoForm:
		omitFields: ['createdAt', 'updatedAt']
