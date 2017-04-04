Template.sysSettings.helpers
	sysSettings: ->
		SysSettings.findOne()

AutoForm.hooks
	sysSettingsForm:
		onSuccess: (operation, result, template) ->
			sAlert.success '设置保存成功'
		onError: (operation, error, template) ->
			sAlert.error error
