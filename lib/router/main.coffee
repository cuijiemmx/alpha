Router.map ->
  @route "home",
    path: "/"
    onAfterAction: ->
    	if Meteor.isClient
    		SEO.set
    			title: '首页'

  # @route "dashboard",
  #   path: "/dashboard"
  #   waitOn: ->
  #     [
  #       subs.subscribe 'posts'
  #       subs.subscribe 'comments'
  #       subs.subscribe 'attachments'
  #     ]
  #   data: ->
  #     posts: Posts.find({},{sort: {createdAt: -1}}).fetch()

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
