public abstract class Ships{
  private int lanes[] = {30, 60, 90, 120, 150, 180, 210, 240, 270, 300};
  public float posY =  lanes[(int) (Math.random() * lanes.length)];
  public float posX;
  public int speed, health, points;
  PImage look;
  
  public void move(){
    posX += speed;
  }
  abstract void display();
  abstract boolean type(String type);
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
    look = loadImage("drone.png");
    look.resize(30,30);
  }
  
 public void display(){
   if(health != 0){
     //fill(0, 0, 255);
     ////ellipse(posX, posY, 50.0, 50.0);
     //int a = 15;
     //if(speed < 0){
     //  triangle(posX - a, posY, posX + a, posY - a, posX + a, posY + a);
     //}
     //else{
     //  triangle(posX + a, posY, posX -a, posY + a, posX - a, posY - a);
     //}
     image(look, posX-15, posY-15);
   }
 }
 boolean type(String type){
   return type.equals("Drone");
 }
}

public class Fighter extends Ships{
  public Fighter(int vel){
    if(Math.random() <= 0.5){
      posX = width - 10;
      speed = -1 * vel;
    }
    else{
      posX = 10;
      speed = vel;
    }
    health = 2;
    points = 4;
  }
  
 void display(){
   if(health == 0){
     return;
   }
   fill(0, 0, 255);
   rect(posX - 15, posY - 15, 30, 30, 30);
 }
 boolean type(String type){
   return type.equals("Fighter");
 }
}

public class Speedster extends Ships{
  public Speedster(){
   if(Math.random() <= 0.5){
    posX = width - 10;
     speed = -6;
   }
   else{
     posX = 10;
     speed = 8;
   }
   health = 1;
   points = 8;
 }
 void display(){
   if(health == 0){
     return;
   }
   fill(0, 0, 255);
   beginShape();
   vertex(posX - 15, posY);
   vertex(posX, posY + 15);
   vertex(posX + 15, posY);
   vertex(posX, posY - 15);
   endShape();
 }
 boolean type(String type){
   return type.equals("Speedster");
 }
}
