Red a,b;
float angle;
float timer=0;
float timerB=0;
float begin=1;
ArrayList<Red>vil;
ArrayList<Float>initX;
ArrayList<Float>initY;
ArrayList<Red>linearMomentum;
ArrayList<Float>circleXcords;
ArrayList<Float>circleYcords;
float time;
void setup(){
  size(600,600);
  a=new Red();
  b=new Red();
  b.setX(200);
  b.setY(200);
  a.setX(200);
  a.setY(200);
  vil=new ArrayList<Red>();
  initX=new ArrayList<Float>();
  initY=new ArrayList<Float>();
  circleXcords=new ArrayList<Float>();
  circleYcords=new ArrayList<Float>();
  for(int i=0;i<4;i++){
    Red non=new Red();
    non.setX(200);
    non.setY(200);
    vil.add(non);
    initX.add(non.getX());
    initY.add(non.getY());
    
  }
   angle=0;
  
}
void draw(){
 time=millis()/1000;
 background(255);
 fill(255,0,0);
 for(int i=0;i<vil.size();i++){
   vil.get(i).display();
 }
  if(time<5){
    for(int i=0;i<vil.size();i++){
      if(time==3){
       for(int j=0;j<vil.size();j++){
         circleXcords.add(vil.get(j).getX());
         circleYcords.add(vil.get(j).getY());
       }
      }
      vil.get(i).circle(angle+(2*PI/vil.size())*i,30,initX.get(i),initY.get(i));
     
    }
  }
  if(time>5){
     for(int i=0;i<vil.size();i++){
       vil.get(i).linearMotion(circleXcords.get(i),circleYcords.get(i),(2*PI/vil.size())*i);
     }
  }
  System.out.println(time);
   angle+=0.1;
   
   

}
