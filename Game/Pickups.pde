public abstract class Pickups{
  float y, x;
  int duration, tLimit;
  int speed = 2;
  String upgrade;
  
  void move(){
    y += speed;
  }
  
  abstract void display();
}

public class DoublePoints extends Pickups{
  public DoublePoints(float posX, float posY){
    upgrade = "DoublePoints";
    y = posY;
    x = posX;
    duration = 5000;
  }
  void display(){
    fill(255,0,0);
    rect(x, y, 20, 20);
  }
}

public class UnlimitedBullets extends Pickups{
   public UnlimitedBullets(float posX, float posY){
     upgrade = "UnlimitedBullets";
    y = posY;
    x = posX;
    duration = 5000;
  }
  void display(){
    fill(0,255,0);
    rect(x, y, 20, 20);
  }
}
