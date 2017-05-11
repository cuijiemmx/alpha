Template.desktop.helpers
	mruApps: () ->
		mruApps = Meteor.user().profile?.mruApps or []
		mruApps.map (id) ->
			Apps.findOne id
		.filter (app) ->
			app
