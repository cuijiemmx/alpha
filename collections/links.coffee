@Links = new Meteor.Collection 'links'

Schemas.Links = new SimpleSchema
	label:
		type: String
		label: '标题'
	url:
		type: String
		label: '地址'
		regEx: SimpleSchema.RegEx.Url
	thumbnail:
		type: String
		label: '缩略图'
		optional: true
		autoform:
      afFieldInput:
        label: '选择图片'
        type: 'fileUpload'
        collection: 'Pictures'

Links.attachSchema Schemas.Links
