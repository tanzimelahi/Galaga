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
