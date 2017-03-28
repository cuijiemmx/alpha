@Apps = new Meteor.Collection('apps')

Schemas.Apps = new SimpleSchema
	active:
		type: Boolean
		defaultValue: true
	clientId:
		type: String
	clientSecret:
		type: String
	name:
		type: String
		min: 2
		max: 50
	redirectUri:
		type: String
		regEx: SimpleSchema.RegEx.Url
	startupUri:
		type: String
		regEx: SimpleSchema.RegEx.Url
	user:
		type: String
		regEx: SimpleSchema.RegEx.Id

Apps.attachSchema Schemas.Apps
