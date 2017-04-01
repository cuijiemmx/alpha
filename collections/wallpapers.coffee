@Wallpapers = new Meteor.Collection 'Wallpapers'

Schemas.Wallpapers = new SimpleSchema
	label:
		type: String
		label: '标题'
	image:
		type: String
		label: '图片'
		optional: true
		autoform:
      afFieldInput:
        label: '选择图片'
        type: 'fileUpload'
        collection: 'Pictures'

Wallpapers.attachSchema Schemas.Wallpapers
