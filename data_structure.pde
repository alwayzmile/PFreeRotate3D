class TObject {
  public ArrayList<TPoint> points = new ArrayList<TPoint>();
  private ArrayList<Integer> lines = new ArrayList<Integer>();
  
  public TObject() {}
  
  public void addLine(int iRow, int iCol) {
    lines.add(iRow);
    lines.add(iCol);
  }
  
  public int getStartPoint(int iLine) {
    //print( " *" + lines.get(iLine*2) + "* " );
    return lines.get(iLine*2);
  }
  
  public int getEndPoint(int iLine) {
    //print( " *" + lines.get(iLine*2+1) + "* " );
    return lines.get(iLine*2+1);
  }
  
  public TObject transform(TMatrix4x4 T) {
    TObject tmp = new TObject();
    TPoint transformed = new TPoint();
    
    for (int i=0; i<points.size(); i++) {
      transformed = points.get(i).multiply(T);
      tmp.points.add(transformed);
    }
    
    for (int i=0; i<lines.size(); i++) {
      tmp.lines.add(lines.get(i));
    }
    
    return tmp;
  }
  
  public TObject transform2(TMatrix4x4 T) {
    TObject tmp = new TObject();
    TPoint transformed = new TPoint();
    
    for (int i=0; i<points.size(); i++) {
      transformed = points.get(i).multiply2(T);
      tmp.points.add(transformed);
    }
    
    for (int i=0; i<lines.size(); i++) {
      tmp.lines.add(lines.get(i));
    }
    
    return tmp;
  }
  
  public void drawIt() {
    int pt1, pt2;
    for (int i = (lines.size()/2)-1; i >= 0; i--) {
     pt1 = getStartPoint(i);
     pt2 = getEndPoint(i);
     
     if ( i < 4 )
       stroke(#ff0000);
     else
       stroke(0);
     
     line(points.get(pt1).x, points.get(pt1).y, points.get(pt1).z,
          points.get(pt2).x, points.get(pt2).y, points.get(pt2).z);
    }
  }
}

class TPoint {
  public float x, y, z, w;
  
  public TPoint() {
    x = y = z = 0;
    w = 1;
  }
  
  public TPoint(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.w = 1;
  }
  
  public TPoint multiply(TMatrix4x4 T) {
    TPoint tmp = new TPoint();
    
    tmp.x = x*T.elms[0][0] + 
            y*T.elms[1][0] + 
            z*T.elms[2][0] + 
            w*T.elms[3][0];
    tmp.y = x*T.elms[0][1] + 
            y*T.elms[1][1] + 
            z*T.elms[2][1] + 
            w*T.elms[3][1];
    tmp.z = x*T.elms[0][2] + 
            y*T.elms[1][2] + 
            z*T.elms[2][2] + 
            w*T.elms[3][2];
            
    return tmp;
  }
  
  public TPoint multiply2(TMatrix4x4 T) {
    TPoint tmp = new TPoint();
    
    tmp.x = x*T.elms[0][0] + 
            y*T.elms[0][1] + 
            z*T.elms[0][2] + 
            w*T.elms[0][3];
    tmp.y = x*T.elms[1][0] + 
            y*T.elms[1][1] + 
            z*T.elms[1][2] + 
            w*T.elms[1][3];
    tmp.z = x*T.elms[2][0] + 
            y*T.elms[2][1] + 
            z*T.elms[2][2] + 
            w*T.elms[2][3];
            
    return tmp;
  }
}

class TMatrix4x4 {
  public float[][] elms = new float[4][4];
  
  public TMatrix4x4() {
    for (int i=0; i<4; i++) {
      for (int j=0; j<4; j++) {
        elms[i][j] = 0;
      }
    }
  }
  
  public void inputRow(int row, float a, float b, float c, float d) {
    elms[row][0] = a;
    elms[row][1] = b;
    elms[row][2] = c;
    elms[row][3] = d;
  }
  
  public TMatrix4x4 multiply(TMatrix4x4 T) {
    TMatrix4x4 tmp = new TMatrix4x4();
    
    for (int i=0; i<4; i++) {
      for (int j=0; j<4; j++) {
        for (int k=0; k<4; k++) {
          tmp.elms[i][j] += elms[i][k] * T.elms[k][j];
        }
        //print( tmp.elms[i][j] + " _ " );
      }
      //println();
    }
    
    return tmp;
  }
  
  public void printIt() {
    for ( int i=0; i<4; i++ ) {
      for ( int j=0; j<4; j++ ) {
        print( (elms[i][j]) + " " );
      }
      println();
    }
  }
}
