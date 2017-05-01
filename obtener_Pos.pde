
void cuantosTengo(){
   
  tuioObjectList = tuioClient.getTuioObjectList();
  niveles =  tuioObjectList.size();

};


void buscarPosicion()
{
   // para detectar de 1 a 5 objetos
   
   
  tuioObjectList = tuioClient.getTuioObjectList();
  for (int i=0;i<tuioObjectList.size();i++) {

    tobj = tuioObjectList.get(i);
    noStroke();
    pushMatrix();
    translate(tobj.getScreenX(width), tobj.getScreenY(height));
    rotate(tobj.getAngle());
    ID=tobj.getSymbolID();
    
    
    
    if (ID==0) {
      PosX[0]= tobj.getScreenX(width);
      PosY[0]= tobj.getScreenY(height);

    }

    if (ID==1) {  
      PosX[1]= tobj.getScreenX(width);
      PosY[1]= tobj.getScreenY(height);

     
    }

    if (ID==2) {
      PosX[2]= tobj.getScreenX(width);
      PosY[2]= tobj.getScreenY(height);

    }

    if (ID==3) {
      PosX[3]= tobj.getScreenX(width);
      PosY[3]= tobj.getScreenY(height);

    }

    if (ID==4) {
      PosX[4]= tobj.getScreenX(width);
      PosY[4]= tobj.getScreenY(height);

    }

    popMatrix();
  }
}