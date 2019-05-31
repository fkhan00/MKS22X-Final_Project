public class Pickups{
  float y, x;
  int duration, tLimit;
  int speed = 2;
  String upgrade;
  PImage visual;
  
  void move(){
    y += speed;
  }
  
  void display(){
    image(visual, x, y);
  }
}


public class DoublePoints extends Pickups {
  public DoublePoints(float posX, float posY) {
    upgrade = "Double Points";
    y = posY; x = posX;
    duration = 5000;
    visual = loadImage("DoublePoints.png");
  }
}

public class UnlimitedBullets extends Pickups{
  public UnlimitedBullets(float posX, float posY){
    upgrade = "Unlimited Bullets";
    y = posY; x = posX;
    duration = 5000;
  }
  void display(){
    fill(0,255,0);
    rect(x, y, 20, 20);
  }
}

public class PiercingBullets extends Pickups{
  public PiercingBullets(float posX, float posY){
    upgrade = "Piercing Bullets";
    y = posY; x = posX;
    duration = 10000;
  }
  
  void display(){
    fill(0, 255, 255);
    rect(x, y, 20, 20);
  }
}

public class MoreShips extends Pickups {
  public MoreShips(float posX, float posY) {
    upgrade = "More Ships";
    y = posY; x = posX;
    duration = 10000;
  }
  
  void display() {
    fill(255);
    rect(x, y, 20, 20);
  }
}
public class OneMore extends Pickups{
  public OneMore(float posX, float posY) {
    visual = loadImage("OneBullet.png");
    upgrade = "One More";
    y = posY; x = posX;
    duration = 10000;
    }
    
}
public class Coin extends Pickups {
  public int amt;
  public Coin(float posX, float posY) {
    upgrade = "Coin";
    y = posY; x = posX;
    duration = 0;
    amt = ((int) random(10))+1;
    visual = loadImage("coin.png");
    visual.resize((int)((amt/50.0)*100),(int)((amt/50.0)*100));
  }
  
}
