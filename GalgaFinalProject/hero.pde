public class Player{
  float x,y;
  public Player(){
     x=20;
     y=500;
  }
  void display(float x,float y){
    fill(255,0,0);
    rect(x,y,30,10);
    triangle((x+30+x)/2-5,y,(x+30+x)/2,y-40,(x+30+x)/2+5,y);
    rect( (x+30+x)/2-5,y+10,10,20);
  }
  void display(){
    fill(255,0,0);
    rect(x,y,30,10);
    triangle((x+30+x)/2-5,y,(x+30+x)/2,y-40,(x+30+x)/2+5,y);
    rect( (x+30+x)/2-5,y+10,10,20);
  }
  void move(int direction){// 1 right,-1 left
    if(this.x<-1 && direction==-1){
    }
    else if(this.x>=width-20 && direction==1){
    }
    else{
    this.x+=direction*10;
    display(this.x,this.y);
    }
    
  }
  heroBullet fire(){
    heroBullet  missile=new heroBullet(this);
    return missile;
  }
}
