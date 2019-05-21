public class Bullet{
  public int damage, speedX, speedY, combo;
  public float x, y;
  
  public Bullet(int comb, float xCord, float yCord, int sX, int sY){
    damage = 1;
    speedX = sX; speedY = sY;
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
    x += speedX;
    y += speedY;
  }
  
  public ArrayList<Bullet> explode(float x, float y) {
    ArrayList<Bullet> newStuff = new ArrayList<Bullet>();
    int newComb = this.combo+1;
    if (newComb == 2) {
       newStuff.add(new Bullet(newComb,x,y,10,0));
       newStuff.add(new Bullet(newComb,x,y,-10,0));
    }
    return newStuff;
  }
  
}
