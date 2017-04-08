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
					value: app.clientId

AppCategories.attachSchema Schemas.AppCategories

AppCategories.helpers
	appNames: ->
		apps = Apps.find
			clientId:
				$in: @apps or []
		labels = apps.fetch().map (app) ->
			app.label
		labels.join ','


