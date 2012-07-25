/**
 * @author mr.doob / http://mrdoob.com/
 * @author greggman / http://games.greggman.com/
 * @author zz85 / http://www.lab4games.net/zz85/blog
 * 
 * Ported to Dart from JS by:
 * @author rob silverton / http://www.unwrong.com/
 */

class OrthographicCamera extends Camera {

	num left,
		right,
		top,
		bottom,
		near,
		far;

	OrthographicCamera( this.left, this.right, this.top, this.bottom, 
						[this.near = 0.1, this.far = 2000] ) : super() {
		updateProjectionMatrix();
	}

	updateProjectionMatrix() {
		projectionMatrix.makeOrthographic( left, right, top, bottom, near, far);
	}
}