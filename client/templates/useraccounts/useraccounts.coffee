Template['customAtTitle'].replaces('atTitle');
# Template['customAtPwdFormBtn'].replaces('atPwdFormBtn');
# Template['customAtTextInput'].replaces('atTextInput');
Template['customAtPwdForm'].replaces('atPwdForm');

Template.atTitle.helpers
	isSignIn: ->
		if AccountsTemplates.getState() == "signIn"
			true
		else
			false

Template.atPwdForm.helpers
	isSignIn: ->
		if AccountsTemplates.getState() == "signIn"
			true
		else
			false
