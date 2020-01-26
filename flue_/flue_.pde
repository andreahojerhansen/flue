//Her er vores array med vores flue
ArrayList<Flue> flueListe = new ArrayList<Flue>();

//Her angives størelsen i setup
void setup(){
  size(500,500);
}

//her klades array listen og fluens funktioner skrives ind
void draw(){
  clear();
  for(int i=0; i<flueListe.size(); i++){
    Flue f = flueListe.get(i);
    f.tegnFlue();
    f.flyt();
  }
}

//Her kaldes fluen ved en Key Pressed  
void keyPressed(){
  
  
//  fluen får dobbet størelse nå der trykkes E
  if(keyPressed){
    if(key == 'e'|| key == 'E'){
//derfor står der 2      
      flueListe.add(new Flue(2));
     }
//hvis der trykkes på en anden key bliver fluen normal størelse     
     else{
     flueListe.add(new Flue(1));
     }
     }
  
}

//Her registreres musens koordinator til at angive hvor flueen skal placeres 
void mousePressed(){
  flueListe.add(new Flue(mouseX, mouseY,1));
}

/////////////////////////////////////////////////////////

//Her defineres "Flue" som objekt. Dens dimensioner og positionerne a & b's verdier laves her
class Flue{
  
//her sættes nogle verdie som bruges når fluen laves  
  float positionX,positionY;
  float distanceFlyttet;
  float vinkel = 0; 
  float scale = 1;
  
//fluens position, flyve retning og størelse for tastaturet laves her
  Flue(float a){
    positionX  = random(0,height);
    positionY  = random(0,width);
    vinkel     = random(0,2*PI);
    scale = a;
  }
 //fluens position, flyve retning og størelse for musen laves her 
  Flue(float a, float b,float c){
    positionX = a;
    positionY = b;
    scale = c;
    vinkel    = random(0,2*PI);
  }
  
  //Her angives hastigheden af vores flue
  void flyt(){
    distanceFlyttet = distanceFlyttet + 0.5;
  }
  
//Her tegnes fluen
  void tegnFlue(){
    pushMatrix();
      translate(positionX,positionY);
      rotate(vinkel);
      translate(distanceFlyttet,0);
      scale(scale);
        ellipse(0,0,20,8);
        ellipse(0,0-8,15,10);
        ellipse(0,0+8,15,10);
        ellipse(0+6,0,8,8);
    popMatrix();
  } 
}
