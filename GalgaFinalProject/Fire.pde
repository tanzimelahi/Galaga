public abstract class Bullet{
  float x;
  float y;
  public Bullet(){
  }
  void move(){
   this.y-=10;
   display(this.y);
  }
  void display(float y){
  }
}
public class heroBullet extends Bullet{
  float x,y;
  Player creature;
  public heroBullet(Player crea){
    creature=crea;
    this.x=creature.x;
    this.y=creature.y;
  }
  void display(){
    fill(255,0,0);
    triangle((x+30+x)/2-5,y,(x+30+x)/2,y-40,(x+30+x)/2+5,y);
  }
   void display(float y){
    fill(255,0,0);
    triangle((x+30+x)/2-5,y,(x+30+x)/2,y-40,(x+30+x)/2+5,y);
  }
  void move(){
    this.y-=10;
    display(this.y);
  }
  
  boolean isTouching(Red villain){
    float xcord=(x+30+x)/2;
    float ycord=y;
    float tallness=Math.abs(villain.getY()-ycord);
    if(tallness<=55){// the range is done
      float HOS=40-tallness+15;
      float base=HOS/4.0;
      float deltaX=Math.abs(villain.getX()-xcord);
      if(deltaX<=15+base){
        return true;
      }
      else{
        return false;
      }  
    }
    return false;
  }
  boolean isTouching(monsterBullet villain){
    float xcord=(x+30+x)/2;
    float ycord=y;
    float tallness=Math.abs(villain.getY()-ycord);
    if(tallness<=55){// the range is done
      float HOS=40-tallness+15;
      float base=HOS/4.0;
      float deltaX=Math.abs(villain.getX()-xcord);
      if(deltaX<=15+base){
        return true;
      }
      else{
        return false;
      }  
    }
    return false;
  }
}
