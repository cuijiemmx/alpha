@InitFiles = new FS.Collection("InitFiles",
	stores: [
		new FS.Store.GridFS 'files', transformWrite: (fileObj, readStream, writeStream) =>
			# console.log readStream
			content = ''
			readStream.on 'data', (chunk) =>
				content += chunk.toString()
			
			readStream.on 'end', Meteor.bindEnvironment(() =>
				console.log '[ImportUsers] Begin'
				content = content.trim()
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
	content = content.substr(start)
	content.split('\n').forEach (line) =>
		arr = line.split(',')
		name = arr[0].trim()
		email = arr[1].trim()
		mobile = arr[2].trim()
		gender = arr[3].trim()
		if gender == '男'
			gender = 'male'
		else
			gender = 'female'

		birthday = arr[4].trim()
		# console.log name, email, mobile, gender, birthday
		try
			Accounts.createUser(
				email: email
				username: name
				password: '12345678'
				type: 'teacher'
				roles: ''
				profile:
					mobile: mobile
					gender: gender
					birthday: birthday
			)
			console.log(email + "   created successfully.")
		catch e
			console.log(email + "   " + e)

importStudentsAndParents = (content) =>
	console.log 'Importing students and parents'
	start = content.indexOf('\n') + 1
	content = content.substr(start)
	content.split('\n').forEach (line) =>
		arr = line.split(',')
		name = arr[0].trim()
		id = arr[1].trim()
		mobile = arr[2].trim()
		gender = arr[3].trim()
		if gender == '男'
			gender = 'male'
		else
			gender = 'female'

		birthday = arr[4].trim()
		# console.log name, id, gender, birthday, mobile
		# import students
		try
			Accounts.createUser(
				username: id
				password: '12345678'
				type: 'student'
				roles: ''
				profile:
					name: name
					mobile: mobile
					gender: gender
					birthday: birthday
			)
			console.log(id + "   student created successfully.")
		catch e
			console.log(id + "   " + e)

		# import parents
		try
			Accounts.createUser(
				username: id
				password: '12345678'
				type: 'parent'
				roles: ''
				profile:
					name: name
			)
			console.log(id + "   parent created successfully.")
		catch e
			console.log(id + "   " + e)