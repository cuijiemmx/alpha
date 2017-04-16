Template.registerHelper '_imageSrc', (pathOrId, collection, store) ->
	if pathOrId?
		if pathOrId.indexOf('/') > -1
			pathOrId
		else
			image = collection.findOne pathOrId
			image?.url({store: store})

Template.registerHelper 'imageSrc', (pathOrId) ->
	Blaze._globalHelpers._imageSrc pathOrId, Pictures, 'images'

Template.registerHelper 'appIconSrc', (pathOrId) ->
	Blaze._globalHelpers._imageSrc pathOrId, AppIcons, 'appIcons'

Template.registerHelper 'headImageSrc', (id) ->
	id ?= '/images/default_user_head.png'
	Blaze._globalHelpers._imageSrc id, HeadImages, 'headImages'

Template.registerHelper 'signInBackground', ->
	url = Blaze._globalHelpers.imageSrc SysSettings.findOne()?.signInBackground
	"url(#{url})"

Template.registerHelper 'isAdmin', ->
	Roles.userIsInRole Meteor.user()?._id, ['admin']

Template.registerHelper 'isTeacher', ->
	Meteor.user()?.type == 'teacher'

Template.registerHelper 'isApp', ->
	Meteor.user()?.type == 'app'

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
