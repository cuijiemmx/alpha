Meteor.publishComposite 'user',
  find: ->
    Meteor.users.find _id: @userId
  children: [
    find: (user) ->
      # _id = user.profile?.picture or null
      # Pictures.find _id: _id
      Pictures.find()
  ,
    find: (user) ->
      Meteor.users.find
        'profile.type': 'teacher'
        _id:
          $ne: @userId
  ]

Meteor.publish 'posts', ->
	Posts.find()

Meteor.publish 'apps', ->
	unless @userId
		Apps.find(null)
	else
		user = Meteor.users.findOne @userId
		type = user.profile?.type or null
		roles = user.roles or []
		Apps.find
			userType: type
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

Meteor.publish 'users', ->
	Meteor.users.find {}, fields:
		username: 1
		'emails.address': 1
		roles: 1
		profile: 1

