Meteor.startup ->
	if Meteor.isClient
		Config.defaultLanguage ?= 'en'
		TAPi18n.setLanguage(Config.defaultLanguage).done ->
			$.extend true, $.fn.dataTable.defaults,
				language:
					paginate:
						first: TAPi18n.__('paginate_first')
						last: TAPi18n.__('paginate_last')
						next: TAPi18n.__('paginate_next')
						previous: TAPi18n.__('paginate_previous')
