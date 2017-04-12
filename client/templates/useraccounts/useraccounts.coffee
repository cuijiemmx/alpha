Template['customAtTitle'].replaces('atTitle');
Template['customAtPwdForm'].replaces('atPwdForm');

updateUsername = (e, instance) ->
	inputText = $('#at-field-username_and_email-dummy').val().trim()
	if inputText.indexOf('@') > -1
		realUsername = inputText
	else
		realUsername = $('select').val() + '_' + inputText
	instance.username.set realUsername

Template.atTitle.helpers
	isSignIn: ->
		AccountsTemplates.getState() == "signIn"

Template.atPwdForm.helpers
	isSignIn: ->
		AccountsTemplates.getState() == "signIn"
	username: ->
		Template.instance().username.get()

Template.atPwdForm.onCreated ->
	@username = new ReactiveVar()

Template.atPwdForm.events
	'input #at-field-username_and_email-dummy': (e, instance) ->
		updateUsername e, instance
	'change select': (e, instance) ->
		updateUsername e, instance

AutoForm.hooks
	'at-pwd-form':
		before:
			insert: (doc) ->
				console.log(doc)

T9n.setLanguage("zh-CN")
