Template.contacts.events
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

Template.contactsExpanded.onCreated ->
	@selectedContact = new ReactiveVar()
	@contacts = new ReactiveVar Meteor.users.find
		_id:
				$ne: Meteor.userId()

Template.contactsExpanded.helpers
	contacts: ->
		Template.instance().contacts.get()
	selectedContact: ->
		Template.instance().selectedContact.get()

Template.contactsExpanded.events
	'click .m-contact-item': (e, instance) ->
		uid = $(e.currentTarget).data('uid')
		instance.selectedContact.set(Meteor.users.findOne uid)
		$('#contact-modal').modal('show')
	'input input': (e, instance) ->
		filter = $(e.currentTarget).val().trim()
		regFilter =
			$regex: "#{filter}"
			$options: 'i'
		instance.contacts.set Meteor.users.find
			$and: [
				_id:
					$ne: Meteor.userId()
			,
				$or: [
					username: regFilter
				,
					'profile.name': regFilter
				,
					emails:
						$elemMatch:
							address: regFilter
				]
			]

Template.contactModalTemplate.helpers
	userEmail: (user) ->
		user?.emails?[0]?.address
