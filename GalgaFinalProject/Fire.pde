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
}
