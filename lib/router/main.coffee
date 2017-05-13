Router.map ->
  @route "home",
    path: "/"

  @route "profile",
    path: "/profile"

  @route "account",
    path: "/account"

  @route "personalize",
    path: "/personalize"

  @route "sysSettings",
    path: "/sysSettings"

  @route "myApps",
    path: "/myApps"

  @route 'signOut',
    path: '/sign-out'
    onBeforeAction: ->
      Meteor.logout ->
      @redirect '/'
      @next()

  @route 'authorize',
  	path: '/oauth/authorize'

