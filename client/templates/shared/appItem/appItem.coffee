Template.appItem.events
	'click a': (e, instance) ->
		appId = $(e.currentTarget).data('aid')
		mruApps = Meteor.user().profile?.mruApps or []
		mruApps = _.filter mruApps, (_id) ->
			_id != appId
		mruApps.splice 0, 0, appId
		# console.log "most recently used applications: #{mruApps}"
		Meteor.users.update
			_id: Meteor.user()._id
		,
			$set:
				'profile.mruApps': mruApps

Template.appItem.helpers
	openTarget: ->
		if Template.instance().data.openInNewTab
			'_blank'
		else
			null
