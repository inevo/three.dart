/**
 * @author zz85 / http://www.lab4games.net/zz85/blog
 * Defines a 2d shape plane using paths.
 **/

// STEP 1 Create a path.
// STEP 2 Turn path into shape.
// STEP 3 ExtrudeGeometry takes in Shape/Shapes
// STEP 3a - Extract points from each shape, turn to vertices
// STEP 3b - Triangulate each shape, add faces.

class Shape extends Path {

  List holes;
  
	Shape() : super(), holes = [];
	
  // Convenience method to return ExtrudeGeometry
  extrude( options ) => new ExtrudeGeometry( [this], options );
  
  
  // Get points of holes
  getPointsHoles( divisions ) {
  
  	var i, il = holes.length, holesPts = [];
  
  	for ( i = 0; i < il; i ++ ) {
  
  		holesPts[ i ] = holes[ i ].getTransformedPoints( divisions, _bends );
  
  	}
  
  	return holesPts;
  
  }
  
  // Get points of holes (spaced by regular distance)
  getSpacedPointsHoles ( divisions ) {
  
  	var i, il = holes.length, holesPts = [];
  
  	for ( i = 0; i < il; i ++ ) {
  
  		holesPts[ i ] = holes[ i ].getTransformedSpacedPoints( divisions, _bends );
  
  	}
  
  	return holesPts;
  
  }
  
  
  // Get points of shape and holes (keypoints based on segments parameter)
  extractAllPoints( divisions ) {
  
  	return {
  
  		"shape": getTransformedPoints( divisions ),
  		"holes": getPointsHoles( divisions )
  
  	};
  
  }
  
  extractPoints( [num divisions] ) {
  
  	if (useSpacedPoints) {
  		return extractAllSpacedPoints(divisions);
  	}
  
  	return extractAllPoints(divisions);
  
  }
  
  //
  // THREE.Shape.prototype.extractAllPointsWithBend = function ( divisions, bend ) {
  //
  // 	return {
  //
  // 		shape: this.transform( bend, divisions ),
  // 		holes: this.getPointsHoles( divisions, bend )
  //
  // 	};
  //
  // };
  
  // Get points of shape and holes (spaced by regular distance)
  extractAllSpacedPoints( [num divisions] ) {
  	return {
  		"shape": getTransformedSpacedPoints( divisions ),
  		"holes": getSpacedPointsHoles( divisions )
  
  	};
  }

}