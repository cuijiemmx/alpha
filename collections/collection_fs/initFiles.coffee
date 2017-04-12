@InitFiles = new FS.Collection("InitFiles",
	stores: [
		new FS.Store.GridFS 'files', transformWrite: (fileObj, readStream, writeStream) =>
			# console.log readStream
			content = ''
			readStream.on 'data', (chunk) =>
				content += chunk.toString()
			
			readStream.on 'end', Meteor.bindEnvironment(() =>
				console.log content
				start = content.indexOf('\n') + 1
				stop = content.lastIndexOf('\n')
				content = content.substr(start, stop - start)
				content.split('\n').forEach (line) =>
					nameEmailGender = line.split(',')
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

			readStream.pipe writeStream
	],
	filter:
		allow:
			contentTypes: ['text/csv']
			extensions: ['csv']
)

# @InitFiles.on("stored", (fileObj, s) => 
# 	console.log fileObj
# 	# console.log s
# )

# @InitFiles.on('data', (chunk) =>
# 	console.log chunk
# )
