# Template.navbar.events
#   'change #sliding-menu-controller': (e) ->
#     $('body')[ if e.currentTarget.checked then 'addClass' else 'removeClass' ] 'no-overflow'

#   'click .sliding-menu a': () ->
#     $('#sliding-menu-controller').prop 'checked', false

Template.navbar.helpers
	dateTime: ->
		Template.instance().clock.get()

currentDatetime = ->
	moment().format('LL h:mm:ss a')

Template.navbar.onCreated ->
	@clock = new ReactiveVar(currentDatetime())
	self = @
	Meteor.setInterval ->
		self.clock.set currentDatetime()
	, 1000
