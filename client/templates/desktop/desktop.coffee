Template.desktop.helpers
	mruApps: () ->
		Meteor.user().profile?.mruApps.map (id) ->
			Apps.findOne id
