@AppIcons = new FS.Collection "AppIcons",
	stores: [
		new FS.Store.GridFS "appIcons",
			transformWrite: (fileObj, readStream, writeStream)->
				if gm.isAvailable
					size = {width: 128, height: 128}
					gm(readStream, fileObj.name()).autoOrient().resize(size.width + "^>", size.height + "^>").gravity("Center").stream().pipe(writeStream)
				else
					readStream.pipe(writeStream)
	],
	filter:
		allow:
			contentTypes: ['image/*']
