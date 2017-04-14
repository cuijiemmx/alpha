Template.authorize.helpers
	params: ->
		_.extend Router.current().params.query, {token: localStorage.getItem('Meteor.loginToken')}

Template.authorize.onRendered ->
	$('#authorize-form')[0].submit()

