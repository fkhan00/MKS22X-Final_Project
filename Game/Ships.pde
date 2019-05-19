public abstract class Ships{
  float posY = (int) (Math.random() *  3 * height / 5);
  float posX;
  int speed, health, points;
  
  public int getHealth(){
    return health;
  }
  
  public void move(){
    if(posX >= width || posX <= 0){
      health = 0;
    }
    posX += speed;
  }
  
  public abstract void display();
  
}
