int stage, timeB, timeS, points;
float spawnRate;
ArrayList<Bullet> ammo;
ArrayList<Bullet> onScreen;
ArrayList<Ships> enemies;
int maxCombo = 5;
String troops[] = {"Drones", "Fighter", "Speedster"};

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
  background(255,103,31);
  line(0, 4 * height / 5, width, 4 * height / 5);
  fill(40);
  rect(0, 4 * height / 5, width, height / 5);
  fill(255,0,0);
  rect(425,450,100,100);
  rect(450,400,50,100);
}

void play() {
  fill(0, 255, 0);
  textSize(32);
  text("SCORE: " + points, 840, 40);
  textSize(15);
  if (timeS+(spawnRate*1000) < millis()) {
    String recruit = troops[(int)(Math.random() * troops.length)];
    if(recruit.equals("Drones")){
      enemies.add(new Drone(3)); 
    }
    else if(recruit.equals("Fighter")){
      enemies.add(new Fighter(3));
    }
    else if(recruit.equals("Speedster")){
      enemies.add(new Speedster());
    }
    timeS = millis();
  }
  for(int i = enemies.size() - 1; i >=  0; i--){
    enemies.get(i).display();
    enemies.get(i).move();
    if(enemies.get(i).posX >= width || enemies.get(i).posX <= 0){
      enemies.remove(i);
    }
  }
  //text("timer: "+timeB+" time: "+millis(),10,20);
  if (keyPressed && ammo.size() > 0 && timeB+250 < millis()) {
    onScreen.add(ammo.remove(0));
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
      if (b.combo-1 >= maxCombo) {b.combo = maxCombo;}
      if((Math.abs(b.x-e.posX) <= 15) && Math.abs(b.y-e.posY) <= 15){
        e.health--;
        if (b.combo-1 >= maxCombo) {b.combo = maxCombo;}
        if(e.health <= 0){
          ArrayList<Bullet> stuff = b.explode(e.posX,e.posY);
          for (Bullet n : stuff) {onScreen.add(n);}
          points += enemies.remove(j).points;
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
  for (int i = 0; i < 10; i++) {
    Bullet b = new Bullet(1,475,600,0,-15);
    ammo.add(b);
  }
  onScreen = new ArrayList<Bullet>();
  spawnRate = 0.5;
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
    if(ammo.size() == 0 && onScreen.size() == 0){
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
