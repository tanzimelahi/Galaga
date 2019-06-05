import java.util.Arrays;
float x;
int y;
float angle;
int increment;
float time;
float timePassed;
ArrayList<Red>enemy;
ArrayList<Float>initialPos;
ArrayList<Float>XPos;
ArrayList<heroBullet>missile;
ArrayList<monsterBullet>viper;
ArrayList<Red>circularMonsters;
ArrayList<Red>linearMotion;
ArrayList<Float>linearX;
ArrayList<Float>linearY;
ArrayList<Float>linearAngle;
ArrayList<Red>cleanUp;
float score;
float highScore;
float circleX;
float circleY;
boolean win;
boolean go;// lets the missile loose;
int countDown;
int mode;
float count;
Player hero;
void setup(){
  win=false;
  score=0;
  highScore=0;
  size(1000,1000);
  int yPlace=0;// initiates the ycord of the monsters
  int xPlace=0;// same as yPlace on the other side of the screen
  count=0;
  cleanUp=new ArrayList<Red>();
  linearX=new ArrayList<Float>();
  linearY=new ArrayList<Float>();
  linearAngle=new ArrayList<Float>();
  enemy=new ArrayList<Red>();
  hero=new Player();
  missile=new ArrayList<heroBullet>();
  viper=new ArrayList<monsterBullet>();
  initialPos=new ArrayList<Float>();//y value
  XPos=new ArrayList<Float>();
  circularMonsters=new ArrayList<Red>();
  linearMotion=new ArrayList<Red>();
  
  int number=(int)random(20)+20;// gives the size of the list enemy(num of monsters)
  countDown=0;
  for(int i=0;i<number;i++){
    enemy.add(new Red());
  }
  for(int i=0;i<enemy.size();i++){
    
      enemy.get(i).setX(200);
      enemy.get(i).setY(200);
      enemy.get(i).setColors((int)random(3));
      initialPos.add(random(200));
      yPlace+=40;  
      xPlace+=0;
  
 
}
mode=1;
 angle=0;
 timePassed=0;
}
 void draw(){
 background(255);
 time=millis()/1000;
 if(enemy.size()>=2&& initialPos.size()>=2){
 //System.out.println("x cord"+enemy.get(1).getX()+" ycord "+enemy.get(1).getY()+" starting position "+initialPos.get(1));
 };
 if(linearMotion.size()>=2 && initialPos.size()>=2){
    //System.out.println("x cord"+linearMotion.get(1).getX()+" ycord "+linearMotion.get(1).getY()+" starting position" +initialPos.get(1));
 }
 System.out.println(initialPos);
 if(mode==1){
   for(int i=0;i<enemy.size();i++){
     enemy.get(i).display();
     enemy.get(i).circle(angle+(2*PI/enemy.size())*i,100,500,200);
   }
   angle+=0.05;
   if(time>3){
     for(int i=0;i<enemy.size();i++){
       enemy.get(i).setX(random(1000));
       enemy.get(i).setY(random(200));
     }
     timePassed=time;
     angle=0;
     mode++;
   }
   textSize(100);
  if(time<2){
   text("Ready!",300,300);
  }
  else{
    text("Go!",300,300);
  }
 }
 else if(mode==2){
   hero.display();
  if(keyPressed==true){
    if(key==CODED){
     if(keyCode==LEFT){
      hero.move(-1);
     }
     else if(keyCode==RIGHT){
       hero.move(1);
     }
    
    
   }
   else if(key==ENTER){
     countDown++;
     go=true;
   }  
  }
  if(go && countDown==5){
    countDown=0;
    if(hero.getLife()){
      missile.add(hero.fire());
    }
  }
  //keyReleased();
  for(int i=0;i<cleanUp.size();i++){
    cleanUp.get(i).display();
    if(cleanUp.get(i).getY()>=height){
      cleanUp.get(i).setY(0);
    }
    cleanUp.get(i).setY(cleanUp.get(i).getY()+1);
  }
  for(int i=0;i<enemy.size();i++){
    enemy.get(i).move(1,initialPos.get(i));
   if(enemy.get(i).getX()<0 || enemy.get(i).getX()>width){
     enemy.get(i).reverseIncrement();
     initialPos.set(i,initialPos.get(i)+20);// changing the rate of the monsters coming down
   }
   if(enemy.get(i).isTouching(hero)){
     hero.setLife(false);
   }
 }
   if(missile.size()!=0){
     for(int i=0;i<missile.size();i++){
       missile.get(i).move();
     }
   }
   for(int i=0;i<enemy.size();i++){
       if((int)random(250)==1){
         viper.add(enemy.get(i).fire());
       }
   }
   for(int i=0;i<cleanUp.size();i++){
     if((int)random(250)==1){
       viper.add(cleanUp.get(i).fire());
     }
   }
   for(int i=0;i<linearMotion.size();i++){
     if((int)random(100)==1){
       viper.add(linearMotion.get(i).fire());
     }
   }
   if(viper.size()!=0){
     for(int i=0;i<viper.size();i++){
       viper.get(i).move();
       if(viper.get(i).isTouching(hero)){
         viper.remove(i);
         hero.setLife(false);
       }
     }
   }
   for(int i=0;i<missile.size();i++){
     for(int j=0;j<enemy.size();j++){
       if(missile.get(i).isTouching(enemy.get(j))){
         enemy.remove(j);
         j--;
         missile.remove(i);
         i--;
         score+=10;
         break;        
       }
     }
   }
   if(hero.getLife()==false){
     mode=4;
     
   }
   if(enemy.size()==0 && linearMotion.size()==0 && cleanUp.size()==00){
    mode=4;
    timePassed=time;
    win=true;
  }
   if(time-timePassed>5){
     timePassed=time;
     count=time;
     angle=0;
     for(int i=0;i<5 && i<enemy.size();i++){
       circularMonsters.add(enemy.get(i));
     }
     if(circularMonsters.size()>0){
       circleX=circularMonsters.get(0).getX();
       circleY=circularMonsters.get(0).getY();
     }
     for(int i=0;i<circularMonsters.size();i++){
       enemy.remove(0);
       initialPos.remove(0);
     }
     
   }
   if(circularMonsters.size()>0){
     if(time-count>2){
       for(int i=0;i<circularMonsters.size();i++){
         linearMotion.add(circularMonsters.get(i));
         linearX.add(circularMonsters.get(i).getX());
         linearY.add(circularMonsters.get(i).getY());
         linearAngle.add(angle+(2*PI/circularMonsters.size())*i);
       }
       circularMonsters.clear();
     }
   }
     
       for(int i=0;i<circularMonsters.size();i++){
             circularMonsters.get(i).circle(angle+(2*PI/circularMonsters.size())*i,30,circleX,circleY);
              circularMonsters.get(i).display();
       }
       angle+=0.1;
       for(int i=0;i<linearMotion.size();i++){
         linearMotion.get(i).display();
         if(linearMotion.get(i).getX()>=width && linearMotion.get(i).getY()<height){
           linearMotion.get(i).setX(random(500));
           cleanUp.add(linearMotion.remove(i));
           //linearMotion.get(i).setY(linearMotion.get(i).getY()+1);
         }
         else if(linearMotion.get(i).getY()>=height){
           linearMotion.get(i).setY(0);
           cleanUp.add(linearMotion.remove(i));
           
           
         }
         else{
         linearMotion.get(i).linearMotion(linearX.get(i),linearY.get(i),2*PI/linearMotion.size()*i);
         }
         
       }
       for(int i=0;i<linearMotion.size();i++){
         if((int)random(250)==1){
           viper.add(linearMotion.get(i).fire());
         }
       }
     }
     if(mode==4){
       textSize(50);
       if(score>highScore){
         highScore=score;
       }
       if(win==true){
         text("YOU WON ",300,500);
       }
       text("YOUR SCORE: "+score,300,300);
      // text("HIGH SCORE: "+highScore,300,500);
      hero.setLife(true);
    
   }
     }
 
   
 //  for(int i=0;i<missile.size();i++){
   //  for(int j=0;j<viper.size();j++){
     //  if(missile.get(i).isTouching(viper.get(j))){
       //  viper.remove(j);
         //j--;
         //missile.remove(i);
         //i--;
         //break;
       //}
     //}
   //}
 
 
