float x;
int y;
float angle;
int increment;
float time=millis();
float timePassed;
ArrayList<Red>enemy;
ArrayList<Float>initialPos;
ArrayList<heroBullet>missile;
ArrayList<monsterBullet>viper;
boolean go;// lets the missile loose;
int countDown;
Player hero;
void setup(){
  size(1000,1000);
  int yPlace=0;// initiates the ycord of the monsters
  int xPlace=0;// same as yPlace on the other side of the screen
  enemy=new ArrayList<Red>();
  hero=new Player();
  missile=new ArrayList<heroBullet>();
  viper=new ArrayList<monsterBullet>();
  initialPos=new ArrayList<Float>();
  int number=(int)random(20)+10;// gives the size of the list enemy(num of monsters)
  countDown=0;
  for(int i=0;i<number;i++){
    enemy.add(new Red());
  }
  for(int i=0;i<enemy.size();i++){
    
      enemy.get(i).setX(random(1000));
      enemy.get(i).setY(random(200));
      enemy.get(i).setColors((int)random(3));
      initialPos.add(enemy.get(i).getY());
      yPlace+=40;  
      xPlace+=0;
  
 
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
  keyReleased();
  
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
       if((int)random(100)==1){
         viper.add(enemy.get(i).fire());
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
         break;        
       }
     }
   }
   for(int i=0;i<missile.size();i++){
     for(int j=0;j<viper.size();j++){
       if(missile.get(i).isTouching(viper.get(j))){
         viper.remove(j);
         j--;
         missile.remove(i);
         i--;
         break;
       }
     }
   }
 
 
}
