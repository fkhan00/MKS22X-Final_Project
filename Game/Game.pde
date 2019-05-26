int stage, points;
int timeB, timeD, timeF, timeS;
float spawnRate;
ArrayList<Bullet> ammo;
ArrayList<Bullet> onScreen;
ArrayList<Ships> enemies;
int maxCombo = 6,  multiplier = 1;
String pick[] = {"DoublePoints", "UnlimitedBullet"};
boolean noLimit = false;
//ArrayList<Integer> active = new ArrayList<Integer>();
ArrayList<Pickups> enhance = new ArrayList<Pickups>();
ArrayList<Pickups> active = new ArrayList<Pickups>();
PImage back;


void menu(){
  fill(255, 165, 0);
  rect(360, 200, 300, 200);
  fill(0);
  textSize(32);
  text("Only 10 Bullets",  390, 265);
  textSize(25);
  text("Click anywhere to play", 375, 350);
  textSize(15);
  text("By Fakharyar Khan and Alexander Zou", 375, 375);
}

void scenery(){
  //background(255,103,31);
  image(back,0,0);
  //line(0, 4 * height / 5, width, 4 * height / 5);
  //fill(40);
  //rect(0, 4 * height / 5, width, height / 5);
  fill(255,0,0);
  rect(425,450,100,100);
  rect(450,400,50,100);
}

void play() {
  fill(0);
  textSize(32);
  text("SCORE: " + points, 40, 40);
  textSize(30);
  String am = "";
  for(int i = 0; i < ammo.size(); i++){
     am += "*";}
  text(am, 800, 40);
  textSize(15);
  if (timeD+(spawnRate*1000) < millis()) {
    enemies.add(new Drone(3));
    timeD = millis();
  }
  if (timeF+(spawnRate*10000) < millis()) {
    enemies.add(new Fighter(3));
    timeF = millis();
  }
  if (timeS+(spawnRate*15000) < millis()) {
    enemies.add(new Speedster());
    timeS = millis();
  }
  for(int i = 0; i < enhance.size(); i++){
    Pickups p = enhance.get(i);
    p.display();
    p.move();
    if(p.y >= 4 * height / 5){
      if(p.upgrade.equals("DoublePoints")){
        p.tLimit = millis()+p.duration;
        active.add(p);
      }
      else if(p.upgrade.equals("UnlimitedBullets")){
        p.tLimit = millis()+p.duration;
        active.add(p);
      }
      enhance.remove(i); i--;
    }
  }
  
  //FOR FUTURE PICKUPS:
  //run through the active list, apply the method, then in the last loop check for time limit
  noLimit = false;
  for (int i = 0; i < active.size(); i++) {
    if (active.get(i).upgrade.equals("UnlimitedBullets")) {noLimit = true;}
  }
  multiplier = 1;
  for (int i = 0; i < active.size(); i++) {
    if (active.get(i).upgrade.equals("DoublePoints")) {multiplier = 2;}
  }
  //main loop for time limits (do not need to edit)
  for (int i = 0; i < active.size(); i++) {
    text(active.get(i).upgrade,40,80+(i*15));
    if (active.get(i).tLimit <= millis()) {
      active.remove(i);
      i--;
    }
  }
  
  for(int i = enemies.size() - 1; i >=  0; i--){
    enemies.get(i).display();
    enemies.get(i).move();
    if(enemies.get(i).posX >= width || enemies.get(i).posX <= 0){
      enemies.remove(i);
    }
  }
  //text("timer: "+timeB+" time: "+millis(),10,20);
  if (keyPressed && ammo.size() > 0 && timeB + 250 < millis()) {
    if (noLimit) {onScreen.add(new Bullet(1,475,400,0,-15));}
    else {onScreen.add(ammo.remove(0));}
    timeB = millis();
  }
  for (int i = 0; i < onScreen.size(); i++) {
    Bullet b = onScreen.get(i);
    b.display();
    b.move();
    if (b.x < 0 || b.x > 1000 || b.y < 0 || b.y > 600) {
      onScreen.remove(b); i--;
    }
  }
  for(int i = 0; i < onScreen.size() && i >= 0; i++) {
    for(int j = 0; j < enemies.size() && j >= 0 && i < onScreen.size(); j++) {
      Ships e = enemies.get(j);
      Bullet b = onScreen.get(i);
      if (b.combo >= maxCombo) {b.combo = maxCombo-1;}
      if((Math.abs(b.x-e.posX) <= 15) && Math.abs(b.y-e.posY) <= 15){
        e.health--;
        if (b.combo-1 >= maxCombo) {b.combo = maxCombo;}
        if(e.health <= 0){
          ArrayList<Bullet> stuff = b.explode(e.posX,e.posY);
          for (Bullet n : stuff) {onScreen.add(n);}
          
          //pickup drop
          if(e.type("Fighter")){
            int index = (int)(Math.random() * pick.length);
            if(pick[index].equals("DoublePoints")){
              enhance.add(new DoublePoints(e.posX, e.posY));
            }
            else if(pick[index].equals("UnlimitedBullet")){
              enhance.add(new UnlimitedBullets(e.posX, e.posY));
            }
          }
          
          points += enemies.remove(j).points*multiplier;
          if (j > 0) j--;
        }
        onScreen.remove(i);
        if (i > 0) i--;
      }
    }
  }
}

void GO() {
  scenery();
  enemies = new ArrayList<Ships>();
  fill(0);
  textSize(100);
  text("GAME OVER", 0.63*width/3, height/2);
  textSize(20);
  text("Click to play again", width/2-110, height/2+50);
}

void restart() {
  ammo = new ArrayList<Bullet>();
  for (int i = 0; i < 10; i++) {
    Bullet b = new Bullet(1,475,400,0,-15);
    ammo.add(b);
  }
  onScreen = new ArrayList<Bullet>();
  spawnRate = 0.5; points = 0;
}

void setup(){
  size(1000, 600);
  background(255, 103, 31);
  stage = 1; ammo = new ArrayList<Bullet>(); enemies = new ArrayList<Ships>();
  for (int i = 0; i <10; i++) {
    Bullet b = new Bullet(1,475,400,0,-15);
    ammo.add(b);
  }
  onScreen = new ArrayList<Bullet>();
  spawnRate = 0.5;
  back = loadImage("background.png");
  back.resize(width,height);
}

void draw(){
  if(stage == 1){
    //PImage menu = loadImage("Menu.png");
    //image(menu, 0, 0, width, height);
    menu();
    if (mousePressed) {stage = 2;}
  }
  if(stage == 2){
    scenery();
    play();
    if(ammo.size() == 0 && onScreen.size() == 0 && !noLimit){
      stage = 3;
    }
  }
  if (stage == 3) {
    GO();
    if (mousePressed) {
      restart();
      stage = 2;
    }
  }
}
