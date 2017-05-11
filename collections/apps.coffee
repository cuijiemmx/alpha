@Apps = new Meteor.Collection('apps')

Schemas.Apps = new SimpleSchema
	type:
		type: String
		label: '应用类型'
		allowedValues: ['system', '3rd-party']
		defaultValue: '3rd-party'
		autoform:
			options:
				system: '系统'
				'3rd-party': '第三方'
			firstOption: '(请选择)'
	userTypes:
		type: [String]
		label: '用户类型'
		allowedValues: ['teacher', 'student', 'parent', 'app']
		autoform:
			type: "select-checkbox-inline"
			options:
				teacher: '老师'
				student: '学生'
				parent: '家长'
				app: '应用'
	userRoles:
		type: [String]
		label: '用户角色'
		optional: true
		autoform:
      type: "select-checkbox-inline"
      options: ->
        Meteor.roles.find().map (r) ->
        	label: r.label or r.name
        	value: r.name
	icon:
		type: String
		label: '图标'
		autoform:
			afFieldInput:
				label: '选择图片'
				removeLabel: '删除'
				type: 'fileUpload'
				collection: 'AppIcons'
	label:
		type: String
		label: '应用名'
	startupUri:
		type: String
	clientId:
		type: String
	clientSecret:
		type: String
		optional: true
		autoValue: ->
			if @isInsert
				Random.secret()
		custom: ->
			if @field('type').value == '3rd-party'
				# inserts
				if !@operator
					if !@isSet or !@value
						return "required"
				# updates
				else if @isSet
					if @operator == "$set" and !@value
						return "required"
					if @operator == "$unset"
						return "required"
					if @operator == "$rename"
						return "required"
	redirectUri:
		type: String
		# regEx: SimpleSchema.RegEx.Url
		optional: true
		custom: ->
			if @field('type').value == '3rd-party'
				# inserts
				if !@operator
					if !@isSet or !@value
						return "required"
				# updates
				else if @isSet
					if @operator == "$set" and !@value
						return "required"
					if @operator == "$unset"
						return "required"
					if @operator == "$rename"
						return "required"
	user:
		type: String
		regEx: SimpleSchema.RegEx.Id
		optional: true
		custom: ->
			if @field('type').value == '3rd-party'
				# inserts
				if !@operator
					if !@isSet or !@value
						return "required"
				# updates
				else if @isSet
					if @operator == "$set" and !@value
						return "required"
					if @operator == "$unset"
						return "required"
					if @operator == "$rename"
						return "required"

	online:
		type: Boolean
		defaultValue: false
		label: '上线中'

	openInNewTab:
		type: Boolean
		defaultValue: true
		label: '在新tab中打开'

Apps.attachSchema Schemas.Apps

Apps.helpers
	userTypesNames: ->
		@userTypes?.map (ut) ->
			if ut is 'teacher'
				'老师'
			else if ut is 'student'
				'学生'
			else if ut is 'parent'
				'家长'
			else
				'应用'
	onlineStatus: ->
		if @online
			'是'
		else
			'否'
