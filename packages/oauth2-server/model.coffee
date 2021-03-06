self = undefined

@Model = class Model
	constructor: (config={}) ->
		config.accessTokensCollectionName ?= 'oauth_access_tokens'
		config.refreshTokensCollectionName ?= 'oauth_refresh_tokens'
		config.clientsCollectionName ?= 'oauth_clients'
		config.authCodesCollectionName ?= 'oauth_auth_codes'

		self = @

		self.debug = config.debug
		self.AccessTokens = config.accessTokensCollection or new Meteor.Collection config.accessTokensCollectionName
		self.RefreshTokens = config.refreshTokensCollection or new Meteor.Collection config.refreshTokensCollectionName
		self.Clients = config.clientsCollection or new Meteor.Collection config.clientsCollectionName
		self.AuthCodes = config.authCodesCollection or new Meteor.Collection config.authCodesCollectionName

	getAccessToken: Meteor.bindEnvironment (bearerToken, callback) ->
		if self.debug is true
			console.log '[OAuth2Server]', 'in getAccessToken (bearerToken:', bearerToken, ')'

		try
			token = self.AccessTokens.findOne accessToken: bearerToken
			callback null, token
		catch e
			callback e


	getClient: Meteor.bindEnvironment (clientId, clientSecret, callback) ->
		if self.debug is true
			console.log '[OAuth2Server]', 'in getClient (clientId:', clientId, ', clientSecret:', clientSecret, ')'

		try
			if not clientSecret?
				client = self.Clients.findOne { clientId: clientId }
			else
				client = self.Clients.findOne { clientId: clientId, clientSecret: clientSecret }
			callback null, client
		catch e
			callback e


	grantTypeAllowed: (clientId, grantType, callback) ->
		if self.debug is true
			console.log '[OAuth2Server]', 'in grantTypeAllowed (clientId:', clientId, ', grantType:', grantType + ')'

		return callback(false, grantType in ['authorization_code', 'client_credentials', 'refresh_token'])


	saveAccessToken: Meteor.bindEnvironment (token, clientId, expires, user, callback) ->
		if self.debug is true
			console.log '[OAuth2Server]', 'in saveAccessToken (token:', token, ', clientId:', clientId, ', user:', user, ', expires:', expires, ')'

		try
			tokenId = self.AccessTokens.insert
				accessToken: token
				clientId: clientId
				userId: user.id
				expires: expires

			callback null, tokenId
		catch e
			callback e


	getAuthCode: Meteor.bindEnvironment (authCode, callback) ->
		if self.debug is true
			console.log '[OAuth2Server]', 'in getAuthCode (authCode: ' + authCode + ')'

		try
			code = self.AuthCodes.findOne authCode: authCode
			callback null, code
		catch e
			callback e


	saveAuthCode: Meteor.bindEnvironment (code, clientId, expires, user, callback) ->
		if self.debug is true
			console.log '[OAuth2Server]', 'in saveAuthCode (code:', code, ', clientId:', clientId, ', expires:', expires, ', user:', user, ')'

		try
			codeId = self.AuthCodes.upsert
				authCode: code
			,
				authCode: code
				clientId: clientId
				userId: user.id
				expires: expires

			callback null, codeId
		catch e
			callback e


	saveRefreshToken: Meteor.bindEnvironment (token, clientId, expires, user, callback) ->
		if self.debug is true
			console.log '[OAuth2Server]', 'in saveRefreshToken (token:', token, ', clientId:', clientId, ', user:', user, ', expires:', expires, ')'

		try
			tokenId = self.RefreshTokens.insert
				refreshToken: token
				clientId: clientId
				userId: user.id
				expires: expires

				callback null, tokenId
		catch e
			callback e


	getRefreshToken: Meteor.bindEnvironment (refreshToken, callback) ->
		if self.debug is true
			console.log '[OAuth2Server]', 'in getRefreshToken (refreshToken: ' + refreshToken + ')'

		try
			token = self.RefreshTokens.findOne refreshToken: refreshToken
			callback null, token
		catch e
			callback e


	getUserFromClient: Meteor.bindEnvironment (clientId, clientSecret, callback) ->
		if self.debug is true
			console.log '[OAuth2Server]', 'in getUserFromClient (clientId: ', clientId, ', clientSecret:', clientSecret, ')'

		try
			client = self.Clients.findOne { clientId: clientId, clientSecret: clientSecret }

			user =
				id: client.user

			callback null, user
		catch e
			callback e
