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
     fill(0, 0, 255);
     //ellipse(posX, posY, 50.0, 50.0);
     int a = 15;
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
      look = loadImage("FighterLeft.png");
      posX = width - 10;
      speed = -1 * vel;
    }
    else{
      look = loadImage("Fighter.png");
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
   fill(132, 112, 255);
   //rect(posX - 15, posY - 15, 30, 30, 30);
   image(look, posX-50, posY - 50, 100, 100);
   textSize(15);
   text(""+health,posX,posY);
 }
 boolean type(String type){
   return type.equals("Fighter");
 }
}

public class Speedster extends Ships{
  public Speedster(){
   if(Math.random() <= 0.5){
     look = loadImage("SpeedsterLeft.png");
    posX = width - 10;
     speed = -6;
   }
   else{
     look = loadImage("Speedster.png");
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
   //fill(0, 0, 255);
   //beginShape();
   //vertex(posX - 15, posY);
   //vertex(posX, posY + 15);
   //vertex(posX + 15, posY);
   //vertex(posX, posY - 15);
   //endShape();
   if(speed < 0){
     image(look, posX - 15, posY - 15, 26, 26);
   }
   image(look, posX-15, posY - 15, 35, 35);
 }
 boolean type(String type){
   return type.equals("Speedster");
 }
}

public class Armada extends Ships {
  public Armada(){
       if(Math.random() <= 0.5){
     //look = loadImage("SpeedsterLeft.png");
    posX = width - 10;
     speed = - 1;
   }
   else{
     //look = loadImage("Speedster.png");
     posX = 10;
     speed = 1;
   }
   health = 15;
   points = 20;
  }
  boolean type(String type){
    return type.equals("Armada");
  }
  void display(){
    ellipse(posX, posY, 30, 30);
  }
}