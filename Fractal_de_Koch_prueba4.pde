//import processing.video.*;
import TUIO.*;
import spout.*;

Spout spout;

TuioProcessing tuioClient;
TuioObject tobj;

ArrayList<TuioObject> tuioObjectList;
ArrayList<KochLine> lines  ;   
boolean softLines;

int niveles;
int ID;
int cuadros;

int[] PosX = {
  0, 0, 0, 0, 0
};

int [] PosY= {
  0, 0, 0, 0, 0
};


//---------------------------

void setup() {

   
  
  
  
  //fullScreen(2);
  size( 800, 600, P3D );
  frameRate(25);
  smooth();
  imageMode(CENTER);

  tuioClient  = new TuioProcessing(this);
 spout = new Spout(this);
  
  spout.createSender("Spout Processing");
 
}


//---------------------------

void draw() {

  background(0);
  
    buscarPosicion();
  


  
  lines = new ArrayList<KochLine>();
  PVector a   = new PVector(PosX[0],PosY[0]);
  PVector b   = new PVector(PosX[1],PosY[1]);
 // PVector c   = new PVector((dist(PosX[0], PosY[0], PosX[1], PosY[1])/2), (dist(PosX[0], PosY[0], PosX[1], PosY[1]))*cos(radians(30)));
  PVector c   = new PVector(PosX[2],PosY[2]);

 
  // Starting with additional lines
  lines.add(new KochLine(a, b));
  lines.add(new KochLine(b, c));
  lines.add(new KochLine(c, a));
  
  
  cuantosTengo();
  
  for (int i = 0; i < niveles; i++) {
    generate();
  }

 for (KochLine l : lines) {
    l.display();
  }



  buscarPosicion();
}


void generate() {
  ArrayList next = new ArrayList<KochLine>();    // Create emtpy list
  for (KochLine l : lines) {
    // Calculate 5 koch PVectors (done for us by the line object)
    PVector a = l.kochA();                 
    PVector b = l.kochB();
    PVector c = l.kochC();
    PVector d = l.kochD();
    PVector e = l.kochE();
    // Make line segments between all the PVectors and add them
    next.add(new KochLine(a, b));
    next.add(new KochLine(b, c));
    next.add(new KochLine(c, d));
    next.add(new KochLine(d, e));
  }
  lines = next;
  spout.sendTexture();
}
//---------------------------

void removeTuioObject(TuioObject tobj) {

  int IDremove=tobj.getSymbolID();
  if (IDremove<=5) {
    PosX[IDremove]=0;
    PosY[IDremove]=0;
    println("El objeto " + IDremove + " fue eliminado");
  }
}
 
//---------------------------
