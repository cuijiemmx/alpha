# You'll want to replace these functions. They publish the whole
# collection which is problematic after your app grows

Meteor.publish 'posts', ->
	Posts.find()

Meteor.publish 'attachments', ->
	Attachments.find()

Meteor.publish 'apps', ->
	Apps.find()

Meteor.publish 'appCategories', ->
	AppCategories.find()

Meteor.publishComposite 'links', ->
  find: ->
    Links.find()
  children: [
    find: (link) ->
      _id = link.thumbnail or null
      Pictures.find _id: _id
    ]
