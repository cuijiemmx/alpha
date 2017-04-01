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
        title: '帐户设置'

  @route "personalize",
    path: "/personalize"
    onAfterAction: ->
      SEO.set
        title: '个性化'

  # @route "setUserName",
  #   path: "/setUserName"
  #   onBeforeAction: ->
  #     if not Config.username or (Meteor.userId() and Meteor.user().username)
  #       @redirect '/'
  #     @next()

  @route 'signOut',
    path: '/sign-out'
    onBeforeAction: ->
      Meteor.logout ->
      @redirect '/'
      @next()
