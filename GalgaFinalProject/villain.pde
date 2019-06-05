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
