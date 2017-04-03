# You'll want to replace these functions. They publish the whole
# collection which is problematic after your app grows

Meteor.publish 'posts', ->
	Posts.find()

Meteor.publish 'apps', ->
	unless @userId
		[]
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
			Pictures.find sysSettings.signInBackground
	]
