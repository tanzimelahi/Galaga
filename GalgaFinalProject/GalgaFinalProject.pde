float x;
int y;
float angle;
int increment;
float time=millis();
float timePassed;
ArrayList<Monster>enemy;
ArrayList<Float>initialPos;
ArrayList<heroBullet>missile;
ArrayList<monsterBullet>viper;
Player hero;
void setup(){
  size(600,600);
  int yPlace=0;// initiates the ycord of the monsters
  int yPlace2=0;// same as yPlace on the other side of the screen
  enemy=new ArrayList<Monster>();
  hero=new Player();
  missile=new ArrayList<heroBullet>();
  viper=new ArrayList<monsterBullet>();
  initialPos=new ArrayList<Float>();
  int number=(int)random(10)+10;// gives the size of the list enemy(num of monsters)
  for(int i=0;i<number;i++){
    enemy.add(new Red());
  }
  for(int i=0;i<enemy.size();i++){
    if(random(2)>=1){
      enemy.get(i).setX(random(width));
      enemy.get(i).setY(yPlace);
      enemy.get(i).setColors((int)random(3));
      initialPos.add(enemy.get(i).getY());
      yPlace+=30;
      viper.add(enemy.get(i).fire());
      
    }
    else{
      enemy.get(i).setX(random(width));
      enemy.get(i).setY(yPlace2);
      enemy.get(i).setIncrement(-5);
      enemy.get(i).setColors((int)random(3));
      initialPos.add(enemy.get(i).getY());
      yPlace2+=30;
    }
  }
 
}
 
 void draw(){
 background(255);
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
     missile.add(hero.fire());
   }
   
  }
  System.out.println(keyCode);
  for(int i=0;i<enemy.size();i++){
     enemy.get(i).move(1,initialPos.get(i));
   if(enemy.get(i).getX()<0 || enemy.get(i).getX()>width){
     enemy.get(i).reverseIncrement();
     initialPos.set(i,initialPos.get(i)+10);
   }
 }
   if(missile.size()!=0){
     for(int i=0;i<missile.size();i++){
       missile.get(i).move();
     }
   }
 
 
}
