/**
 * @author mr.doob / http://mrdoob.com/
 * @author alteredq / http://alteredqualia.com/
 * @author mikael emtinger / http://gomo.se/
 * 
 * Ported to Dart from JS by:
 * @author rob silverton / http://www.unwrong.com/
 */

class Mesh extends Object3D {
  Geometry geometry;
  Material material;
  
  num _morphTargetBase;
  List _morphTargetForcedOrder;
  List _morphTargetInfluences;
  Map _morphTargetDictionary;
  
  Mesh( this.geometry, this.material ) : super() {

    if ( geometry != null ) {
      // calc bound radius
      if( geometry.boundingSphere == null ) {
        geometry.computeBoundingSphere();
      }

      boundRadius = geometry.boundingSphere.radius;


      // setup morph targets
      if( geometry.morphTargets.length != 0 ) 
      {
        _morphTargetBase = -1;
        _morphTargetForcedOrder = [];
        _morphTargetInfluences = [];
        _morphTargetDictionary = {};

        for( int m = 0; m < geometry.morphTargets.length; m ++ ) {
          _morphTargetInfluences.add( 0 );
          _morphTargetDictionary[ geometry.morphTargets[ m ].name ] = m;
        }
      }
    }
  }

  /*
   * Get Morph Target Index by Name
   */
  num getMorphTargetIndexByName( name ) {
    if ( _morphTargetDictionary[ name ] != null ) {
      return _morphTargetDictionary[ name ];
    }

    print( "THREE.Mesh.getMorphTargetIndexByName: morph target $name does not exist. Returning 0." );
    return 0;
  }
}
