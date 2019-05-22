public abstract class Ships{
  private int lanes[] = {30, 60, 90, 120, 150, 180, 210, 240, 270, 300};
  public float posY =  lanes[(int) (Math.random() * lanes.length)];
  public float posX;
  public int speed, health, points;
  
  public void move(){
    posX += speed;
  }
  abstract void display();
}
  
public class Drone extends Ships{
  public Drone(int vel){
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
     //ellipse(posX, posY, 50.0, 50.0);
     int a = 15;
     if(speed < 0){
       triangle(posX - a, posY, posX + a, posY - a, posX + a, posY + a);
     }
     else{
       triangle(posX + a, posY, posX -a, posY + a, posX - a, posY - a);
     }
   }
 }
}