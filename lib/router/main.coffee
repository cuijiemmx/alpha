Router.map ->
  @route "home",
    path: "/"
    onAfterAction: ->
    	if Meteor.isClient
    		SEO.set
    			title: '首页'

  @route "dashboard",
    path: "/dashboard"
    waitOn: ->
      [
        subs.subscribe 'posts'
        subs.subscribe 'comments'
        subs.subscribe 'attachments'
      ]
    data: ->
      posts: Posts.find({},{sort: {createdAt: -1}}).fetch()
