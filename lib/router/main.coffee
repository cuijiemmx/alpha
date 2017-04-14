Router.map ->
  @route "home",
    path: "/"
    onAfterAction: ->
    	if Meteor.isClient
    		SEO.set
    			title: '首页'

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

  @route "sysSettings",
    path: "/sysSettings"
    onAfterAction: ->
      SEO.set
        title: '平台设置'

  @route 'signOut',
    path: '/sign-out'
    onBeforeAction: ->
      Meteor.logout ->
      @redirect '/'
      @next()

  @route 'authorize',
  	path: '/oauth/authorize'

