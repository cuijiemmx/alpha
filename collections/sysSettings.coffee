@SysSettings = new Meteor.Collection 'sysSettings'

Schemas.SysSettings = new SimpleSchema
	schoolName:
		type: String
		label: '校名'
		optional: true
	signInBackground:
		type: String
		label: '登录页背景图'
		optional: true
		autoform:
      afFieldInput:
        label: '选择图片'
        removeLabel: '删除'
        type: 'fileUpload'
        collection: 'Pictures'

SysSettings.attachSchema Schemas.SysSettings
