oauth2server = new OAuth2Server
  model:
    clientsCollection: Apps
  options:
    accessTokenLifetime: null
    grants: ['authorization_code', 'refresh_token']
    debug: true

WebApp.connectHandlers.use(oauth2server.app)

# oauth2server.routes.get('/account', oauth2server.oauth.authorise(), function(req, res, next) {
#   var user = Meteor.users.findOne(req.user.id);

#   res.send({
#     id: user._id
#   });
# });
