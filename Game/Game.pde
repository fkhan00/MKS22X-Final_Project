int stage = 1;
void menu(){
  //fill(255, 165, 0);
  //rect(165, 165, 300, 200);
  //textSize(32);
  //text("10 More Bullets",  190, 265);
  fill(0);
  textSize(25);
  text("Click anywhere to play", 168, 350);
  textSize(15);
  text("By Fakharyar Khan and Alexander Zou", 168, 375);
}

void setup(){
  size(600, 600);
  background(255, 103, 31);
}

void scenery(){
  setup();
  line(0, 4 * height / 5, width, 4 * height / 5);
  fill(40);
  rect(0, 4 * height / 5, width, height / 5);
}

void draw(){
  if(stage == 1){
    PImage menu = loadImage("Menu.png");
    image(menu, 0, 0, width, height);
    menu();}
  if(stage == 1 && mousePressed){
    scenery();
    stage = 2;}}