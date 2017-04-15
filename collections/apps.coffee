@Apps = new Meteor.Collection('apps')

Schemas.Apps = new SimpleSchema
	type:
		type: String
		allowedValues: ['system', '3rd-party']
		autoform:
			options:
				system: '系统'
				'3rd-party': '第三方'
			firstOption: '(请选择)'
	userType:
		type: String
		allowedValues: ['teacher', 'student', 'parent']
		autoform:
			options:
				teacher: '老师'
				student: '学生'
				parent: '家长'
			firstOption: '(请选择)'
	userRoles:
		type: [String]
		label: '用户角色'
		optional: true
	icon:
		type: String
		label: '图标'
	label:
		type: String
		label: '名称'
	startupUri:
		type: String
	clientId:
		type: String
	clientSecret:
		type: String
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
	# user:
	# 	type: String
	# 	regEx: SimpleSchema.RegEx.Id
	# 	optional: true
	# 	custom: ->
 #      if @field('type').value == '3rd-party'
 #        # inserts
 #        if !@operator
 #          if !@isSet or !@value
 #          	return "required"
 #        # updates
 #        else if @isSet
 #          if @operator == "$set" and !@value
 #          	return "required"
 #          if @operator == "$unset"
 #          	return "required"
 #          if @operator == "$rename"
 #          	return "required"

Apps.attachSchema Schemas.Apps
