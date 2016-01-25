TMatrix4x4 getRotationXMatrix(float rad) {
  TMatrix4x4 tmp = new TMatrix4x4();
  
  tmp.inputRow(0, 1, 0,         0,        0);
  tmp.inputRow(1, 0, cos(rad),  sin(rad), 0);
  tmp.inputRow(2, 0, -sin(rad), cos(rad), 0);
  tmp.inputRow(3, 0, 0,         0,        1);
  
  return tmp;
}

TMatrix4x4 getRotationXMatrix2(float rad) {
  TMatrix4x4 tmp = new TMatrix4x4();
  
  tmp.inputRow(0, 1, 0,         0,        0);
  tmp.inputRow(1, 0, cos(rad),  -sin(rad),0);
  tmp.inputRow(2, 0, sin(rad),  cos(rad), 0);
  tmp.inputRow(3, 0, 0,         0,        1);
  
  return tmp;
}

TMatrix4x4 getRotationYMatrix(float rad) {
  TMatrix4x4 tmp = new TMatrix4x4();
  
  tmp.inputRow(0, cos(rad),  0, -sin(rad),0);
  tmp.inputRow(1, 0,         1, 0,        0);
  tmp.inputRow(2, sin(rad),  0, cos(rad), 0);
  tmp.inputRow(3, 0,         0, 0,        1);
  
  return tmp;
}

TMatrix4x4 getRotationZMatrix(float rad) {
  TMatrix4x4 tmp = new TMatrix4x4();
  
  tmp.inputRow(0, cos(rad),  sin(rad),  0,        0);
  tmp.inputRow(1, -sin(rad), cos(rad),  0,        0);
  tmp.inputRow(2, 0,         0,         1,        0);
  tmp.inputRow(3, 0,         0,         0,        1);
  
  return tmp;
}

TMatrix4x4 getTranslationMatrix(float dx, float dy, float dz) {
  TMatrix4x4 tmp = new TMatrix4x4();
  
  tmp.inputRow(0, 1,  0,  0, 0);
  tmp.inputRow(1, 0,  1,  0, 0);
  tmp.inputRow(2, 0,  0,  1, 0);
  tmp.inputRow(3, dx, dy, dz,1);
  
  return tmp;
}

TMatrix4x4 getScaleMatrix(float sx, float sy, float sz) {
  TMatrix4x4 tmp = new TMatrix4x4();
  
  tmp.inputRow(0, sx, 0,  0, 0);
  tmp.inputRow(1, 0,  sy, 0, 0);
  tmp.inputRow(2, 0,  0,  sz,0);
  tmp.inputRow(3, 0,  0,  0, 1);
  
  return tmp;
}

TMatrix4x4 getOrthographicMatrix() {
  TMatrix4x4 tmp = new TMatrix4x4();
  
  tmp.inputRow(0, 1,  0,  0, 0);
  tmp.inputRow(1, 0,  1,  0, 0);
  tmp.inputRow(2, 0,  0,  0, 0);
  tmp.inputRow(3, 0,  0,  0, 1);
  
  return tmp;
}

TMatrix4x4 getDefaultMatrix() {
  TMatrix4x4 tmp = new TMatrix4x4();
  
  tmp.inputRow(0, 1,  0,  0, 0);
  tmp.inputRow(1, 0,  1,  0, 0);
  tmp.inputRow(2, 0,  0,  1, 0);
  tmp.inputRow(3, 0,  0,  0, 1);
  
  return tmp;
}
