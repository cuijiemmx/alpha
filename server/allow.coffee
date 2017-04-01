Pictures.allow
	insert: (userId, doc) ->
		true
	update: (userId, doc, fieldNames, modifier) ->
		true
	download: (userId)->
		true

Meteor.users.allow
	update: (userId, doc, fieldNames, modifier) ->
		true
		# if userId == doc._id and not doc.username and fieldNames.length == 1 and fieldNames[0] == 'username'
		# 	true
		# else
		# 	false

Meteor.roles.allow
	insert: (userId, doc) ->
		true
	update: (userId, doc, fields, modifier) ->
		true
	remove: (userId, doc) ->
		true

