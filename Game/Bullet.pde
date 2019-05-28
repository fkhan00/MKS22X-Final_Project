public class Bullet{
  public int combo;
  public float x, y, speedX, speedY;
  
  public Bullet(int comb, float xCord, float yCord, float sX, float sY){
    speedX = sX; speedY = sY;
    combo = comb;
    x = xCord;
    y = yCord;
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
    for (int a = 0; a < 360; a += (360/newComb)) {
      newStuff.add(new Bullet(newComb,x,y,5*cos(a*(PI/180)),5*sin(a*(PI/180))));
    }
    return newStuff;
  }
  
}
