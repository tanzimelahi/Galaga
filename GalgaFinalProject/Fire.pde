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
public class monsterBullet extends Bullet{
  float x,y;
   Red creature;
   public monsterBullet(Red creature){
     this.creature=creature;
     this.x=creature.x;
     this.y=creature.y;
   }
   float getX(){
     return this.x;
   }
   float getY(){
     return this.y;
   }
   void display(float y){
     fill(0);
     ellipse(this.x,y,10,10);
     triangle(this.x-5,y,this.x,y-10,this.x+5,y);
     triangle(this.x,y+5,this.x,y-5,this.x-10,y);
     triangle(this.x,y+5,this.x,y-5,this.x+10,y);
     triangle(this.x-5,y,this.x+5,y,this.x,y-10);
     
   }
   void move(){
    this.y+=10;// change this
    display(this.y);
  }
  boolean isTouching(Player hero){
    float deltaX=this.x-hero.getX();
    if(deltaX<-15 || deltaX>45){
      return false;
    }
    float slope=(-this.y+hero.getY())/deltaX;
    float angle=Math.abs(atan(slope));
    if(angle<0){
      
    }
    float heightOfSeparation=sin(angle)*dist(this.x,this.y,hero.getX(),hero.getY());
    float HOS=heightOfSeparation;
    if(HOS<=15){
      return true;
    }
    else if(HOS<=55){
      float tallness=40-HOS+15;
      if(deltaX<=15){
        float base=tallness/4.0;
        float xcor=hero.getX()+15-base;
        float ycor=hero.getY()-40+tallness;
        if(dist(this.x,this.y,xcor,this.y)<=15){
          
          return true;
        }
        else{
          
          
          return false;
        }
      }
      else{
        float base=tallness/4;
        float xcor=hero.getX()+15+base;
        float ycor=hero.getY()-40+tallness;
        if(dist(this.x,this.y,xcor,this.y)<=15){
          
          return true;
        }
        else{
          return false;
        }
       }
    }
      else{
        return false;
      }
    }
  }
