@subs = new SubsManager()

Router.configure
  layoutTemplate: "masterLayout"
  loadingTemplate: "loading"
  notFoundTemplate: "notFound"
  routeControllerNameConverter: "camelCase"

  onBeforeAction: ->
  	# Redirect to set username if required
    if Config.username and Meteor.userId() and not Meteor.user().username
      @redirect '/setUserName'
    @next()

  onAfterAction: ->
	  if Meteor.isClient
	    window.scrollTo(0,0)

	    if Router.current().route.path().split('/')[1] == 'admin'
	      SEO.set
	        title: '帐户管理'

	    # Remove modal
	    $bd = $('.modal-backdrop')
	    $bd.removeClass('in')
	    setTimeout ->
	      $bd.remove()
	    , 300

Router.waitOn ->
  subs.subscribe 'user'

# Router.onAfterAction onAfterAction

#To allow non-logged in users to access more routes, add it in the _config.coffee file
publicRoutes = _.union Config.publicRoutes || [], [
	#'home',
  'atSignIn'
  'atSignUp'
  'atForgotPassword'
  'atSignOut'
]

Router.plugin 'ensureSignedIn', except: publicRoutes
