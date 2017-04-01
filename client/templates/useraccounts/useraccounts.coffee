Template['customAtTitle'].replaces('atTitle');
Template['customAtPwdForm'].replaces('atPwdForm');

Template.atTitle.helpers
	isSignIn: ->
		AccountsTemplates.getState() == "signIn"

Template.atPwdForm.helpers
	isSignIn: ->
		AccountsTemplates.getState() == "signIn"
