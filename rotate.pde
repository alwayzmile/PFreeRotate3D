void rotateCube() {
  if ( !isWorld ) {
    if ( axis == 'z' ) {
      Trans = getScaleMatrix(50, -50, 50).multiply(
              getTranslationMatrix(200, 200, 0).multiply(
              getOrthographicMatrix()));
      
      TOCSNeg = getRotationZMatrix(-(angle-anglePrev)).multiply(TOCSNeg);
      TOCSPos = TOCSPos.multiply(getRotationZMatrix(angle-anglePrev));
  
      strokeWeight(1);
      cube = cube.transform(getRotationZMatrix(angle-anglePrev));
      projected = cube.transform(Trans);
      projected.drawIt();
      
      anglePrev = angle;
    } else if ( axis == 'y' ) {
      Trans = getScaleMatrix(50, -50, 50).multiply(
              getTranslationMatrix(200, 200, 0).multiply(
              getOrthographicMatrix()));
      
      TOCSNeg = getRotationYMatrix(-(angle-anglePrev)).multiply(TOCSNeg);
      TOCSPos = TOCSPos.multiply(getRotationYMatrix(angle-anglePrev));
  
      strokeWeight(1);
      cube = cube.transform(getRotationYMatrix(angle-anglePrev));
      projected = cube.transform(Trans);
      projected.drawIt();
      
      anglePrev = angle;
    } else if ( axis == 'x' ) {
      Trans = getScaleMatrix(50, -50, 50).multiply(
              getTranslationMatrix(200, 200, 0).multiply(
              getOrthographicMatrix()));
      
      TOCSNeg = getRotationXMatrix(-(angle-anglePrev)).multiply(TOCSNeg);
      TOCSPos = TOCSPos.multiply(getRotationXMatrix(angle-anglePrev));
  
      strokeWeight(1);
      cube = cube.transform(getRotationXMatrix(angle-anglePrev));
      projected = cube.transform(Trans);
      projected.drawIt();
      
      anglePrev = angle;
    } else {
      projected.drawIt();
    }
  } else {
    if ( axis == 'z' ) {
      Trans = getScaleMatrix(50, -50, 50).multiply(
              getTranslationMatrix(200, 200, 0).multiply(
              getOrthographicMatrix()));
      
      //TOCSPos.printIt();
      //TOCSNeg.printIt();
  
      strokeWeight(1);
      cube = cube.transform(TOCSNeg);
      cube = cube.transform(getRotationZMatrix(angle-anglePrev));
      cube = cube.transform(TOCSPos);
      projected = cube.transform(Trans);
      projected.drawIt();
      
      anglePrev = angle;
    } else if ( axis == 'y' ) {
      Trans = getScaleMatrix(50, -50, 50).multiply(
              getTranslationMatrix(200, 200, 0).multiply(
              getOrthographicMatrix()));
      
      //TOCSPos.printIt();
      //TOCSNeg.printIt();
  
      strokeWeight(1);
      cube = cube.transform(TOCSNeg);
      cube = cube.transform(getRotationYMatrix(angle-anglePrev));
      cube = cube.transform(TOCSPos);
      projected = cube.transform(Trans);
      projected.drawIt();
      
      anglePrev = angle;
    } else if ( axis == 'x' ) {
      Trans = getScaleMatrix(50, -50, 50).multiply(
              getTranslationMatrix(200, 200, 0).multiply(
              getOrthographicMatrix()));
      
      //TOCSPos.printIt();
      //TOCSNeg.printIt();
  
      strokeWeight(1);
      cube = cube.transform(TOCSNeg);
      cube = cube.transform(getRotationXMatrix(angle-anglePrev));
      cube = cube.transform(TOCSPos);
      projected = cube.transform(Trans);
      projected.drawIt();
      
      anglePrev = angle;
    } else {
      projected.drawIt();
    }
    println(isWorld);
    println(axis);
  }
}
