Template.sysSettings.helpers
	formType: ->
		if SysSettings.findOne()
			'update'
		else
			'insert'
	sysSettings: ->
		SysSettings.findOne()
	wallpapers: ->
		console.log Wallpapers.find()
		Wallpapers.find()

AutoForm.hooks
	sysSettingsForm:
		onSuccess: (operation, result, template) ->
			sAlert.success '设置保存成功'
		onError: (operation, error, template) ->
			sAlert.error error

Template.sysSettings.events
	'change #init-file': (e, instance) ->
		file = e.target.files[0]

		if file
			InitFiles.insert file, (err, fileObj) ->
				if err
					sAlert.error err.message
				else
					Meteor.call 'initWithFile', fileObj._id, (err, res) ->
						if err
							sAlert.error err.message
						else
							sAlert.success '导入成功'
