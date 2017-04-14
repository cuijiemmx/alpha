Package.describe({
	name: 'oauth2-server',
	version: '2.0.0',
	summary: 'OAuth 2 Server package',
	git: 'https://github.com/RocketChat/rocketchat-oauth2-server.git'
});

Package.onUse(function(api) {
	api.versionsFrom('1.0');

	api.use('coffeescript');

	api.addFiles('model.coffee', 'server');
	api.addFiles('oauth.coffee', 'server');

	api.export('OAuth2Server');
});

Npm.depends({
	"oauth2-server": "2.4.1",
	"body-parser": "1.17.1",
	"express": "4.13.3"
});

Package.onTest(function(api) {

});
