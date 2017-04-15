@HeadImages = new FS.Collection "HeadImages",
	stores: [
		new FS.Store.GridFS "headImages",
			transformWrite: (fileObj, readStream, writeStream)->
				if gm.isAvailable
					size = {width: 128, height: 128}
					gm(readStream, fileObj.name()).autoOrient().resize(size.width + "^>", size.height + "^>").gravity("Center").extent(size.width, size.height).stream().pipe(writeStream)
				else
					readStream.pipe(writeStream)
	],
	filter:
		allow:
			contentTypes: ['image/*']
