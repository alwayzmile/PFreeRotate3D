import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JCheckBox;
import javax.swing.JRadioButton;
import javax.swing.JLabel;
import javax.swing.JButton;
import javax.swing.ButtonGroup;
import javax.swing.event.*;
import java.awt.*;
import java.awt.event.*;

JFrame frmDrawing;
JPanel panel;
JLabel lblRotation, lblScene, lblBlank;
JRadioButton rdoNoRotation,
             rdoX, rdoY, rdoZ,
             rdoWorld, rdoObject;
ButtonGroup grpRotate,
            grpScene;
JButton btnStartAnimate, 
        btnStopAnimate, 
        btnResetCube;

TObject cube = new TObject();
TObject projected = new TObject();
TMatrix4x4 Trans = new TMatrix4x4(),
           TOCSPos = getDefaultMatrix(),
           TOCSNeg = getDefaultMatrix();

float x, y;
float angle, 
      anglePrev = 0;
boolean isWorld = false,
        isAnimate = false;
char axis = '0';

void setup() {
  frame.setTitle("Simple 3D");
  size(400, 400, P3D);
  
  TMatrix4x4 TT = getDefaultMatrix();
  TT.printIt();
  TT = TT.multiply(getDefaultMatrix());
  TT.printIt();
  
  panel = new JPanel();
  panel.setLayout(new GridLayout(2,5));
    
//  lblBlank = new JLabel("  ");
  lblRotation = new JLabel(" Rotation: ");
  grpRotate = new ButtonGroup();
  rdoNoRotation = new JRadioButton("No Rotation", true);
  rdoX = new JRadioButton("X");
  rdoY = new JRadioButton("Y");
  rdoZ = new JRadioButton("Z");
  grpRotate.add(rdoNoRotation);
  grpRotate.add(rdoX);
  grpRotate.add(rdoY);
  grpRotate.add(rdoZ);
  
  lblScene = new JLabel(" Scene: ");
  grpScene = new ButtonGroup();
  rdoObject = new JRadioButton("Object", true);
  rdoWorld = new JRadioButton("World");
  grpScene.add(rdoObject);
  grpScene.add(rdoWorld);
  
  btnStartAnimate = new JButton("Start Animation");
  btnStopAnimate = new JButton("Stop Animation");
  btnResetCube = new JButton("Reset Cube");
  btnStartAnimate.setEnabled(false);
  btnStopAnimate.setEnabled(false);
  
  GUIListener listener = new GUIListener();
  rdoNoRotation.addActionListener(listener);
  rdoX.addActionListener(listener);
  rdoY.addActionListener(listener);
  rdoZ.addActionListener(listener);
  rdoObject.addActionListener(listener);
  rdoWorld.addActionListener(listener);
  btnStartAnimate.addActionListener(listener);
  btnStopAnimate.addActionListener(listener);
  
  panel.add(lblRotation);
  panel.add(rdoNoRotation);
  panel.add(rdoX);
  panel.add(rdoY);
  panel.add(rdoZ);
  
  panel.add(lblScene);
  panel.add(rdoObject);
  panel.add(rdoWorld);
  
  panel.add(btnStartAnimate);
  panel.add(btnStopAnimate);
//  panel.add(btnResetCube);
//  panel.add(lblBlank);
//  panel.add(lblBlank);
//  panel.add(lblBlank);
//  panel.add(lblBlank);
  
  frmDrawing = new JFrame("Drawing Options");
  frmDrawing.setResizable(false);
  frmDrawing.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
  frmDrawing.getContentPane().add(panel);
  frmDrawing.pack();
  frmDrawing.setVisible(true);
  
  PFont font;
  font = loadFont("ArialMT-10.vlw");
  textFont(font);
  background(255);

  //front
  cube.points.add(0, new TPoint(-1, -1, 1));
  cube.points.add(1, new TPoint(1, -1, 1));
  cube.points.add(2, new TPoint(1, 1, 1));
  cube.points.add(3, new TPoint(-1, 1, 1));
  //back
  cube.points.add(4, new TPoint(-1, -1, -1));
  cube.points.add(5, new TPoint(1, -1, -1));
  cube.points.add(6, new TPoint(1, 1, -1));
  cube.points.add(7, new TPoint(-1, 1, -1));

  //front
  cube.addLine(0, 1);
  cube.addLine(1, 2);
  cube.addLine(2, 3);
  cube.addLine(3, 0);
  //back
  cube.addLine(4, 5);
  cube.addLine(5, 6);
  cube.addLine(6, 7);
  cube.addLine(7, 4);
  //right
  cube.addLine(1, 5);
  cube.addLine(2, 6);
  //left
  cube.addLine(3, 7);
  cube.addLine(0, 4);

  // Scale(50, 50, 0) * Translate(200, 200, 0)
  Trans = getScaleMatrix(50, -50, 50).multiply(
          getTranslationMatrix(200, 200, 0));
          
  projected = cube.transform(Trans.multiply(getOrthographicMatrix()));
  projected.drawIt();
}

void draw() {
  if ( isAnimate ) {
    background(255);
    angle += 0.05;
    rotateCube();
  } else if (mouseX>0 && mouseX<400 && mouseY>0 && mouseY<400) {
    // I set it as if the origin(0,0) is at (200,200)
    // and y-positive is up from (200,200),
    // and x-positive is to the right from (200, 200)
    x = mouseX - 200;
    y = 200 - mouseY;

    angle = atan2(y, x);
  }
}

void mouseMoved() {
  if ( !isAnimate ) {
    background(255);
    rotateCube();
    stroke(0);
    patternLine( 200, 200, mouseX, mouseY, 0x5555, 3 );  
    fill(0);
    text( "Angle (deg) : " + degrees(angle), 10, 385 );
  }
}

class GUIListener implements ActionListener
{
  public void actionPerformed(ActionEvent event) {
    Object source = event.getSource();
    
    if ( source==rdoNoRotation ) {
      isAnimate = false;
      axis = '0';
      anglePrev = 0;
    } else if ( source==rdoX && axis != 'x' ) {
      axis = 'x';
      anglePrev = 0;
    } else if ( source==rdoY && axis != 'y' ) {
      axis = 'y';
      anglePrev = 0;
    } else if ( source==rdoZ && axis != 'z' ) {
      axis = 'z';
      anglePrev = 0;
    } else if ( source==rdoObject && isWorld ) {
      isWorld = false;
      anglePrev = 0;
    } else if ( source==rdoWorld && !isWorld ) {
      isWorld = true;
      anglePrev = 0;
    } else if ( source==btnStartAnimate ) {
      isAnimate = true;
      angle = 0;
    } else if ( source==btnStopAnimate ) {
      isAnimate = false;
      angle = 0;
    }
    
    if ( axis == '0' ) {
      btnStartAnimate.setEnabled(false);
      btnStopAnimate.setEnabled(false);
    } else if ( !isAnimate ) {
      btnStartAnimate.setEnabled(true);
      btnStopAnimate.setEnabled(false);
    } else {
      btnStartAnimate.setEnabled(false);
      btnStopAnimate.setEnabled(true);
    }
  }
}
