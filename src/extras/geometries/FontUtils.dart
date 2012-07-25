/**
 * This code is a quick port of code written in C++ which was submitted to
 * flipcode.com by John W. Ratcliff  // July 22, 2000
 * See original code and more information here:
 * http://www.flipcode.com/archives/Efficient_Polygon_Triangulation.shtml
 *
 * ported to actionscript by Zevan Rosser
 * www.actionsnippet.com
 *
 * ported to javascript by Joshua Koo
 * http://www.lab4games.net/zz85/blog
 *
 */

class FontUtils {

  static var EPSILON = 0.0000000001;

  // takes in an contour array and returns
  static process( contour, indices ) {

    var n = contour.length;

    if ( n < 3 ) return null;

    var result = [],
      verts = [],
      vertIndices = [];

    /* we want a counter-clockwise polygon in verts */

    var u, v, w;

    if ( area( contour ) > 0.0 ) {

      for ( v = 0; v < n; v++ ) verts[ v ] = v;

    } else {

      for ( v = 0; v < n; v++ ) verts[ v ] = ( n - 1 ) - v;

    }

    var nv = n;

    /*  remove nv - 2 vertices, creating 1 triangle every time */

    var count = 2 * nv;   /* error detection */

    for( v = nv - 1; nv > 2; ) {

      /* if we loop, it is probably a non-simple polygon */

      if ( ( count-- ) <= 0 ) {

        //** Triangulate: ERROR - probable bad polygon!

        //throw ( "Warning, unable to triangulate polygon!" );
        //return null;
        // Sometimes warning is fine, especially polygons are triangulated in reverse.
        print( "Warning, unable to triangulate polygon!" );

        if ( indices ) return vertIndices;
        return result;

      }

      /* three consecutive vertices in current polygon, <u,v,w> */

      u = v;    if ( nv <= u ) u = 0;     /* previous */
      v = u + 1;  if ( nv <= v ) v = 0;     /* new v    */
      w = v + 1;  if ( nv <= w ) w = 0;     /* next     */

      if ( snip( contour, u, v, w, nv, verts ) ) {

        var a, b, c, s, t;

        /* true names of the vertices */

        a = verts[ u ];
        b = verts[ v ];
        c = verts[ w ];

        /* output Triangle */

        /*
        result.push( contour[ a ] );
        result.push( contour[ b ] );
        result.push( contour[ c ] );
        */
        result.addAll( [ contour[ a ],
          contour[ b ],
          contour[ c ] ] );


        vertIndices.addAll( [ verts[ u ], verts[ v ], verts[ w ] ] );

        /* remove v from the remaining polygon */
        s = v;
        for( t = v + 1; t < nv; t++ ) {

          verts[ s ] = verts[ t ];
          s++;
        }

        nv--;

        /* reset error detection counter */

        count = 2 * nv;

      }

    }

    if ( indices ) return vertIndices;
    return result;

  }

  // calculate area of the contour polygon
  static area( contour ) {

    var n = contour.length;
    var a = 0.0;

    for( var p = n - 1, q = 0; q < n; p = q++ ) {

      a += contour[ p ].x * contour[ q ].y - contour[ q ].x * contour[ p ].y;

    }

    return a * 0.5;

  }

  // see if p is inside triangle abc
  static insideTriangle( ax, ay,
                   bx, by,
                   cx, cy,
                   px, py ) {

      var aX, aY, bX, bY;
      var cX, cY, apx, apy;
      var bpx, bpy, cpx, cpy;
      var cCROSSap, bCROSScp, aCROSSbp;

      aX = cx - bx;  aY = cy - by;
      bX = ax - cx;  bY = ay - cy;
      cX = bx - ax;  cY = by - ay;
      apx= px  -ax;  apy= py - ay;
      bpx= px - bx;  bpy= py - by;
      cpx= px - cx;  cpy= py - cy;

      aCROSSbp = aX*bpy - aY*bpx;
      cCROSSap = cX*apy - cY*apx;
      bCROSScp = bX*cpy - bY*cpx;

      return ( (aCROSSbp >= 0.0) && (bCROSScp >= 0.0) && (cCROSSap >= 0.0) );

  }


  static snip( contour, u, v, w, n, verts ) {

    var p;
    var ax, ay, bx, by;
    var cx, cy, px, py;

    ax = contour[ verts[ u ] ].x;
    ay = contour[ verts[ u ] ].y;

    bx = contour[ verts[ v ] ].x;
    by = contour[ verts[ v ] ].y;

    cx = contour[ verts[ w ] ].x;
    cy = contour[ verts[ w ] ].y;

    if ( EPSILON > (((bx-ax)*(cy-ay)) - ((by-ay)*(cx-ax))) ) return false;

      for ( p = 0; p < n; p++ ) {

        if( (p == u) || (p == v) || (p == w) ) continue;

        px = contour[ verts[ p ] ].x;
        py = contour[ verts[ p ] ].y;

        if ( insideTriangle( ax, ay, bx, by, cx, cy, px, py ) ) return false;

      }

      return true;

  }


  //namespace.Triangulate = process;
  //namespace.Triangulate.area = area;


}