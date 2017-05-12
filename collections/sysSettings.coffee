@SysSettings = new Meteor.Collection 'sysSettings'

Schemas.SysSettings = new SimpleSchema
	schoolName:
		type: String
		label: '校名'
		optional: true
	signInBackground:
		type: String
		label: '登录页背景'
		optional: true
		autoform:
			options: ->
				Wallpapers.find().map (w) ->
					label: w.label
					value: w._id
			firstOption: '无'
	defaultDesktopBackground:
		type: String
		label: '默认桌面壁纸'
		optional: true
		autoform:
			options: ->
				Wallpapers.find().map (w) ->
					label: w.label
					value: w._id
			firstOption: '无'
	showLabsFeature:
		type: Boolean
		label: '显示实验功能'
		defaultValue: false


SysSettings.attachSchema Schemas.SysSettings
