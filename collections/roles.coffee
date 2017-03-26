Schemas.Role = new SimpleSchema(
	name:
		type: String
		unique: true
)

Meteor.roles.attachSchema Schemas.Role
