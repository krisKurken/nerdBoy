
class Foe{
  
  PImage[] foeWalk = new PImage[9];
  PImage[] foeSpawn = new PImage[11];
  float[] coord = {random(displayWidth - (displayWidth/4), displayWidth + (displayWidth / 3)), displayHeight - (displayHeight/12)};
  int[] size = {0, 0};
  int imgCount = 0;
  int walkSpeed = 1;
  int spawn = 0;
  
  Foe(int w, int h){
    size[0] = w;
    size[1] = h;
  }

  float[] getCoord(){
    return coord;
  }
  
  int[] getSize(){
    return size;
  }
  
  void updatePos(int speed, SoundFile zombieSound){
    if(spawn >= foeSpawn.length){
      if(coord[0] < -(size[1] + 10)){
        coord[0] = random(width -(width/4), width + (width/3));
        spawn = 0;
        zombieSound.play();
      }
      coord[0] = coord[0] - (speed + (int)(speed*2));    
    }
  }
  
  void paint(int speed){
    if(spawn < foeSpawn.length){
      image(foeSpawn[spawn], coord[0], coord[1]-size[1]);
      if(walkSpeed > 6){
        walkSpeed = 1;
        spawn++;
      }
      else{
        walkSpeed += (speed);
      }
    }
    else{
      image(foeWalk[imgCount], coord[0], coord[1]-size[1]);
      if(walkSpeed > 5){
        imgCount = imgCount >= foeWalk.length-1 ? 0 : imgCount +1;
        walkSpeed = 1;
      }
      else{
        walkSpeed += speed;
      }
    }
  }
  
  void setImgCounter(int value){
    imgCount = value;
  }
  
  void loadWalkImg(String path, String fileEnding){
    for(int i = 0; i < foeWalk.length; i++){
      foeWalk[i] = loadImage(String.format("%s%d.%s",path, i, fileEnding));
      foeWalk[i].resize(size[0], size[1]);
    }
  }
  
  void loadSpawnImg(String path, String fileEnding){
    for(int i = 0; i < foeSpawn.length; i++){
      foeSpawn[i] = loadImage(String.format("%s%d.%s",path, i, fileEnding));
      foeSpawn[i].resize(size[0], size[1]);
    }
  }
  
  void reset(){
    spawn = 0;
    imgCount = 0;
    coord[0] = width -(width/4);
  }
  
}
