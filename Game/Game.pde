int stage;
ArrayList<Bullet> ammo;
ArrayList<Bullet> onScreen;

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

void setup(){
  size(1000, 600);
  background(255, 103, 31);
  stage = 1; ammo = new ArrayList<Bullet>();
  for (int i = 0; i < 10; i++) {
    Bullet b = new Bullet(1,475,400);
    ammo.add(b);
  }
  onScreen = new ArrayList<Bullet>();
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
    if (keyPressed && ammo.size() > 0) {
      onScreen.add(ammo.remove(0));
    }
    for (Bullet b : onScreen) {
      b.display();
      b.move();
    }
    
  }
}
