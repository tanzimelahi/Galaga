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
ArrayList<Boolean>isRight;
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
  isRight=new ArrayList<Boolean>();
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
    XPos.add(random(500));
    YPos.add(0.0);
    
  }
  for(int i=0;i<4;i++){
    if(200>=XPos.get(i)){
      isRight.add(true);
    }
    else{
    isRight.add(false);
    }
  }

   angle=0;
  
}
void draw(){
 time=millis()/1000;
 background(255);
 fill(255,0,0);
  for(int i=0;i<enemy.size();i++){
    enemy.get(i).display();
  }
 if(time<3){
  for(int i=0;i<vil.size();i++){
      enemy.get(i).circle(angle+(2*PI/enemy.size())*i,30,initX.get(i),initY.get(i));
    }
 }
    else if(time==3){
       for(int j=0;j<vil.size();j++){
         circleXcords.add(vil.get(j).getX());
         circleYcords.add(vil.get(j).getY());
          slope.add((enemy.get(j).getY()-YPos.get(j)/(enemy.get(j).getX()-XPos.get(j))));
         if
         elapsedTime=time;
       }
       
      }
    else if(time>3){
       for(int k=0; k<enemy.size();k++){
         linearMomentum.get(k).move2(XPos.get(k),YPos.get(k),slope.get(k),isRight.get(k));
       }
     }
    for(int i=0;i<4;i++){
    System.out.println("this is the"+i+" coords "+"x cord: "+enemy.get(i).getX()+"y cord:"+enemy.get(i).getY()+"this is the target x:"+XPos.get(i)+"this is target y: "+YPos.get(i)+"this is the boolean"+isRight.get(i));
    
  }
   angle+=0.1;
   
   

}
