AutoForm.hooks accountUpdateAccount:
	onSuccess: (operation, result, template) ->
		sAlert.success '帐号更改成功'
	onError: (operation, error, template) ->
		sAlert.error error

AutoForm.hooks accountUpdatePassword:
	onSubmit: (insertDoc, updateDoc, currentDoc) ->
		if insertDoc.new != insertDoc.confirm
			sAlert.error '密码不一致'
			@done()
		else
			Accounts.changePassword insertDoc.old, insertDoc.new, (e)->
				$('.btn-primary').attr('disabled',null)
				if e
					sAlert.error e.message
					@done(e)
				else
					sAlert.success '密码更改成功'
					@done()
		false

