@InitFiles = new FS.Collection("InitFiles",
	stores: [
		new FS.Store.GridFS 'files'
	],
	filter:
		allow:
			contentTypes: ['text/csv']
			extensions: ['csv']
)
