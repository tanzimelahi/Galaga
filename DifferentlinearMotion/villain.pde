abstract class Monster{
  String name;
  float x,y;
  int increment;
  int colors;// colors must be either 0,1 or 2
  public Monster(){
    this.name="";
    this.x=0;
    this.y=0;
    this.increment=10;
  }
  public String getName(){
    return this.name;
  }
  public int getColors(){
    return this.colors;
  }
  public void setColors(int num){
    this.colors=num;
  }
  public int getIncrement(){
    return this.increment;
  }
  public void reverseIncrement(){
    this.increment=-1*increment;
  }
  void setIncrement(int num){
    this.increment=num;
  }
  public float getX(){
    return this.x;
  }
  public float getY(){
    return this.y;
  }
  public void setX(float num){
    this.x=num;
  }
  public void setY(float num){
    this.y=num;
  }
  abstract void move(int num,float ycord);
  abstract void move2(float x,float y,float slope);
  abstract void display();
}
class Red extends Monster{
  
  void move(int num,float ycord){
    float x=this.x;
    if(colors==0){
     fill(255,0,0);
    }
    else if(colors==1){
      fill(0,255,0);
    }
    else{
     fill(0,0,255);
    }
    if(num==0){
        ellipse(x,-height/4*sin(PI*x/(width/4))+ycord,15,15);
    }
    else if(num==1){
      ellipse(x,10*sin(PI*x/(width/4))+ycord,15,15);
    }
    this.x+=this.increment;
    this.y=10*sin(PI*x/(width/4))+ycord;
    
  }
  void move2(float x,float y,float slope){
     if(this.x==x && this.y==y){
     }
     else if(this.x==x){
       y+=1;
     }
     else{
       this.y=slope*(x-this.x)+y;
       if(x>this.x){
         this.x=this.x+0.002;
       }
       else{
         this.x=this.x-0.002;
       }
     }
  }
  void display(){
    ellipse(this.x,this.y,15,15);
    
  }
  void display(int a,int b,int c){
    fill(a,b,c);
    ellipse(this.x,this.y,100,100);
  }
  monsterBullet fire(){
    monsterBullet missile=new monsterBullet(this);
    return missile;
  }
    boolean isTouching(Player hero){
    float deltaX=this.x-hero.getX();
    if(deltaX<-15 || deltaX>45){
      return false;
    }
    float slope=(-this.y+hero.getY())/deltaX;
    float angle=Math.abs(atan(slope));
    if(angle<0){
      System.out.println(angle);
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
          System.out.println(2);
          return true;
        }
        else{
          System.out.println(ycor+" "+ xcor+" "+ dist(this.x,this.y,xcor,ycor));
          
          return false;
        }
      }
      else{
        float base=tallness/4;
        float xcor=hero.getX()+15+base;
        float ycor=hero.getY()-40+tallness;
        if(dist(this.x,this.y,xcor,this.y)<=15){
          System.out.println(3);
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
    void circle(float angle,float radius,float initX,float initY){
      float transX,transY;
      transX= initX-radius;
      this.x=radius*cos(angle)+transX;
      transY=initY-radius;
      this.y=radius*sin(angle)+transY;
    }
    float linearMotion(float x,float y,float angle){// the x and y values will have to be stored in an arraylist
      this.y=-1*atan(angle)*(x-this.x)+y;
      this.x+=2;
      return this.y;
      
    }
  
  
}
