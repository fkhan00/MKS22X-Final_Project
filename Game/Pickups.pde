public abstract class Pickups{
  float y;
  int speed = 2;
  String upgrade;
  public Pickups(String improve, float posY){
    y = posY;
    upgrade = improve;
  }
  
  void move(){
    y += speed;
  }
  
  abstract void display();
}
  
