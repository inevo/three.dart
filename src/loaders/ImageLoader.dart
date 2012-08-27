class ImageLoader extends EventEmitter {

	String crossOrigin;

	ImageLoader() : crossOrigin = null, super();

	load( String url, [ImageElement image = null] ) {

		if ( image == null ) image = new ImageElement();

		image.on.load.add((_) {
			dispatchEvent( new Event(type: 'load', content: image) );
		}, false );

		image.on.error.add( (_) {
			dispatchEvent( new Event(type: 'error', message: "Couldn\'t load URL [$url]" ) );
		}, false );

		if ( crossOrigin != null ) image.crossOrigin = crossOrigin;

		image.src = url;

	}

}