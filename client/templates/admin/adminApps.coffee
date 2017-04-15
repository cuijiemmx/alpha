Template.adminApps.helpers
	formId: ->
		if Session.get('admin_doc')
			'admin_update'
		else
			'admin_insert'
	buttonContent: ->
		if Session.get('admin_doc')
			'更新'
		else
			'添加'
