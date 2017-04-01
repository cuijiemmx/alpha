AutoForm.hooks
	accountUpdateProfile:
		onSuccess: (operation, result, template) ->
			sAlert.success '个人资料更改成功'
		onError: (operation, error, template) ->
			sAlert.error error
