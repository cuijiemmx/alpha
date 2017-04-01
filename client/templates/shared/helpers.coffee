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

Template.registerHelper 'userDisplayName', ->
	user = Meteor.user()
	user?.profile?.name or user?.username or user?.emails[0]?.address or '我'
