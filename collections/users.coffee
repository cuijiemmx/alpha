Schemas.UserProfile = new SimpleSchema(

	# type:
 #  	type: String
 #  	label: '用户类型'
 #  	allowedValues: ['app', 'teacher', 'student', 'parent']
 #  	autoform:
 #  		options:
 #  			teacher: '老师'
 #  			student: '学生'
 #  			parent: '家长'
 #  		firstOption: '(请选择)'

  parents:
  	type: [String]
  	label: '家长'
  	optional: true
  	autoform:
  		options: ->
  			Meteor.users.find({type: 'parent'}).map (i) ->
  				label: "#{i.profile.name} (#{i.profile.mobile})"
  				value: i._id

  picture:
    type: String
    label: '头像'
    optional: true
    autoform:
      afFieldInput:
        label: '选择图片'
        removeLabel: '删除'
        type: 'fileUpload'
        collection: 'Pictures'

  name:
    type: String
    label: '姓名'
    optional: true

  gender:
  	type: String
  	label: '性别'
  	optional: true
  	allowedValues: ['male', 'female']
  	autoform:
  		type: 'select-radio-inline'
  		options:
  			male: '男'
  			female: '女'
  		firstOption: '(请选择)'

  birthday:
    type: Date
    label: '生日'
    optional: true

  mobile:
  	type: String
  	label: '手机号'
  	min: 11
  	max: 11
  	optional: true
  	custom: ->
      if @field('roles')?.value and 'admin' not in @field('roles')?.value and @field('type')?.value == 'teacher'
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
  wallpaper:
  	type: String
  	optional: true
  	label: '桌面背景'
  	autoform:
  		options: ->
  			Wallpapers.find().map (w) ->
  				label: w.label
  				value: w._id
  		firstOption: '(请选择)'
  mruApps:
  	type: [String]
  	optional: true
)

Schemas.User = new SimpleSchema
  username:
    type: String
    label: '用户名'
    min: 2
    max: 50

  emails:
    type: [Object]
    optional: true

  "emails.$.address":
    type: String
    regEx: SimpleSchema.RegEx.Email
    label: '邮箱'
   	optional: true

  "emails.$.verified":
    type: Boolean
    label: '邮箱已验证'
    optional: true

  type:
  	type: String
  	label: '用户类型'
  	allowedValues: ['app', 'teacher', 'student', 'parent']
  	autoform:
  		options:
  			app: '应用'
  			teacher: '老师'
  			student: '学生'
  			parent: '家长'
  		firstOption: '(请选择)'

  profile:
    type: Schemas.UserProfile
    label: '个人资料'
    optional: true

  services:
    type: Object
    optional: true
    blackbox: true

  roles:
    type: [String]
    blackbox: true
    optional: true
    label: '角色'
    autoform:
      type: "select-checkbox-inline"
      options: ->
        admin: '管理员'

  createdAt:
	  type: Date
	  autoValue: ->
		  if this.isInsert
			  new Date()

Meteor.users.attachSchema Schemas.User

# Export schemas
@StarterSchemas = Schemas

Meteor.users.helpers
  hasRole: (role) ->
    @roles?.indexOf(role) > -1
