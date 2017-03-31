@AppCategories = new Meteor.Collection('appCategories')

Schemas.AppCategories = new SimpleSchema
	name:
		type: String
	label:
		type: String
	icon:
		type: String
	apps:
		type: [String]
		optional: true
		autoform:
			options: ->
				Apps.find().fetch().map (app) ->
					label: app.label
					value: app.name

AppCategories.attachSchema Schemas.AppCategories
