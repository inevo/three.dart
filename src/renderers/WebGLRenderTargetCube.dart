class WebGLRenderTargetCube extends WebGLRenderTarget {

	int activeCubeFace; // PX 0, NX 1, PY 2, NY 3, PZ 4, NZ 5
	
	WebGLRenderTargetCube( num width, num height, 
						[ wrapS = THREE.ClampToEdgeWrapping,
						  wrapT = THREE.ClampToEdgeWrapping,
						  magFilter = THREE.LinearFilter,
						  minFilter = THREE.LinearMipMapLinearFilter,
						  anisotropy = 1,
						  format = THREE.RGBAFormat,
						  type = THREE.UnsignedByteType,
						  depthBuffer = true,
						  stencilBuffer = true
						] ) : activeCubeFace = 0, 
						super(width,height, 
						 wrapS,
						  wrapT,
						  magFilter,
						  minFilter,
						  anisotropy,
						  format,
						  type,
						  depthBuffer,
						  stencilBuffer);

}
