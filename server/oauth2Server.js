var oauth2server = new OAuth2Server({
  model: {
    clientsCollection: Apps,
  },
  options: {
    accessTokenLifetime: null,
    grants: ['authorization_code', 'client_credentials'],
    debug: true
  }
});

// Add the express routes of OAuth before the Meteor routes
WebApp.connectHandlers.use(oauth2server.app);

// Add a route to return account information
// oauth2server.routes.get('/account', oauth2server.oauth.authorise(), function(req, res, next) {
//   var user = Meteor.users.findOne(req.user.id);

//   res.send({
//     id: user._id
//   });
// });
