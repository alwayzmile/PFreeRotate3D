//void resetCube() {
//  //front
//  cube.points.set(0, new TPoint(-1, -1, 1));
//  cube.points.set(1, new TPoint(1, -1, 1));
//  cube.points.set(2, new TPoint(1, 1, 1));
//  cube.points.set(3, new TPoint(-1, 1, 1));
//  //back
//  cube.points.set(4, new TPoint(-1, -1, -1));
//  cube.points.set(5, new TPoint(1, -1, -1));
//  cube.points.set(6, new TPoint(1, 1, -1));
//  cube.points.set(7, new TPoint(-1, 1, -1));
//
//  // Scale(50, 50, 0) * Translate(200, 200, 0)
//  Trans = getScaleMatrix(50, -50, 50).multiply(
//          getTranslationMatrix(200, 200, 0));
//          
//  projected = cube.transform(Trans.multiply(getOrthographicMatrix()));
//  projected.drawIt();
//}
