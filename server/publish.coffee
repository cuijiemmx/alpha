Meteor.publishComposite 'user',
  find: ->
    Meteor.users.find _id: @userId
  children: [
    find: (user) ->
      HeadImages.find()
  ,
    find: (user) ->
      Meteor.users.find
        type: 'teacher'
        _id:
          $ne: @userId
  ,
  	find: (user) ->
  		Apps.find
  			user: @userId
  	children: [
  		find: (app) ->
  			AppIcons.find app.icon
  	]
  ]

Meteor.publish 'posts', ->
	Posts.find()

Meteor.publishComposite 'apps', ->
	find: ->
		unless @userId
			Apps.find(null)
		else
			user = Meteor.users.findOne @userId
			type = user.type or null
			roles = user.roles or []

			userTypesMatch =
				userTypes:
					$elemMatch:
						$eq: type

			userRolesMatch =
				$or: [
					userRoles:
						$exists: false
				,
					userRoles: []
				,
					userRoles:
						$elemMatch:
							$in:
								roles
				]

			if Roles.userIsInRole @userId, ['admin']
				Apps.find()
			else
				Apps.find userTypesMatch, userRolesMatch
	children: [
		find: (app) ->
			AppIcons.find app.icon
	]

Meteor.publish 'appCategories', ->
	AppCategories.find()

Meteor.publishComposite 'links', ->
  find: ->
    Links.find()
  children: [
    find: (link) ->
      _id = link.thumbnail or null
      Pictures.find _id
    ]

Meteor.publishComposite 'wallpapers', ->
	find: ->
		Wallpapers.find()
	children: [
		find: (wallpaper) ->
			_id = wallpaper.image or null
			Pictures.find _id
	]

Meteor.publishComposite 'sysSettings', ->
	find: ->
		SysSettings.find()
	children: [
		find: (sysSettings) ->
			_id = sysSettings.signInBackground or null
			Pictures.find _id
	,
		find: (sysSettings) ->
			if @userId and Roles.userIsInRole @userId, ['admin']
				InitFiles.find()
			else
				InitFiles.find(null)
	]

Meteor.publish 'roles', ->
	find: ->
		if @userId and Roles.userIsInRole @userId, ['admin']
			Roles.find()
		else
			Roles.find(null)

Meteor.publish 'users', ->
	Meteor.users.find {}, fields:
		username: 1
		'emails.address': 1
		type: 1
		roles: 1
		profile: 1
