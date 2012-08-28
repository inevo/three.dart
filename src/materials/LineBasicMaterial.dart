/**
 * @author mr.doob / http://mrdoob.com/
 * @author alteredq / http://alteredqualia.com/
 * 
 * Ported to Dart from JS by:
 * @author rob silverton / http://www.unwrong.com/
 *
 * parameters = {
 *  color: <hex>,
 *  opacity: <float>,
 *
 *  blending: THREE.NormalBlending,
 *  depthTest: <bool>,
 *
 *  linewidth: <float>,
 *  linecap: "round",
 *  linejoin: "round",
 *
 *  vertexColors: <bool>
 *
 *  fog: <bool>
 * }
 */

class LineBasicMaterial extends Material
{
  Color color;
  num _linewidth;
  String _linecap;
  String _linejoin;

  bool fog, vertexColors;
  
  
  LineBasicMaterial( [Map parameters] ) : super( parameters )
  {
    //THREE.Material.call( this, parameters );

    parameters = parameters != null ? parameters : {};

    color = parameters['color'] !== null ? new Color( parameters['color'] ) : new Color( 0xffffff );

    _linewidth = parameters['linewidth'] !== null ? parameters['linewidth'] : 1;
    _linecap = parameters['linecap'] !== null ? parameters['linecap'] : 'round';
    _linejoin = parameters['linejoin'] !== null ? parameters['linejoin'] : 'round';

    vertexColors = (null != parameters['vertexColors']) ? parameters['vertexColors'] : false;

    fog = parameters['fog'] !== null ? parameters['fog'] : true;
  }
}
