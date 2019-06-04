int stage, points, multiplier;
int timeB, timeD, timeF, timeS, timeA;
float spawnRate;
ArrayList<Bullet> ammo;
ArrayList<Bullet> onScreen;
ArrayList<Ships> enemies;
int maxCombo = 6, coins = 0, highScore = 0, reload = 250;
float coinMult = 1;
String pick[] = {"Double Points", "One More", "Piercing Bullets", "Unlimited Bullets", "More Ships"};
boolean noLimit = false, piercing = false;
ArrayList<Pickups> enhance = new ArrayList<Pickups>();
ArrayList<Pickups> active = new ArrayList<Pickups>();
PImage back, cannon;
int upC, upR, upM;

void menu(){
  background(255, 103, 31);
  //fill(255, 165, 0);
  //rect(360, 200, 300, 200);
  fill(20);
  textSize(100);
  text("Only 10 Bullets",  150, 250);
  fill(255, 165, 0);
  if (mouseX >= 325 && mouseX <= 415 && mouseY >= 285 && mouseY <= 360) {
    fill(255, 255, 0);
  }
  rect(325, 285, 90, 75);
  fill(255, 165, 0);
  if (mouseX >= 425 && mouseX <= 515 && mouseY >= 285 && mouseY <= 360) {
    fill(255, 255, 0);
  }
  rect(425, 285, 90, 75);
  fill(255, 165, 0);
  if (mouseX >= 525 && mouseX <= 615 && mouseY >= 285 && mouseY <= 360) {
    fill(255, 255, 0);
  }
  rect(525, 285, 90, 75);
  fill(20);
  textSize(16);
  text("Play", 355, 330);
  text("Rules", 450, 330);
  text("Shop", 550, 330);
  text("By Fakharyar Khan and Alexander Zou", 345, 375);
}

void gameOver() {
  highScore = max(highScore, points);
  scenery();
  enemies = new ArrayList<Ships>();
  enhance = new ArrayList<Pickups>();
  active = new ArrayList<Pickups>();
  background(255, 103, 31);
  fill(0);
  textSize(100);
  text("GAME OVER", 0.63*width/3, 2 * height/5);
  fill(255, 165, 0);
  if (mouseX >= 335 && mouseX <= 425 && mouseY >= 250 && mouseY <= 325) {
    fill(255, 255, 0);
  }
  rect(335, 250, 90, 75);
  fill(255, 165, 0);
  if (mouseX >= 435 && mouseX <= 525 && mouseY >= 250 && mouseY <= 325) {
    fill(255, 255, 0);
  }
  rect(435, 250, 90, 75);
  fill(255, 165, 0);
  if (mouseX >= 535 && mouseX <= 625 && mouseY >= 250 && mouseY <= 325) {
    fill(255, 255, 0);
  }
  rect(535, 250, 90, 75);
  fill(0);
  textSize(16);
  text("Play Again", 340, 300);
  text("Shop", 460, 300);
  text("Exit", 560, 300);
  textSize(20);
  text("High Score: " + highScore, width / 2 - 90, height /2 + 50);
  //text("Click to play again", width/2-110, height/2+70);
}

void scenery(){
  //background(255,103,31);
  image(back,0,0);
  //line(0, 4 * height / 5, width, 4 * height / 5);
  //fill(40);
  //rect(0, 4 * height / 5, width, height / 5);
  //fill(255,0,0);
  image(cannon, 425, 400);
  //rect(425,450,100,100);
  //rect(450,400,50,100);
}

void shop() {
  background(255, 103, 31);
  fill(0);
  textSize(75);
  text("Shop:",10,70);
  textSize(25);
  text("Coins: " + coins,10,105);
  
  //maxCombo upgrade
  String s = "Bigger Max Combo: Current: "+maxCombo+"   When Upgraded: ";
  if ((maxCombo == 10)) {s += "MAX";}
  else {s += (maxCombo+1);}
  text(s,10,150);
  fill(255, 165, 0);
  if (mouseX >= 850 && mouseX <= 980 && mouseY >= 130 && mouseY <= 150) {fill(255,255,0);}
  rect(850,130,130,20);
  textSize(12); fill(0);
  if (maxCombo < 10) {upC = (maxCombo-5)*50;}
  else {upC = 0;}
  text("Upgrade Cost: "+upC,860,145);
  if (mouseX >= 850 && mouseX <= 980 && mouseY >= 130 && mouseY <= 150 && mousePressed && coins >= upC && maxCombo < 10) {
    maxCombo++; coins -= upC;
    delay(100);
  }
  
  //reload upgrade
  textSize(25);
  String temp, upRNext = "";
  if (reload == 125) {temp = "1/8";}
  else if (reload == 200) {temp = "1/5"; upRNext = "1/8";}
  else {temp = "1/4"; upRNext = "1/5";}
  s = "Faster Reload Speed: Current: "+temp+"sec"+"   When Upgraded: ";
  if (reload == 125) {s += "MAX";}
  else {s += upRNext+"sec";}
  text(s,10,200);
  fill(255, 165, 0);
  if (mouseX >= 850 && mouseX <= 980 && mouseY >= 180 && mouseY <= 200) {fill(255,255,0);}
  rect(850,180,130,20);
  textSize(12); fill(0);
  if (reload == 250) {upR = 100;}
  else if (reload == 200) {upR = 200;}
  else {upR = 0;}
  text("Upgrade Cost: "+upR,860,195);
  if (mouseX >= 850 && mouseX <= 980 && mouseY >= 180 && mouseY <= 200 && mousePressed && coins >= upR && reload != 125) {
    if (reload == 250) {reload = 200;}
    else if (reload == 200) {reload = 125;}
    coins -= upR;
    delay(100);
  }
  
  //coinMult upgrade
  textSize(25);
  s = "Coin Multiplier: Current: "+coinMult+"   When Upgraded: ";
  if (coinMult == 2.0) {s += "MAX";}
  else {s += (coinMult+0.25);}
  text(s,10,250);
  fill(255, 165, 0);
  if (mouseX >= 850 && mouseX <= 980 && mouseY >= 230 && mouseY <= 250) {fill(255,255,0);}
  rect(850,230,130,20);
  textSize(12); fill(0);
  if (coinMult < 2) {upM = (int) ((coinMult-0.75)*100);}
  else {upM = 0;}
  text("Upgrade Cost: "+upM,860,245);
  if (mouseX >= 850 && mouseX <= 980 && mouseY >= 230 && mouseY <= 250 && mousePressed && coins >= upM && coinMult < 2) {
     coinMult += 0.25; coins -= upM;
     delay(100);
  }
  
  fill(0); textSize(15);
  text("Press any key to go back to the menu.",10,500);
}

void help() {
  background(255, 103, 31);
  fill(0);
  textSize(75);
  text("Rules:",10,70);
  textSize(16);
  text("Your goal is to get as highest score as possible (duh).",10,90);
  text("When in the game, press any key to fire.",10,110);
  text("When a bullet hits an enemy (and if this causes it to kill said enemy), it will explode into more bullets.",10,130);
  text("The bigger the \"combo\" of explosions, more bullets will appear when exploded, up to a maximum combo.",10,150);
  text("There are multiple types of enemies:",10,170);
  text("The Drone: has only one health point and has a chance to drop a coin of random value. The most abundant enemy and",50,190);
  text("will give one point when killed.",50,210);
  text("The Fighter: has two health points and will always drop a random pickup. Gives four points.",50,230);
  text("The Speedster: has one health point, moves quickly across the screen. When killed, all bullets of the explosion will",50,250);
  text("instantly have the maximum combo. Gives eight points.",50,270);
  text("The Armada: has fifteen health points, moves slowly. Killing it will drop a random pickup and give twenty points.",50,290);
  text("The pickups:",10,310);
  text("Red: Double Points. Your score will be doubled for the duration of the pickup. Lasts five seconds.",50,330);
  text("Green: Unlimited Bullets. You can fire for free. Lasts five seconds.",50,350);
  text("Cyan: Piercing Bullets. Bullets will pierce enemies and deal extra damage. Lasts ten seconds.",50,370);
  text("White: More Ships. Spawn rate for all ships will be halved. Lasts ten seconds.",50,390);
  text("Light Green: Extra Bullet. When picked up, you get an extra bullet to fire.",50,410);
  text("Pickup effects will not stack and will only last as long as the last one of a type to be picked up.",10,430);
  text("You lose when all bullets on screen are gone OR when you don't have an Unlimited Bullets pickup active.",10,450);
  text("Good Luck. You have Only 10 Bullets.",10,480);
  textSize(12);
  text("Press any key to go back to the Main Menu.",10,510);
}

void play() {
  //HUD-ing
  fill(0);
  if(points >= highScore) {
    fill(255, 0, 0);
    highScore = points;
  }
  fill(0);
  textSize(32);
  text("SCORE: " + points, 40, 40);
  fill(0);
  textSize(30);
  String am = "Ammo Left: ";
  for(int i = 0; i < ammo.size(); i++){
     am += "*";}
  text(am, 600, 40);
  textSize(15);
  text("Coins: " + coins, 600, 60);
  
  //enemy spawning
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
  if(timeA + (spawnRate*30000) < millis()){
    enemies.add(new Armada());
    timeA = millis();
  }
  
  //pickup movement
  for(int i = 0; i < enhance.size(); i++){
    Pickups p = enhance.get(i);
    p.display();
    p.move();
    if(p.y >= 4 * height / 5){
      if(p.upgrade.equals("Double Points")){
        p.tLimit = millis()+p.duration;
        active.add(p);
      }
      if(p.upgrade.equals("Unlimited Bullets")){
        p.tLimit = millis()+p.duration;
        active.add(p);
      }
      if(p.upgrade.equals("Piercing Bullets")){
        p.tLimit = millis()+p.duration;
        active.add(p);
      }
      if (p.upgrade.equals("More Ships")) {
        p.tLimit = millis()+p.duration;
        active.add(p);
      }
      if(p.upgrade.equals("One More")){
        ammo.add(new Bullet(1,475,400,0,-15));
      }
      if(p.upgrade.equals("Coin")){
        coins += (int) (((Coin) p).amt * coinMult);
      }
      enhance.remove(i); i--;
    }
  }
  
  //FOR FUTURE PICKUPS:
  //run through the active list, apply the method, then in the last loop check for time limit
  //EDIT: only need to run through the list once - just undo the effect before the loop and add the effect inside the loop
  //Remember: pickup effects don't stack, and an effect will last for the time limit of the last pickup of that type in active[]
  noLimit = false;
  multiplier = 1;
  piercing = false;
  spawnRate = 0.5;
  for (int i = 0; i < active.size(); i++) {
    Pickups p = active.get(i);
    if (p.upgrade.equals("Unlimited Bullets")) {noLimit = true;}
    if (p.upgrade.equals("Double Points")) {multiplier = 2;}
    if (p.upgrade.equals("Piercing Bullets")) {piercing = true;}
    if (p.upgrade.equals("More Ships")) {spawnRate = 0.25;}
  }
  
  //main loop for pickup time limits (do not need to edit)
  for (int i = 0; i < active.size(); i++) {
    fill(0);
    text(active.get(i).upgrade,40,80+(i*15));
    if (active.get(i).tLimit <= millis()) {
      active.remove(i);
      i--;
    }
  }
  
  //enemy movement (and despawn)
  for (int i = enemies.size() - 1; i >=  0; i--) {
    enemies.get(i).display();
    enemies.get(i).move();
    if(enemies.get(i).posX >= width || enemies.get(i).posX <= 0){
      enemies.remove(i);
    }
  }
  
  //basic bullet firing
  //text("timer: "+timeB+" time: "+millis(),10,20);
  if (keyPressed && timeB + reload < millis() && (ammo.size() > 0 || noLimit)) {
    if (noLimit) {onScreen.add(new Bullet(1,475,400,0,-15));}
    else {onScreen.add(ammo.remove(0));}
    timeB = millis();
  }
  //bullet movement
  for (int i = 0; i < onScreen.size(); i++) {
    Bullet b = onScreen.get(i);
    b.display();
    b.move();
    if (b.x < 0 || b.x > 1000 || b.y < 0 || b.y > 600) {
      onScreen.remove(b); i--;
    }
  }
  
  //enemy & bullet collisions
  for(int i = 0; i < onScreen.size() && i >= 0; i++) {
    for(int j = 0; j < enemies.size() && j >= 0 && i < onScreen.size(); j++) {
      Ships e = enemies.get(j);
      Bullet b = onScreen.get(i);
      if (b.combo >= maxCombo) {b.combo = maxCombo-1;}
      if ((Math.abs(b.x-e.posX) <= 15) && Math.abs(b.y-e.posY) <= 15) {
        e.health--;
        if (e.health <= 0) {
          //bullet explosion
          if (e.type("Speedster") || e.type("Armada")) {b.combo = maxCombo-1;}
          ArrayList<Bullet> stuff = b.explode(e.posX,e.posY);
          for (Bullet n : stuff) {onScreen.add(n);}
          //pickup drop
          if(e.type("Drone") && Math.random() <= 0.1){
            enhance.add(new Coin(e.posX, e.posY));
          }
          if(e.type("Fighter") || e.type("Armada")){
            int index = (int)(Math.random() * pick.length);
            if(pick[index].equals("Double Points")){
              enhance.add(new DoublePoints(e.posX, e.posY));
            }
            if (pick[index].equals("Unlimited Bullets")){
              enhance.add(new UnlimitedBullets(e.posX, e.posY));
            }
            if (pick[index].equals("Piercing Bullets")){
              enhance.add(new PiercingBullets(e.posX, e.posY));
            }
            if(pick[index].equals("One More")){
              enhance.add(new OneMore(e.posX, e.posY));
            }
            if(pick[index].equals("More Ships")){
              enhance.add(new MoreShips(e.posX, e.posY));
            }
          }
          //points, killing of bullets
          points += enemies.remove(j).points*multiplier;
          if (j > 0) j--;
        }
        if (!piercing) {onScreen.remove(i);}
        if (i > 0) i--;
      }
    }
  }
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
  stage = 1; ammo = new ArrayList<Bullet>(); enemies = new ArrayList<Ships>();
  for (int i = 0; i <10; i++) {
    Bullet b = new Bullet(1,475,400,0,-15);
    ammo.add(b);
  }
  onScreen = new ArrayList<Bullet>();
  spawnRate = 0.5;
  back = loadImage("background.png");
  back.resize(width,height);
  cannon = loadImage("cannon.png");
  cannon.resize(100,100);
}

void draw(){
  if (stage == 1) {
    menu();
    //if (mousePressed) {stage = 2;}
    if (mouseX >= 325 && mouseX <= 415 && mouseY >= 285 && mouseY <= 360 && mousePressed) {
      restart();
      stage = 2;
    }
    if (mouseX >= 425 && mouseX <= 515 && mouseY >= 285 && mouseY <= 360 && mousePressed) {stage = 4;}
    if (mouseX >= 525 && mouseX <= 615 && mouseY >= 285 && mouseY <= 360 && mousePressed) {stage = 3;}
  }
  
  if (stage == 2) {
    scenery();
    play();
    if(ammo.size() == 0 && onScreen.size() == 0 && !noLimit){
      stage = 5;
    }
  }
  
  if (stage == 3) {
    shop();
    if (keyPressed) {stage = 1;}
  }
  
  if(stage == 4) {
    help();
    if (keyPressed) {stage = 1;}
  }
  
  if (stage == 5) {
    gameOver();
    if (mouseX >= 335 && mouseX <= 425 && mouseY >= 250 && mouseY <= 325 && mousePressed) {
      restart();
      stage = 2;
    }
    if (mouseX >= 435 && mouseX <= 525 && mouseY >= 250 && mouseY <= 325 && mousePressed) {stage = 3;}
    if (mouseX >= 535 && mouseX <= 625 && mouseY >= 250 && mouseY <= 325 && mousePressed) {stage = 1; delay(100);}
  }
  if (stage == 6) {exit();}
}
