Meteor.methods
	initWithFile: (id) ->
		# console.log id
		initFile = InitFiles.findOne({_id: id})
		readStream = initFile.createReadStream()
		readStream.on('data', Meteor.bindEnvironment((chunk) =>
			content = chunk.toString()
			start = content.indexOf('\n') + 1
			stop = content.lastIndexOf('\n')
			content = content.substr(start, stop - start)
			# console.log content
			content.split('\n').forEach((line) =>
				nameEmailGender = line.split(',')
				# console.log nameEmailGender
				name = nameEmailGender[0].trim()
				email = nameEmailGender[1].trim()
				gender = nameEmailGender[2].trim()
				console.log name, email, gender
				try
					Accounts.createUser({
						email: email
						password: '12345678'
						username: name
						profile: {
							type: 'teacher'
						}
					})
					console.log(email + "   created successfully.")
				catch e
					console.log(email + "   " + e)
			)
		)
		)