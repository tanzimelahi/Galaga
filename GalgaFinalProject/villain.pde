 class Player{
  float x,y;
  boolean isAlive;
  public Player(){
     x=20;
     y=500;
     isAlive=true;
  }
  float getX(){
    return this.x;
  }
  float getY(){
    return this.y;
  }
  boolean getLife(){
    return isAlive;
  }
}
