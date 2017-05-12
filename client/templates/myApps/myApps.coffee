AutoForm.hooks
	myAppForm:
		onSubmit: (insertDoc, updateDoc, currentDoc) ->
			self = @
			unless currentDoc
				Schemas.Apps.clean(insertDoc)
				insertDoc.user = Meteor.userId()
				Meteor.call 'insertApp', insertDoc, (e) ->
					if e
						self.done(e)
					else
						self.done(null, 'insert')
				false
			else
				updateDoc.$set.user = Meteor.userId()
				Schemas.Apps.clean(updateDoc.$set)
				Meteor.call 'updateApp', updateDoc, currentDoc._id, (e) ->
					if e
						self.done(e)
					else
						self.done(null, 'update')
				false
		onSuccess: (formType, result) ->
			@template.parent().editing.set false
			if result is 'insert'
				sAlert.success '应用创建成功'
			else
				sAlert.success '配置保存成功'
		onError: (formType, error) ->
			sAlert.error error.message

Template.myApps.onCreated ->
	@editingApp = new ReactiveVar(null)
	@editing = new ReactiveVar(false)
	@apps = Apps.find
		user: Meteor.userId()

Template.myApps.helpers
	apps: ->
		Template.instance().apps
	editing: ->
		Template.instance().editing.get()
	editingApp: ->
		Template.instance().editingApp.get()
	buttonText: ->
		if Template.instance().editingApp.get()
			'保存'
		else
			'创建'
	schema: ->
		Apps.simpleSchema().pick ['label', 'icon', 'userTypes', 'userTypes.$', 'userRoles', 'userRoles.$', 'clientId', 'clientSecret', 'startupUri', 'redirectUri']

Template.myApps.events
	'click .my-app-add': (e, instance) ->
		instance.editingApp.set null
		instance.editing.set true

	'click .u-config': (e, instance) ->
		index = $(e.currentTarget).data('index')
		instance.editingApp.set instance.apps.fetch()[index]
		instance.editing.set true

	'click .u-cancel': (e, instance) ->
		instance.editingApp.set null
		instance.editing.set false

	'click .u-del': (e, instance) ->
		index = $(e.currentTarget).data('index')
		Meteor.call 'removeApp', instance.apps.fetch()[index]._id, (e) ->
			if e
				sAlert.error e.message
			else
				sAlert.error '删除成功'
