@InitFiles = new FS.Collection("InitFiles",
	stores: [
		new FS.Store.GridFS 'files', transformWrite: (fileObj, readStream, writeStream) =>
			# console.log readStream
			content = ''
			readStream.on 'data', (chunk) =>
				content += chunk.toString()
			
			readStream.on 'end', Meteor.bindEnvironment(() =>
				console.log '[ImportUsers] Begin'
				console.log content

				if areTeachers content
					importTeachers content
				else
					importStudentsAndParents content

				console.log '[ImportUsers] End'
			)

			readStream.pipe writeStream
	],
	filter:
		allow:
			contentTypes: ['text/csv']
			extensions: ['csv']
)

areTeachers = (content) =>
	(content.indexOf '学号') == -1

importTeachers = (content) =>
	console.log 'Importing teachers'
	start = content.indexOf('\n') + 1
	stop = content.lastIndexOf('\n')
	content = content.substr(start, stop - start)
	content.split('\n').forEach (line) =>
		nameEmailGender = line.split(',')
		name = nameEmailGender[0].trim()
		email = nameEmailGender[1].trim()
		gender = nameEmailGender[2].trim()
		# console.log name, email, gender
		try
			Accounts.createUser(
				email: email
				username: name
				password: '12345678'
				profile:
					type: 'teacher'
			)
			console.log(email + "   created successfully.")
		catch e
			console.log(email + "   " + e)	

importStudentsAndParents = (content) =>
	console.log 'Importing students and parents'
	start = content.indexOf('\n') + 1
	stop = content.lastIndexOf('\n')
	content = content.substr(start, stop - start)
	content.split('\n').forEach (line) =>
		nameIdGender = line.split(',')
		name = nameIdGender[0].trim()
		id = nameIdGender[1].trim()
		gender = nameIdGender[2].trim()
		# console.log name, id, gender
		# import students
		try
			Accounts.createUser(
				username: id
				password: '12345678'
				profile:
					type: 'student'
					name: name
			)
			console.log(id + "   created successfully.")
		catch e
			console.log(id + "   " + e)

		# import parents
		try
			Accounts.createUser(
				username: id
				password: '12345678'
				profile:
					type: 'parent'
					name: name
			)
			console.log(id + "   created successfully.")
		catch e
			console.log(id + "   " + e)