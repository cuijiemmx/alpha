Template.contacts.events
	'click .m-contact-item': (e) ->
		$('#contactModal').modal('show')

	'click .contacts-folded': (e, instance) ->
		instance.expanded.set(true)
	'click .u-close': (e, instance) ->
		instance.expanded.set(false)

Template.contacts.helpers
	expanded: ->
		Template.instance().expanded.get()
	contactsState: ->
		if Template.instance().expanded.get()
			'contacts-expanded'
		else
			'contacts-folded'

Template.contacts.onCreated ->
	@expanded = new ReactiveVar(false)
