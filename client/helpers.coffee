Template.registerHelper 'imageSrc', (pathOrId) ->
	if pathOrId?
		if pathOrId.indexOf('/') > -1
			pathOrId
		else
			picture = Pictures.findOne pathOrId
			picture?.url({store: 'images'})

Template.registerHelper 'userHeadImageSrc', (_id) ->
	user = Meteor.users.findOne _id
	if user?.profile?.picture
		Blaze._globalHelpers.imageSrc user.profile.picture
	else
		'/images/default_user_head.png'

Template.registerHelper 'signInBackground', ->
	settings = SysSettings.findOne()
	if settings
		"url(#{Blaze._globalHelpers.imageSrc settings.signInBackground})"

Template.registerHelper 'isAdmin', ->
	Roles.userIsInRole Meteor.user()?._id, ['admin']

Template.registerHelper 'isTeacher', ->
	Meteor.user()?.profile?.type == 'teacher'
