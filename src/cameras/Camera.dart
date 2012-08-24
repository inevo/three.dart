/**
 * @author mr.doob / http://mrdoob.com/
 * @author mikael emtinger / http://gomo.se
 * 
 * Ported to Dart from JS by:
 * @author rob silverton / http://www.unwrong.com/
 */

class Camera extends Object3D
{
  Matrix4 matrixWorldInverse;
  Matrix4 projectionMatrix;
  Matrix4 projectionMatrixInverse;
  
  num _near;
  num _far;
  
  num get near() {  return _near;  }
  num get far() {  return _far;  }
  
  Camera() 
  {

    matrixWorldInverse = new Matrix4();

    projectionMatrix = new Matrix4();
    projectionMatrixInverse = new Matrix4();
  }

  void lookAt( vector ) 
  {
    // TODO: Add hierarchy support

    matrix.lookAt( position, vector, up );

    if ( rotationAutoUpdate ) {
      rotation.setRotationFromMatrix( matrix );
    }
  }
}
