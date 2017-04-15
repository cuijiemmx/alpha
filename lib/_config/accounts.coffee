# See https://github.com/meteor-useraccounts/core/blob/master/Guide.md

AccountsTemplates.configure

  # Behaviour
  confirmPassword: false
  enablePasswordChange: true
  forbidClientAccountCreation: false
  overrideLoginErrors: true
  sendVerificationEmail: false
  lowercaseUsername: false

  # Appearance
  hideSignUpLink: true
  showAddRemoveServices: true
  # showForgotPasswordLink: true
  showForgotPasswordLink: false
  showLabels: true
  showPlaceholders: true
  showResendVerificationEmailLink: false

  # Client-side Validation
  continuousValidation: false
  negativeFeedback: false
  negativeValidation: true
  positiveValidation: false
  positiveFeedback: true
  showValidating: true

  # Privacy Policy and Terms of Use
  # privacyUrl: Config.privacyUrl || null
  # termsUrl: Config.termsUrl || null

  # Redirects
  homeRoutePath: Config.homeRoute

  # Hooks
  onLogoutHook: ->
    # console.log 'logout'

  onSubmitHook: ->
    # console.log 'submitting form'

AccountsTemplates.configureRoute 'signIn'
AccountsTemplates.configureRoute 'signUp'
# AccountsTemplates.configureRoute 'forgotPwd'

AccountsTemplates.addFields [
  _id: 'username'
  type: 'text'
  displayName: 'username'
  required: true
  minLength: 5
,
  _id: 'type'
  type: 'select'
  displayName: '用户类型'
  select: [
    text: '老师'
    value: 'teacher'
  ,
    text: '学生'
    value: 'student'
  ,
    text: '家长'
    value: 'parent'
  ]
]
