class ShaderMaterial extends Material {
  
  String fragmentShader;
  String vertexShader;
  Map uniforms;
  
  //var attributes; - Moved to Material 

  int shading;

  bool wireframe;
  num wireframeLinewidth;

  bool fog; // set to use scene fog

  bool lights; // set to use scene lights

  int vertexColors; // set to use "color" attribute stream

  bool skinning; // set to use skinning attribute streams

  bool morphTargets; // set to use morph targets
  bool morphNormals; // set to use morph normals

  ShaderMaterial( Map parameters ) : super( parameters )  {

    fragmentShader = parameters['fragmentShader'] != null ? parameters['fragmentShader'] : "void main() {}";
    vertexShader = parameters['vertexShader'] != null ? parameters['vertexShader'] : "void main() {}";
    uniforms = parameters['uniforms'] != null ? parameters['uniforms'] : {};
    attributes = parameters['attributes'];

    shading = parameters['shading'] != null ? parameters['shading'] : Three.SmoothShading;

    wireframe = parameters['wireframe'] != null ? parameters['wireframe'] : false;
    wireframeLinewidth = parameters['wireframeLinewidth'] != null ? parameters['wireframeLinewidth'] : 1;

    fog = parameters['fog'] != null ? parameters['fog'] : false; // set to use scene fog

    lights = parameters['lights'] != null ? parameters['lights'] : false; // set to use scene lights

    vertexColors = parameters['vertexColors'] != null ? parameters['vertexColors'] : THREE.NoColors; // set to use "color" attribute stream

    skinning = parameters['skinning'] != null ? parameters['skinning'] : false; // set to use skinning attribute streams

    morphTargets = parameters['morphTargets'] != null ? parameters['morphTargets'] : false; // set to use morph targets
    morphNormals = parameters['morphNormals'] != null ? parameters['morphNormals'] : false; // set to use morph normals

  }
}
