import processing.sound.*;

final float GRAVITY = .3;

//SOUND
SoundFile bgMusic;
SoundFile jumpFile;
SoundFile zombieFile;

//FUNCTIONALS
float gravitySpeed = 0;
int speed = 1;
int displayWidth = 1100;
int displayHeight = 700;

//TEST 
int level = 1;

//CLASS OBJECTS
Sprite sprite = new Sprite(displayWidth/10, 0);
Background bg = new Background(0, 0);
Foe[] foes = {new Foe(200/3, 312/3)};
Score score = new Score(0);
GameOver gameOver = new GameOver(false);

void setup(){ 
  size(displayWidth, displayHeight);
  loadSounds();
  loadImages();
}

void draw(){
  if(gameOver.isGameOver()){
    bg.reset();
    sprite.reset();
    foes[0].reset();
    gameOver.paint();
    score.paintEnd();
    level = 1;
    speed = 1;
  }
  else{
    calcLevel();
    calcGravity();
    drawImages();
    foes[0].updatePos(speed, zombieFile);
    score.paintCurrent(level);
    gameOver.setGameOver(foes[0].getCoord(), foes[0].getSize(), sprite.getCoord(), sprite.getSize(), zombieFile);
  }
}

void calcLevel(){
  level = score.getLevel() > 0 ? score.getLevel() : level;
  if(level % 2 == 0 && score.getScore() % 1000 == 0){
    speed ++;
  }
}

void drawImages(){
  bg.paint();
  foes[0].paint(speed);
  sprite.paint(bg.getGroundPos());
}

void keyPressed() {
  float spriteY = sprite.getCoord()[1];
  float spriteX = sprite.getCoord()[0];
  
  if (keyCode == UP && spriteY == 0 && !gameOver.isGameOver()) {
    gravitySpeed = - 10;
    sprite.setImgCount(0);
    jumpFile.play();
  }
  if(key == ' ' && gameOver.isGameOver()){
    gameOver.setGameOver(false);
    score.reset();
  }
  if (keyCode == RIGHT) {
    sprite.setCoord(spriteX + 10, 0);
  } else if (keyCode == LEFT) {
    sprite.setCoord(spriteX - 10, 0);
  } 
}

void calcGravity(){
  float spriteY = sprite.getCoord()[1];
  sprite.setCoord(spriteY + gravitySpeed, 1);
  gravitySpeed = gravitySpeed + GRAVITY;
  if(sprite.getCoord()[1] > 0){
    sprite.setCoord(0, 1);
  }
}

void loadSounds(){
  bgMusic = new SoundFile(this, "sounds/beat.mp3");
  jumpFile = new SoundFile(this, "sounds/jump.mp3");
  zombieFile = new SoundFile(this, "sounds/zombie.wav");
  bgMusic.loop();
}

void loadImages(){
  sprite.loadRunImg();
  sprite.loadJumpImg(253/2, 232/2);
  foes[0].loadWalkImg("zombie/walk/", "png");
  foes[0].loadSpawnImg("zombie/appear/", "png");
  bg.loadImg("background.jpg");
  gameOver.loadImg("gameOver/gameOver-", "png");
}

 
