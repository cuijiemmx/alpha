Template.sysSettings.onCreated ->
	@sysSettings = SysSettings.findOne()

Template.sysSettings.helpers
	sysSettings: ->
		Template.instance().sysSettings

AutoForm.hooks
	sysSettingsForm:
		onSuccess: (operation, result, template) ->
			sAlert.success '设置保存成功'
		onError: (operation, error, template) ->
			sAlert.error error
