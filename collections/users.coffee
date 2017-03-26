Schemas.UserProfile = new SimpleSchema(

  picture:
    type: String
    optional:true
    label: 'Profile picture'
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'ProfilePictures'

  name:
    type: String
    optional: true

  birthday:
    type: Date
    optional: true

  # bio:
  #   type: String
  #   optional: true
  #   autoform:
  #     rows: 4

  # location:
  #   type: String
  #   optional: true
  #   autoform:
  #     type: 'map'
  #     geolocation: true
  #     searchBox: true
  #     autolocate: true

  # country:
  #   type: String
  #   label: 'Nationality'
  #   allowedValues: Utils.countryList
  #   optional: true
)

Schemas.User = new SimpleSchema(

  username:
    type: String
    min: 2
    max: 50

  emails:
    type: [Object]
    optional: true

  "emails.$.address":
    type: String
    regEx: SimpleSchema.RegEx.Email
    label: 'Email'

  "emails.$.verified":
    type: Boolean

  profile:
    type: Schemas.UserProfile
    optional: true

  services:
    type: Object
    optional: true
    blackbox: true

  roles:
    type: [String]
    blackbox: true
    optional: true
    autoform:
      type: "select-checkbox-inline",
      options: ->
        admin: 'Admin'
        teacher: 'Teacher'
)

Meteor.users.attachSchema Schemas.User

# Export schemas
@StarterSchemas = Schemas

Meteor.users.helpers
  hasRole: (role) ->
    @roles?.indexOf(role) > -1
