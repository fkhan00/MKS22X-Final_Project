public abstract class Ships{
  int lanes[] = {25, 75, 125, 175, 225, 300, 350};
  float posY;
  float posX;
  int speed, health, points;
  
  public int getHealth(){
    return health;
  }
  
  public void move(){
    posX += speed;
  }
  
  public void damaged(Bullet weapon){
    health -= weapon.getDamage();
  }
  public abstract void display();
  
}

public class Drone extends Ships{
  public Drone(int vel){
    posY = lanes[(int) (Math.random() * lanes.length)];
    if(Math.random() <= 0.5){
     posX = width - 10;
     speed = -1 * vel;
    }
    else{
      posX = 10;
      speed = vel;
    }
    health = 1;
    points = 1;
  }
  
  public void display(){
    if(health != 0){
    fill(0, 0, 255);
    ellipse(posX, posY, 50.0, 50.0);
    //triangle(posX, posY, posX + 50, posY, posX, posY - 50);
    }      
  }
}