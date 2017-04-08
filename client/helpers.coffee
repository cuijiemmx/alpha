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

Template.registerHelper 'schoolName', ->
	SysSettings.findOne()?.schoolName

Template.registerHelper 'Config', ->
	Config

Template.registerHelper 'Schemas', ->
	Schemas

Template.registerHelper 'Utils', ->
  Utils

Template.registerHelper 'socialMedia', ->
  _.map Config.socialMedia, (obj)->
    obj

Template.registerHelper 'currentRoute', ->
  if Router and Router.current and Router.current()
    Router.current()

Template.registerHelper 'isRouteReady', ->
  Router and Router.current and Router.current() and Router.current()._waitlist._notReadyCount == 0

Template.registerHelper 'desktopImage', ->
	wid = Meteor.user()?.profile?.wallpaper
	if wid
		wallpaper = Wallpapers.findOne wid
		unless wallpaper?.image
			''
		else
			picture = Pictures.findOne wallpaper.image
			path = picture?.url
				store: 'images'
			"url(#{path})"

Template.registerHelper 'displayUsername', (username) ->
	username?.replace /^tid_|^aid_|^sid_|^pid_/, ''

Template.registerHelper 'userDisplayName', (_id) ->
	user
	unless _id
		user = Meteor.user()
	else
		user = Meteor.users.findOne _id
	user?.profile?.name or Blaze._globalHelpers.displayUsername(user?.username) or user?.emails[0]?.address or '我'
