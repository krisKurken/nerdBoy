
class GameOver{
  
  PImage[] images = new PImage[110];
  boolean gameOver = false;
  int imgCount = 0;
  int playSpeed = 0;
  
  GameOver(boolean value){
    gameOver = value;
  }
  
  boolean setGameOver(float[] foeCoord, int[] foeSize, float[] spriteCoord, int[] spriteSize, SoundFile zombieSound){
    float foeX = foeCoord[0];
    float spriteX = spriteCoord[0];
    float spriteY = spriteCoord[1];
    int spriteWidth = spriteSize[0];
    
    
    if((spriteX + spriteWidth) > foeX && (spriteX + spriteWidth) < (foeX + foeSize[0]) && (spriteY * -1) < foeSize[1]){
      zombieSound.play();
      gameOver = true;
      return true;
    }
    return false;
  }

  void loadImg(String path, String fileEnding){
    for(int i = 0; i < images.length; i++){
      images[i] = loadImage(String.format("%s%d.%s",path, i, fileEnding));
      images[i].resize(displayWidth, displayHeight);
    } 
  }
  
  void setGameOver(boolean value){
    gameOver = value;
  }
  
  boolean isGameOver(){
    return gameOver;
  }
  
  void paint(){
    if(gameOver){
        image(images[imgCount], 0, 0);
      if(playSpeed > 1){
        imgCount = (imgCount >= images.length-1) ? 0 : imgCount + 1;
        playSpeed = 0;
      }
      else{
        playSpeed++;
      }
      textAlign(CENTER, CENTER);
      textSize(20);
      fill(254, 0, 0);
      text(String.format("Press space to try kickin my ass again!"), width/2, (height/2)+50); 
    }
  }
}
