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
  abstract void move2();
  abstract void display();
}
class Red extends Monster{
  public Red(){
    super();
    
  }
  
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
  void move2(){
  }
  void display(){
     if(this.colors==0){
     fill(255,0,0);
    }
    else if(this.colors==1){
      fill(0,255,0);
    }
    else{
     fill(0,0,255);
    }
    ellipse(this.x,this.y,15,15);
    
  }
  void display(int a,int b,int c){
    fill(a,b,c);
    ellipse(this.x,this.y,100,100);
  }
  
}
