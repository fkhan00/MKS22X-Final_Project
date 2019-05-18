public class Bullet{
  public int damage,speed, combo;
  public float x,y;
  
  public Bullet(int comb, float xCord, float yCord){
    damage = 1;
    speed = 5;
    combo = comb;
    x = xCord;
    y = yCord;
  }
  
  public int getDamage(){
    return damage;
  }
  
  public void changeDamage(int incr){
    damage += incr;
  }
  
  public void display(){
    fill(255, 0, 0);
    ellipse(x, y, 10, 10);
  }
  
  public void move(){
    y += speed;
  }
   
}
