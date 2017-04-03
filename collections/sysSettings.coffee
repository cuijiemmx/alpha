@SysSettings = new Meteor.Collection 'sysSettings'

Schemas.SysSettings = new SimpleSchema
	signInBackground:
		type: String
		label: '登录页背景图'
		optional: true
		autoform:
      afFieldInput:
        label: '选择图片'
        type: 'fileUpload'
        collection: 'Pictures'

SysSettings.attachSchema Schemas.SysSettings
