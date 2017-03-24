Router.map ->
  @route "profile",
    path: "/profile"
    onAfterAction: ->
      SEO.set
        title: '个人资料'

  @route "account",
    path: "/account"
    onAfterAction: ->
      SEO.set
        title: '帐户'

  @route "setUserName",
    path: "/setUserName"
    onBeforeAction: ->
      if not Config.username or (Meteor.userId() and Meteor.user().username)
        @redirect '/dashboard'
      @next()

  @route 'signOut',
    path: '/sign-out'
    onBeforeAction: ->
      Meteor.logout ->
      @redirect '/'
      @next()
