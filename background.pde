class Background{
  
  PImage bg;
  int groundPos = displayHeight-(displayHeight/12);
  int[] xPos = {0, 0};
  boolean firstRun = true;
  
  Background(int x1, int x2){
    xPos[0] = x1;
    xPos[1] = x2;
  }
  void reset(){
    firstRun = true;
    xPos[0] = 0;
    xPos[1] = 0;
  }
  
  void loadImg(String image){
    bg = loadImage(image);
    bg.resize(displayWidth, displayHeight);
  }
  
  void paint(){
    if(firstRun || xPos[0] <= (-width)){
      xPos[0] = xPos[1] + width;
      firstRun = false;
    }
    else if(xPos[1] <= (-width)){
      xPos[1] = xPos[0] + width;
    }
    else{
      xPos[0] -= speed;
      xPos[1] -= speed;
    }
    image(bg, xPos[0], 0, width, height);
    image(bg, xPos[1], 0, width, height);
  }
  
  int getGroundPos(){
    return groundPos;
  }
  
}
