@Apps = new Meteor.Collection('apps')

Schemas.Apps = new SimpleSchema
	type:
		type: String
		allowedValues: ['system', '3rd-party']
	userType:
		type: String
		allowedValues: ['teacher', 'student', 'parent']
	userRoles:
		type: [String]
		optional: true
	icon:
		type: String
	label:
		type: String
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

Apps.attachSchema Schemas.Apps
