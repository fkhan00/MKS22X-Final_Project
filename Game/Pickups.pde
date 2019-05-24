public abstract class Pickups{
  float y, x,duration;
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
    duration = 5000.0;
  }
  void display(){
    fill((float)Math.random() * 255, (float)Math.random() * 255, (float)Math.random() * 255);
    rect(x, y, 20, 20);
  }
}

public class UnlimitedBullets extends Pickups{
   public UnlimitedBullets(float posX, float posY){
     upgrade = "UnlimitedBullets";
    y = posY;
    x = posX;
    duration = 5000.0;
  }
  void display(){
    fill((float)Math.random() * 255, (float)Math.random() * 255, (float)Math.random() * 255);
    rect(x, y, 20, 20);
  }
}
