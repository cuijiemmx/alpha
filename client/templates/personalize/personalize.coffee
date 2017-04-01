AutoForm.hooks accountUpdateWallpaper:
	onSuccess: (operation, result, template) ->
		sAlert.success '更换桌面成功'
	onError: (operation, error, template) ->
		sAlert.error error
