AutoForm.hooks
	accountUpdateProfile:
		onSubmit: (insertDoc, updateDoc, currentDoc) ->
			self = @
			Meteor.call 'Users.methods.updateProfile', insertDoc, (e) ->
				self.done(e)
			false
		onSuccess: (formType, result) ->
			sAlert.success '个人资料更改成功'
		# onError: (formType, error) ->
		# 	sAlert.error error.message
