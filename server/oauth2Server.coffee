oauth2server = new OAuth2Server
  debug: false
  model:
    clientsCollection: Apps
  options:
    # accessTokenLifetime: null
    grants: ['authorization_code', 'refresh_token']

WebApp.rawConnectHandlers.use(oauth2server.app)

oauth2server.app.get '/api/users/me', oauth2server.oauth.authorise(), (req, res, next) ->
  user = Meteor.users.findOne(req.user.id)
  res.json user

