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
ArrayList<Float>XPos;
ArrayList<Float>YPos;
ArrayList<Float>slope;
ArrayList<Red>enemy;
float time;
float elapsedTime;
int size;
void setup(){
  size(600,600);
  a=new Red();
  b=new Red();
  b.setX(200);
  b.setY(200);
  a.setX(200);
  a.setY(200);
  size=0;
  elapsedTime=0;
  XPos=new ArrayList<Float>();
  YPos=new ArrayList<Float>();
  slope=new ArrayList<Float>();
  enemy=new ArrayList<Red>();
  vil=new ArrayList<Red>();
  initX=new ArrayList<Float>();
  initY=new ArrayList<Float>();
  circleXcords=new ArrayList<Float>();
  circleYcords=new ArrayList<Float>();
  linearMomentum=new ArrayList<Red>();
  for(int i=0;i<4;i++){
    Red non=new Red();
    non.setX(200);
    non.setY(200);
    vil.add(non);
    initX.add(non.getX());
    initY.add(non.getY());
    enemy.add(non);
    linearMomentum.add(non);
    XPos.add(random(200));
    YPos.add(0.0);
    
  }
  for(int i=0;i<4;i++){
    slope.add((enemy.get(i).getY()-YPos.get(i))/(enemy.get(i).getX()-XPos.get(i)));
  }
   angle=0;
  
}
void draw(){
 time=millis()/1000;
 background(255);
 fill(255,0,0);
 for(int i=0;i<enemy.size();i++){
   enemy.get(i).display();
   enemy.get(i).move2(XPos.get(i),YPos.get(i),slope.get(i));
 }
 System.out.println(enemy.get(0).getX()+" "+enemy.get(0).getY());
 
   
    
  
 // if(time>5){
  //   for(int i=0;i<vil.size();i++){
      // vil.get(i).linearMotion(circleXcords.get(i),circleYcords.get(i),(2*PI/vil.size())*i);
  //   }
//  }
  
   angle+=0.1;
   
   

}
