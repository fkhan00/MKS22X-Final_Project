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
    rect(x, y, 20, 20);
  }
}
