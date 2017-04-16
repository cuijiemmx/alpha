Template.adminApps.helpers
	buttonContent: ->
		if Session.get('admin_doc')
			'更新'
		else
			'添加'
