Schemas.UserProfile = new SimpleSchema(

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
				collection: 'HeadImages'

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
		autoform:
			afFieldInput:
				type: "bootstrap-datetimepicker"
				dateTimePickerOptions:
					format: 'YYYY.MM.DD'
					pickTime: false

	mobile:
		type: String
		label: '手机号'
		min: 11
		max: 11
		unique: true
		optional: true

	wallpaper:
		type: String
		optional: true
		label: '桌面背景'
		autoform:
			options: ->
				Wallpapers.find().map (w) ->
					label: w.label
					value: w._id
			firstOption: '无'
		autoValue: ->
			if @isInsert
				SysSettings.findOne()?.defaultDesktopBackground
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
				Meteor.roles.find().map (r) ->
					label: r.label or r.name
					value: r.name

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
	headImageUrl: ->
		path
		if @profile?.picture?
			path = (HeadImages.findOne @profile.picture).url()
		else
			path = '/images/default_user_head.png'
		Meteor.absoluteUrl path
