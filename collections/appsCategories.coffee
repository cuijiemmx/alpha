@AppCategories = new Meteor.Collection('appCategories')

Schemas.AppCategories = new SimpleSchema
	name:
		type: String
		unique: true
	label:
		type: String
		label: '标题'
		unique: true
	icon:
		type: String
		label: '图标'
	apps:
		type: [String]
		optional: true
		label: '应用'
		autoform:
			options: ->
				Apps.find().fetch().map (app) ->
					label: app.label
					value: app.clientId

Meteor.startup ->
	Schemas.AppCategories.i18n 'schemas.appCategories'
	AppCategories.attachSchema Schemas.AppCategories

AppCategories.helpers
	appNames: ->
		apps = Apps.find
			clientId:
				$in: @apps or []
		labels = apps.fetch().map (app) ->
			app.label
		labels.join ','


