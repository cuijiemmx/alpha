Meteor.publishComposite 'user', ->
  find: ->
    Meteor.users.find _id: @userId
  children: [
    find: (user) ->
      _id = user.profile?.picture or null
      Pictures.find _id: _id
    ]
